Certifique-se de ter as permissões necessárias para executar o script. Se o PowerShell estiver configurado para restringir a execução de scripts, você precisará alterar a política de execução temporariamente ou permanentemente para permitir a execução do script.

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

Isso permitirá que você execute o script atual somente para a sessão atual do PowerShell.

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine

Isso permitirá que você execute scripts em qualquer sessão do PowerShell no computador atual. Certifique-se de que você entende os riscos de permitir a execução de scripts não confiáveis antes de fazer isso.

Neste exemplo, é criada uma janela falsa de login do Windows que captura as credenciais inseridas pelo usuário. Em seguida, as credenciais são enviadas para um servidor de escuta através de uma conexão TCP.

Explicando o funcionamento do script:

Solicita ao usuário que digite seu nome de usuário e senha.

Envia as credenciais digitadas para um servidor externo, no caso um arquivo de log.

Abre a tela de login padrão do Windows para o usuário, simulando o bloqueio da tela.

Aguarda o usuário inserir novamente suas credenciais na tela de login do Windows.

Quando o usuário digita suas credenciais na tela de login do Windows, o sistema operacional verifica se as credenciais são válidas e as utiliza para fazer login no sistema.

Nesse momento, as credenciais digitadas pelo usuário são enviadas para o servidor externo, permitindo que o invasor tenha acesso às informações de login do usuário.
