*** Settings ***
Documentation    Testes para endpoints de usuários da API Reqres
Resource         ../resources/api_keywords.robot
Resource         ../resources/validation_keywords.robot
Suite Setup      Criar Sessao API
Suite Teardown   Delete All Sessions

*** Test Cases ***
CT001 - Criar Usuario Com Sucesso
    [Documentation]    Testa criação de usuário com dados válidos
    [Tags]    POST    users    smoke
    ${response}=    Criar Usuario    morpheus    leader
    Validar Usuario Criado    ${response}    morpheus    leader

CT002 - Listar Usuarios
    [Documentation]    Testa listagem de usuários
    [Tags]    GET    users    smoke
    ${response}=    Listar Usuarios
    Validar Lista Usuarios    ${response}

CT003 - Obter Usuario Por ID
    [Documentation]    Testa busca de usuário por ID específico
    [Tags]    GET    users
    ${response}=    Obter Usuario Por ID    2
    Validar Usuario Encontrado    ${response}    2

CT004 - Atualizar Usuario
    [Documentation]    Testa atualização de dados do usuário
    [Tags]    PUT    users
    ${response}=    Atualizar Usuario    2    morpheus    zion resident
    Validar Usuario Atualizado    ${response}    morpheus    zion resident

CT005 - Deletar Usuario
    [Documentation]    Testa exclusão de usuário
    [Tags]    DELETE    users
    ${response}=    Deletar Usuario    2
    Validar Usuario Deletado    ${response}

CT006 - Obter Usuario Inexistente
    [Documentation]    Testa busca por usuário que não existe
    [Tags]    GET    users    negative
    ${response}=    Run Keyword And Expect Error    *    Obter Usuario Por ID    23
    Should Contain    ${response}    404