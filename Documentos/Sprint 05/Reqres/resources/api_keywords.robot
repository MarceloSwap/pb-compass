*** Settings ***
Documentation    Keywords para interação com a API Reqres
Resource         config.robot

*** Keywords ***
Criar Sessao API
    [Documentation]    Cria sessão HTTP para a API Reqres
    ${headers}=    Create Dictionary
    ...    Content-Type=application/json
    ...    x-api-key=reqres-free-v1
    Create Session    reqres_api    ${BASE_URL}    headers=${headers}    verify=${False}

# ========== KEYWORDS POST ==========
Criar Usuario
    [Documentation]    Cria um novo usuário
    [Arguments]    ${name}=morpheus    ${job}=leader
    ${payload}=    Create Dictionary    name=${name}    job=${job}
    ${response}=    POST On Session    reqres_api    /users    json=${payload}
    RETURN    ${response}

Fazer Login
    [Documentation]    Realiza login com credenciais válidas
    [Arguments]    ${email}=${VALID_EMAIL}    ${password}=${VALID_PASSWORD}
    ${payload}=    Create Dictionary    email=${email}    password=${password}
    ${response}=    POST On Session    reqres_api    /login    json=${payload}
    RETURN    ${response}

Registrar Usuario
    [Documentation]    Registra um novo usuário
    [Arguments]    ${email}=${VALID_EMAIL}    ${password}=${VALID_PASSWORD}
    ${payload}=    Create Dictionary    email=${email}    password=${password}
    ${response}=    POST On Session    reqres_api    /register    json=${payload}
    RETURN    ${response}

Fazer Logout
    [Documentation]    Realiza logout
    ${payload}=    Create Dictionary    token=QpwL5tke4Pnpja7X4
    ${response}=    POST On Session    reqres_api    /logout    json=${payload}
    RETURN    ${response}

# ========== KEYWORDS GET ==========
Listar Usuarios
    [Documentation]    Lista todos os usuários
    [Arguments]    ${page}=1
    ${response}=    GET On Session    reqres_api    /users    params=page=${page}
    RETURN    ${response}

Obter Usuario Por ID
    [Documentation]    Obtém usuário específico por ID
    [Arguments]    ${user_id}
    ${response}=    GET On Session    reqres_api    /users/${user_id}
    RETURN    ${response}

Listar Resources
    [Documentation]    Lista todos os resources
    ${response}=    GET On Session    reqres_api    /unknown
    RETURN    ${response}

# ========== KEYWORDS PUT ==========
Atualizar Usuario
    [Documentation]    Atualiza dados de um usuário
    [Arguments]    ${user_id}    ${name}    ${job}
    ${payload}=    Create Dictionary    name=${name}    job=${job}
    ${response}=    PUT On Session    reqres_api    /users/${user_id}    json=${payload}
    RETURN    ${response}

# ========== KEYWORDS DELETE ==========
Deletar Usuario
    [Documentation]    Deleta um usuário
    [Arguments]    ${user_id}
    ${response}=    DELETE On Session    reqres_api    /users/${user_id}
    RETURN    ${response}