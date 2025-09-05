*** Settings ***
Documentation    Keywords e Variaveis para Ações do Endpoint do Carrinho
Resource        ../suport/base.robot
Library          RequestsLibrary
Resource         ../suport/common/common.robot
Resource         login_keywords.robot
Resource         protudos_keywords.robot

*** Variables ***
${id_produto_carrinho}    # ID do produto para adicionar ao carrinho
${qtd_produto_carrinho}   2

*** Keywords ***
GET Endpoint /carrinhos
    ${response}    GET On Session    serverest    /carrinhos
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

GET Endpoint /carrinhos por ID
    ${response}    GET On Session    serverest    /carrinhos/${id_carrinho}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

POST Endpoint /carrinhos
    &{header}     Create Dictionary    Authorization=${token_auth}
    &{produto}    Create Dictionary    idProduto=${id_produto}    quantidade=${qtd_produto_carrinho}
    @{produtos}   Create List    ${produto}
    &{payload}    Create Dictionary    produtos=${produtos}
    ${response}   POST On Session    serverest    /carrinhos    json=${payload}    headers=${header}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /carrinhos/concluir-compra
    &{header}    Create Dictionary    Authorization=${token_auth}
    ${response}  DELETE On Session    serverest    /carrinhos/concluir-compra    headers=${header}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /carrinhos/cancelar-compra
    &{header}    Create Dictionary    Authorization=${token_auth}
    ${response}  DELETE On Session    serverest    /carrinhos/cancelar-compra    headers=${header}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

Validar Carrinho Criado
    Should Be Equal        ${response.json()["message"]}        Cadastro realizado com sucesso
    Should Not Be Empty    ${response.json()["_id"]}

Validar Compra Concluida
    Should Be Equal    ${response.json()["message"]}    Registro excluído com sucesso

Validar Compra Cancelada
    Should Be Equal    ${response.json()["message"]}    Registro excluído com sucesso. Estoque dos produtos reabastecido

Criar Carrinho e Armazenar ID
    POST Endpoint /carrinhos
    Validar Carrinho Criado
    ${id_carrinho}    Set Variable    ${response.json()["_id"]}
    Log To Console        ID do Carrinho Salvo: ${id_carrinho}
    Set Global Variable   ${id_carrinho}

Criar Carrinho Completo
    Fazer Login e Armazenar Token
    Criar Produto e Armazenar ID
    Criar Carrinho e Armazenar ID