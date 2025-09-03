*** Settings ***
Documentation    Keywords e Variaveis Geração de Dados Aleatórios
Library          FakerLibrary        # Só funciona dentro de keywords

*** Variables ***

*** Keywords ***
Criar Dados Usuarios Validos
    ${nome}           FakerLibrary.Name
    ${email}          FakerLibrary.Email
    ${playload}       Create Dictionary    nome=${nome}   email=${email}    password=senha123    administrador=true
    Log To Console    ${playload}
    [return]          ${playload}