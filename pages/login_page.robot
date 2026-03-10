*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://the-internet.herokuapp.com/login

*** Keywords ***
Abrir Página de Login
    Open Browser    ${URL}    chrome
    Maximize Browser Window

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