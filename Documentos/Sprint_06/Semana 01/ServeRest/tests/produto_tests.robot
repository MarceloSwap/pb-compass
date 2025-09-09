*** Settings ***
Documentation            Testes para Endpoint /produtos
Resource    ../keywords/protudos_keywords.robot

Suite Setup    Criar Sessao

*** Test Cases ***
Cenario: POST Criar Produto 201
    [tags]    POSTPRODUTO
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"
 
Cenario: DELETE Excluir Produto 200
    [tags]    DELETE-PRODUTO
    Fazer Login e Armazenar Token
    Criar Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"