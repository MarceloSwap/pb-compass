*** Settings ***
Documentation   Keywords e Variaveis para Ações do Endpoint do Usuarios
Resource        ../suport/base.robot

*** Keywords ***
GET Endpoint /usuarios
    ${response}    GET On Session    serverest    /usuarios
    Set Global Variable    ${response}

POST Endpoint /usuarios
    ${response}       POST On Session    serverest    /usuarios    json=&{playload}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

PUT Endpoint /usuarios
    ${response}    PUT On Session       serverest        /usuarios/${response.json()["_id"]}    json=&{playload}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /usuarios
    ${response}            DELETE On Session    serverest    /usuarios/${response.json()["_id"]}
    Log To Console         Response: ${response.content}
    Set Global Variable    ${response}

#Verifica a quantidade de usários cadastrados é igual a 2
Validar Quantidade "${quantidade}"
    Should Be Equal    ${response.json()["quantidade"]}    ${quantidade}

# Usando JSON
Pegar Dados Usuario Estatico Valido
    ${json}                Importar JSON Estatico    json_usuario_ex.json    # qual arquivo json possui os objetos que eu preciso
    ${playload}            Set Variable    ${json['user_valido']}            # pega apenas o objeto 'user_valido'
    Set Global Variable    ${playload}                                       # Armazena em uma variável global pra ser usado

