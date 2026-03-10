*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Testar API Usuarios
    Create Session    api    ${BASE_URL}
    ${response}=    GET On Session    api    /users/1
    Status Should Be    200    ${response}
    Should Contain    ${response.text}    Leanne Graham
