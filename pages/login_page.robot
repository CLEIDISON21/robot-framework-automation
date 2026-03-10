*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://the-internet.herokuapp.com/login
${BROWSER}    chromium
${HEADLESS}    ${True}

*** Keywords ***
Abrir Página de Login
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage

    Open Browser    ${URL}    ${BROWSER}    options=${options}

Preencher Credenciais
    [Arguments]    ${usuario}    ${senha}
    Input Text    id=username    ${usuario}
    Input Text    id=password    ${senha}

Clicar Login
    Click Button    xpath=//button[@type="submit"]

Validar Mensagem
    [Arguments]    ${mensagem}
    Page Should Contain    ${mensagem}

Fechar Navegador
    Close Browser