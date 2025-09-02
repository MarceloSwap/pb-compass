*** Settings ***
Documentation    Keywords e Variaveis para Ações do Endpoint do Usuarios
Library          RequestsLibrary
Resource         common.robot

*** Variables ***
${username}      UserTest000
${email}         usertest000@mail.com.br
${password}      test000serverest


*** Keywords ***
GET Endpoint /usuarios
    ${response}    GET On Session    serverest    /usuarios
    Set Global Variable    ${response}

POST Endpoint /usuarios 
    ${response}       POST On Session    serverest    /usuarios    json=&{playload}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

PUT Endpoint /usuarios
    &{playload}       Create Dictionary    nome=Friedrich Nietzsche    email=nietzsche@gmail.com
    ${response}    PUT On Session       serverest           /usuarios    json=&{playload}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /usuarios
    ${response}            DELETE On Session    serverest    /usuarios/'falta setar o ID'
    Log To Console         Response: ${response.content}
    Set Global Variable    ${response}

#Verifica a quantidade de usários cadastrados é igual a 2
Validar Quantidade "${quantidade}"
    Should Be Equal    ${response.json()["quantidade"]}    ${quantidade}

#Verifica se tem uma palavra no response
Validar Se Mensagem Contem "${palabra}"
    Should Contain    ${response.json()["message"]}    ${palabra}

Printar Conteudo Response
    Log To Console    ${response.json()}
    #pegar um usuario específico de acordo com o indice   
    #Log To Console    ${response.json()["usuarios"][0]["nome"]}

# Usando JSON
Criar Usuario Estatico Valido
    ${json}                Importar JSON Estatico    json_usuario_ex.json    # qual arquivo json possui os objetos que eu preciso
    ${playload}            Set Variable    ${json['user_valido']}        # pega apenas o objeto 'user_valido'
    Set Global Variable    ${playload}                                   # Armazena em uma variável global pra ser usado
    POST Endpoint /usuarios


