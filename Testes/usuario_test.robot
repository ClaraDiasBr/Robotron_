#Sessão para configuração, documemtação, imports de arquivos e library
* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs REST
Library         RequestsLibrary
Resource        keywords/usuarios_keywords.robot

#Sessão para criação dos cenários de teste
* Test Cases *
#Cenario Usuarios
Cenario: GET Todos os Usuarios 200
    [tags]      GET
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Quantidade "${9}"
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
    POST Endpoint /usuarios
    Validar Status Code "201"
#####################################################
Cenario: Buscar Usuario por ID
    [tags]  GETUSERID
    Criar Sessao
    Buscar Usuario por ID
    Validar Status Code "200"

Cenario: Buscar Usuario Nao Cadastrado por ID
    [tags]  GETUSERIDNAOCADASTRADO
    Criar Sessao
    Buscar Usuario Nao Cadastrado por ID
    Validar Status Code "400"

Cenario: POST Criar Usuario Invalido Sem nome 400
    [tags]  POSTCRIARUSERSEMNOME
    Criar Sessao
    Criar Usuario Estatico Invalido Sem Nome
    POST Invalido Endpoint /usuarios
    Validar Status Code "400"

Cenario: POST Criar Usuario Sem Senha 400
    [tags]  POSTCRIARUSERSEMSENHA
    Criar Sessao
    Criar Usuario Estatico Sem Senha
    POST Invalido Endpoint /usuarios
    Validar Status Code "400"

Cenario: POST Criar Usuario Sem Email 400
    [tags]  POSTCRIARUSERSEMEMAIL
    Criar Sessao
    Criar Usuario Estatico Sem Email
    POST Invalido Endpoint /usuarios
    Validar Status Code "400"

Cenario: POST User NAO Admin
    [tags]  POSTUSERNAOADMIN
    Criar Sessao
    Criar Usuario Estatico Nao Admin
    POST Endpoint /usuarios
    Validar Status Code "201"


