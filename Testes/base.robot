#Sessão para configuração, documemtação, imports de arquivos e library
* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs REST
Library         RequestsLibrary
Resource        keywords/usuarios_keywords.robot
Resource        keywords/login_keywords.robot
Resource        keywords/produtos_keywords.robot

#Sessão para criação dos cenários de teste
* Test Cases *
#Cenario Usuarios
Cenario: GET Todos os Usuarios 200
    [tags]      GET
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Quantidade "${6}"
    Printar Conteudo Response

Cenario: POST Cadastrar Usuario 201
    [tags]      POST
    Criar Sessao
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenario: PUT Editar Usuario 200
    [tags]      PUT
    Criar Sessao
    PUT Endpoint /usuarios
    Validar Status Code "200"

Cenario: DELETE Usuario 200
    [tags]      DELETE
    Criar Sessao
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenario: POST Criar Usuario de Massa Estatica 201
    [tags]      POSTCRIARUSUARIOESTATICO
    Criar Sessao
    Criar Usuario Estatico Valido
    Validar Status Code "201"

Cenario: Buscar Usuario por ID
    [tags]  GETUSERID
    Criar Sessao
    Buscar Usuario por ID
    Validar Status Code "200"

Cenario: POST Criar Usuario Invalido de Massa Estatica 400
    [tags]  POSTCRIARUSERINVALIDO
    Criar Sessao
    Criar Usuario Estatico Invalido
    Validar Status Code "400"

# Cenario Login
Cenario: POST Realizar Login 200
    [tags]      POSTLOGIN
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "200"
# Cenario Produtos
Cenario: POST Criar Produto
    [tags]      POSTPRODUTO
    Criar Sessao
    Fazer login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"

Cenario: DELETE Excluir Produto 200
    [tags]  DELETEPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"


