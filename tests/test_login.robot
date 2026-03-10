*** Settings ***
Resource    ../pages/login_page.robot

*** Test Cases ***

Login Com Sucesso
    Abrir Página de Login
    Preencher Credenciais    tomsmith    SuperSecretPassword!
    Clicar Login
    Validar Mensagem    You logged into a secure area!
    Fechar Navegador

Senha Incorreta
    Abrir Página de Login
    Preencher Credenciais    tomsmith    senhaErrada
    Clicar Login
    Validar Mensagem    Your password is invalid!
    Fechar Navegador

Usuário Incorreto
    Abrir Página de Login
    Preencher Credenciais    usuarioErrado    SuperSecretPassword!
    Clicar Login
    Validar Mensagem    Your username is invalid!
    Fechar Navegador

Campos Vazios
    Abrir Página de Login
    Preencher Credenciais    ${EMPTY}    ${EMPTY}
    Clicar Login
    Validar Mensagem    Your username is invalid!
    Fechar Navegador

    