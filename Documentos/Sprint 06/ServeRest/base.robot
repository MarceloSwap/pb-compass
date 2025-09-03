*** Settings ***
Documentation    Arquivo base para estudo do Robotframeworks para teste de APIs
Library          RequestsLibrary
Resource         ./common.robot
Resource         ./usuarios_keywords.robot
Resource         ./login_keywords.robot
Resource         ./protudos_keywords.robot


*** Test Cases ***
Cenario: GET Todos os Usuarios 200
    [tags]    GET
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Quantidade "${32}"
    Printar Conteudo Response

Cenario: POST Cadastrar Usuario 201
    [tags]    POST
    Criar Sessao
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenario: PUT Editar Usuario 200
    [tags]    PUT
    Criar Sessao
    PUT Endpoint /usuarios
    Validar Status Code "200"
    
Cenario: DELETE Deletar Usuario 200
    [tags]    DELETE
    Criar Sessao
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenario: POST Realizar Login 200
    [tags]    POSTLOGIN
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "200"

Cenario: POST Criar Produto 201
    [tags]    POSTPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"
 
Cenario: DELETE Excluir Produto 200
    [tags]    DELETE-PRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"

Cenario: POST Criar Usuario de Massa Estatica 201
    [tags]    POST-CRIAR-USUARIO-ESTATICO
    Criar Sessao
    Cadastrar Usuario Estatico Valido
    Validar Status Code "201"

Cenario: POST Criar Usuario de Massa Estatica 201
    [tags]    POST-CRIAR-USUARIO-DINAMICO
    Criar Sessao
    Cadastrar Usuario Dinamico Valido
    Validar Status Code "201"

#Sessão para criação de Keywords Personalizadas
*** Keywords ***
Criar Sessao
    Create Session    serverest    https://compassuol.serverest.dev


#robot -d ./results .\base.robot - para escolher pra onde vai os resultados
#robot -d ./results -i GET base.robot - executa por tag

#Rodar o login: robot -d ./login_report -i POSTLOGIN base.robot
