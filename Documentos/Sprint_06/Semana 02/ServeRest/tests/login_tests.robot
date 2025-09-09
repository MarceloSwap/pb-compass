*** Settings ***
Documentation            Testes para Endpoint /login
Resource    ../keywords/login_keywords.robot
Resource    ../suport/base.robot

Suite Setup    Criar Sessao

*** Test Cases ***
Cenario: POST Realizar Login 200
    [tags]    POSTLOGIN
    POST Endpoint /login
    Validar Status Code    ${response}    200