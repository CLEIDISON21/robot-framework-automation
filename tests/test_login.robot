*** Settings ***
Resource    ../pages/login_page.robot

*** Test Cases ***

Login Com Sucesso
    [Tags]    skip
    Abrir Página de Login
    Preencher Credenciais    tomsmith    SuperSecretPassword!
    Clicar Login
    Validar Mensagem    You logged into a secure area!
    Fechar Navegador

Senha Incorreta
    [Tags]    skip
    Abrir Página de Login
    Preencher Credenciais    tomsmith    senhaErrada
    Clicar Login
    Validar Mensagem    Your password is invalid!
    Fechar Navegador

Usuário Incorreto
    [Tags]    skip
    Abrir Página de Login
    Preencher Credenciais    usuarioErrado    SuperSecretPassword!
    Clicar Login
    Validar Mensagem    Your username is invalid!
    Fechar Navegador

Campos Vazios
    [Tags]    skip
    Abrir Página de Login
    Preencher Credenciais    ${EMPTY}    ${EMPTY}
    Clicar Login
    Validar Mensagem    Your username is invalid!
    Fechar Navegador