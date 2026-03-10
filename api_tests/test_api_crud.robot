*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***

Criar Usuario
    Create Session    api    ${BASE_URL}
    ${body}=    Create Dictionary    name=Cleidison    username=testeqa    email=teste@email.com
    ${response}=    POST On Session    api    /users    json=${body}
    Status Should Be    201    ${response}

Buscar Usuario
    Create Session    api    ${BASE_URL}
    ${response}=    GET On Session    api    /users/1
    Status Should Be    200    ${response}
    Should Contain    ${response.text}    Leanne Graham

Atualizar Usuario
    Create Session    api    ${BASE_URL}
    ${body}=    Create Dictionary    name=Cleidison Atualizado
    ${response}=    PUT On Session    api    /users/1    json=${body}
    Status Should Be    200    ${response}

Deletar Usuario
    Create Session    api    ${BASE_URL}
    ${response}=    DELETE On Session    api    /users/1
    Status Should Be    200    ${response}
