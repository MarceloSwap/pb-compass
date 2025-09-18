*** Settings ***
Documentation    Arquivo simples para requisição HTTP
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem
Library     FakerLibrary
Resource    ./common/common.robot
Resource    ./fixtures/dynamics.robot
Resource    ./variaveis/serveres_variaveis.robot

#Sessão para criação de Keywords Personalizadas
*** Keywords ***
Criar Sessao
    Create Session    serverest    ${BASE_URI}

Validar Status Code
    [Documentation]    Valida se o status code está correto
    [Arguments]    ${response}    ${expected_status}
    Should Be Equal As Numbers    ${response.status_code}    ${expected_status}