*** Settings ***
Documentation            Keywords e Variaveis para Ações do Endpoint do Login
Library          RequestsLibrary
Resource         common.robot

*** Variables ***
${email_para_loggin}       fulano@qa.com
${password_para_login}     teste


*** Keywords ***
POST Endpoint /login
    &{payload}    Create Dictionary    email=${email_para_loggin}    password=${password_para_login}
    ${response}    POST On Session    serverest    /login    data=${payload}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

Validar Ter Logado
    Should Be Equal        ${response.json()["message"]}        Login realizado com sucesso
    Should Not Be Empty    ${response.json()["authorization"]}

Fazer Login e Armazenar Token
    POST Endpoint /login
    Validar Ter Logado
    ${token_auth}    Set Variable    ${response.json()["authorization"]}
    Log To Console         Token Salvo: ${token_auth}
    Set Global Variable    ${token_auth}