*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://the-internet.herokuapp.com/login

*** Keywords ***
Abrir Página de Login
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --window-size=1920,1080

    Create Webdriver    Chrome    options=${options}
    Go To    ${URL}

Preencher Credenciais
    [Arguments]    ${usuario}    ${senha}
    Input Text    id=username    ${usuario}
    Input Text    id=password    ${senha}

Clicar Login
    Click Button    css=button[type="submit"]

Validar Mensagem
    [Arguments]    ${mensagem}
    Wait Until Page Contains    ${mensagem}    timeout=5s

Fechar Navegador
    Close Browser