*** Settings ***
Library    DatabaseLibrary

*** Variables ***
${DB_PATH}    ${CURDIR}/../test.db

*** Test Cases ***
Validar Usuario No Banco
    Connect To Database    sqlite3    ${DB_PATH}
    ${resultado}=    Query    SELECT nome FROM usuarios WHERE id=1
    Log    ${resultado}
    Should Be Equal    ${resultado[0][0]}    Cleidison
    Disconnect From Database