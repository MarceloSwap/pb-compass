*** Settings ***
Documentation    Testes para autenticação da API Reqres
Resource         ../resources/api_keywords.robot
Resource         ../resources/validation_keywords.robot
Suite Setup      Criar Sessao API
Suite Teardown   Delete All Sessions

*** Test Cases ***
CT007 - Login Com Sucesso
    [Documentation]    Testa login com credenciais válidas
    [Tags]    POST    auth    smoke
    ${response}=    Fazer Login
    Validar Login Sucesso    ${response}

CT008 - Registrar Usuario Com Sucesso
    [Documentation]    Testa registro de novo usuário
    [Tags]    POST    auth
    ${response}=    Registrar Usuario
    Validar Status Code    ${response}    200
    Validar Campo Obrigatorio    ${response}    token

CT009 - Logout Com Sucesso
    [Documentation]    Testa logout do sistema
    [Tags]    POST    auth
    ${response}=    Fazer Logout
    Validar Status Code    ${response}    200

CT010 - Login Com Email Invalido
    [Documentation]    Testa login com email inválido
    [Tags]    POST    auth    negative
    ${response}=    Run Keyword And Expect Error    *
    ...    Fazer Login    email_invalido@test.com    senha123
    Should Contain Any    ${response}    400    401

CT011 - Login Sem Senha
    [Documentation]    Testa login sem informar senha
    [Tags]    POST    auth    negative
    ${response}=    Run Keyword And Expect Error    *
    ...    Fazer Login    eve.holt@reqres.in    ${EMPTY}
    Should Contain Any    ${response}    400    401