*** Settings ***
Documentation       Cenário de testes do cadastro de usuários

Library     Browser

*** Test Cases ***
Deve poder cadastrar um novo usuário

    New Browser     browser=chromium    headless=False
    New Page        http://localhost:3000/signup

    # Tecnica Chekpoint (End-to-end)
    Wait For Elements State     xpath=//h1      visible     5
    Get Text                    xpath=//h1      equal       Faça seu cadastro

    Wait For Elements State     css=h1      visible     5
    Get Text                    css=h1      equal       Faça seu cadastro
    
    Sleep   3