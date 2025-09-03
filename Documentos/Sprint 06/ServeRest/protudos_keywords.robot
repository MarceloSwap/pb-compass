*** Settings ***
Documentation            Keywords e Variaveis para Ações do Endpoint do Produto
Library          RequestsLibrary
Resource         common.robot
Resource         login_keywords.robot


*** Variables ***
${nome_produto}         XP-PEN007
${preco_produto}        325
${descricao_produto}    Experiência natural com a caneta na tela: a tela usa a tecnologia de gravação AG
${qtd_produto}          5

*** Keywords ***
POST Endpoint /produtos
    &{header}    Create Dictionary    Authorization=${token_auth}
    &{payload}   Create Dictionary    nome=${nome_produto}    preco=${preco_produto}    descricao=${descricao_produto}    quantidade=${qtd_produto}
    ${response}  POST On Session    serverest    /produtos    data=${payload}    headers=${header}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /produtos
    &{header}    Create Dictionary    Authorization=${token_auth}
    ${response}  DELETE On Session    serverest    /produtos/${id_produto}    headers=${header}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}



Validar Ter Criado Produto
    Should Be Equal        ${response.json()["message"]}        Cadastro realizado com sucesso
    Should Not Be Empty    ${response.json()["_id"]}

Criar Produto e Armazenar ID
    POST Endpoint /produtos
    Validar Ter Criado Produto
    ${id_produto}    Set Variable    ${response.json()["_id"]}
    Log To Console         Id do Produto Salvo: ${id_produto}
    Set Global Variable    ${id_produto}