*** Settings ***
Documentation    Keywords para validações dos testes
Library          Collections

*** Keywords ***
Validar Status Code
    [Documentation]    Valida se o status code está correto
    [Arguments]    ${response}    ${expected_status}
    Should Be Equal As Numbers    ${response.status_code}    ${expected_status}

Validar Campo Obrigatorio
    [Documentation]    Valida se um campo específico existe na resposta
    [Arguments]    ${response}    ${field_name}
    ${json_response}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json_response}    ${field_name}
    Should Not Be Empty    ${json_response}[${field_name}]

Validar Usuario Criado
    [Documentation]    Valida se o usuário foi criado corretamente
    [Arguments]    ${response}    ${expected_name}    ${expected_job}
    Validar Status Code    ${response}    201
    ${json_response}=    Set Variable    ${response.json()}
    Should Be Equal    ${json_response}[name]    ${expected_name}
    Should Be Equal    ${json_response}[job]    ${expected_job}
    Validar Campo Obrigatorio    ${response}    id
    Validar Campo Obrigatorio    ${response}    createdAt

Validar Login Sucesso
    [Documentation]    Valida se o login foi realizado com sucesso
    [Arguments]    ${response}
    Validar Status Code    ${response}    200
    Validar Campo Obrigatorio    ${response}    token

Validar Usuario Encontrado
    [Documentation]    Valida se o usuário foi encontrado
    [Arguments]    ${response}    ${expected_id}
    Validar Status Code    ${response}    200
    ${json_response}=    Set Variable    ${response.json()}
    Should Be Equal As Numbers    ${json_response}[data][id]    ${expected_id}

Validar Lista Usuarios
    [Documentation]    Valida se a lista de usuários foi retornada
    [Arguments]    ${response}
    Validar Status Code    ${response}    200
    ${json_response}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json_response}    data
    Should Not Be Empty    ${json_response}[data]

Validar Usuario Atualizado
    [Documentation]    Valida se o usuário foi atualizado
    [Arguments]    ${response}    ${expected_name}    ${expected_job}
    Validar Status Code    ${response}    200
    ${json_response}=    Set Variable    ${response.json()}
    Should Be Equal    ${json_response}[name]    ${expected_name}
    Should Be Equal    ${json_response}[job]    ${expected_job}
    Validar Campo Obrigatorio    ${response}    updatedAt

Validar Usuario Deletado
    [Documentation]    Valida se o usuário foi deletado
    [Arguments]    ${response}
    Validar Status Code    ${response}    204