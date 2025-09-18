*** Settings ***
Documentation            Testes para Endpoint /usuarios
Resource    ../keywords/usuarios_keywords.robot
Resource    ../keywords/carrinho_keywords.robot

Suite Setup    Criar Sessao

*** Test Cases ***
Cenario: GET Todos os Usuarios 200
    [tags]    GET-USUARIOS
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenario: POST Cadastrar Usuario 201
    [tags]    POST-USUARIO
    Criar Dados Usuarios Validos        #Tem que criar primeiro
    POST Endpoint /usuarios            # Depois consumir o playload
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenario: PUT Editar Usuario 200
    [tags]    PUT-USUARIO
    Criar Dados Usuarios Validos
    POST Endpoint /usuarios
    PUT Endpoint /usuarios
    Validar Status Code "200"
    
Cenario: DELETE Deletar Usuario 200
    [tags]    DELETE-USUARIO
    Criar Dados Usuarios Validos
    POST Endpoint /usuarios
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenario: POST Criar Usuario de Massa Estatica 201
    [tags]    POST-CRIAR-USUARIO-ESTATICO
    Pegar Dados Usuario Estatico Valido
    POST Endpoint /usuarios
    Validar Status Code "201"

Cenario: POST Criar Usuario de Massa Estatica 201
    [tags]    POST-CRIAR-USUARIO-DINAMICO
    Criar Dados Usuarios Validos
    POST Endpoint /usuarios
    Validar Status Code "201"


    
#robot -d ./results .\base.robot - para escolher pra onde vai os resultados
#robot -d ./results -i GET base.robot - executa por tag

#Rodar o login: robot -d ./login_report -i POSTLOGIN base.robot
