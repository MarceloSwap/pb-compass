*** Settings ***
Documentation    Keywords e Variaveis para Ações Gerais
Library          OperatingSystem


*** Variables ***

*** Keywords ***
Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

Importar JSON Estatico
    [Arguments]    ${nome_arquivo}
    ${arquivo}      GET File        ${EXECDIR}/${nome_arquivo}                #pega os arquivos JSON e armazena na variável arquivo
    ${dadosJson}    Evaluate        json.loads('''${arquivo}''')    json      #formata e guarda na variável dadosJson
    [return]    ${dadosJson}