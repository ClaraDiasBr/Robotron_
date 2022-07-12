#Sessão para configuração, documemtação, imports de arquivos e library
* Settings *
Documentation       Arquivo de Testes para o Endpoint /usuarios
Resource            ../keywords/usuarios_keywords.robot
Suite Setup         Criar Sessao

#Sessão para criação dos cenários de teste
* Test Cases *
#Cenario Usuarios
Cenario: GET Todos os Usuarios 200
    [tags]   GET     GETALL
    GET Endpoint /usuarios
    Quantidade Usuarios Cadastrados
    Validar Status Code "200"

Cenario: GET Buscar Usuario por ID
    [tags]  GET       GETUSERID
    Criar Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios
    GET Endpoint /usuarios ID
    Validar Status Code "200"

Cenario: GET Buscar Usuario Nao Cadastrado por ID
    [tags]  GET        GETUSERIDNAOCADASTRADO
    GET Endpoint /usuarios ID    ${id_invalido}
    Validar Status Code "400"

Cenario: POST Cadastrar Usuario Dinamico 201
    [tags]   POST     POSTDINAMICO
    Criar Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenario: POST Cadastrar Usuario Email Utilizado 400
    [tags]  POST       POSTMESMOEMAIL
    Criar Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios
    POST Endpoint /usuarios
    Validar Status Code "400"

Cenario: POST Criar Usuario Sem nome 400
    [tags]  POST         POSTCRIARUSERSEMNOME
    Pegar Usuario Estatico Sem Nome
    POST Endpoint /usuarios
    Validar Status Code "400"

Cenario: POST Criar Usuario Sem Senha 400
    [tags]  POST            POSTCRIARUSERSEMSENHA
    Pegar Usuario Estatico Sem Senha
    POST Endpoint /usuarios
    Validar Status Code "400"

Cenario: POST Criar Usuario Sem Email 400
    [tags]  POST            POSTCRIARUSERSEMEMAIL
    Pegar Usuario Estatico Sem Email
    POST Endpoint /usuarios
    Validar Status Code "400"

Cenario: POST User NAO Admin
    [tags]  POST             POSTUSERNAOADMIN
    Criar Dados Dinamicos Usuario Nao ADMIN Valido
    POST Endpoint /usuarios
    Validar Status Code "201"

Cenario: DELETE Usuario 200
    [tags]  DELETE     DELETEUSER
    Criar Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenario: DELETE Usuario com Carrinho 400
    [tags]  DELETE     DELETECOMCARRINHO
    DELETE Endpoint /usuarios  ${id_user_carrinho}
    Validar Status Code "400"

Cenario: PUT Editar Usuario 200
    [tags]   PUT     PUTUSER
    Criar Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios
    PUT Endpoint /usuarios
    Validar Status Code "200"

Cenario: PUT Editar Usuario Nao Cadastrado 201
    [tags]   PUT     PUTNEWUSER
    Criar Dados Dinamicos Usuario Valido
    PUT Endpoint /usuarios   ${id_invalido}
    Validar Status Code "201"

Cenario: PUT Editar Usuario Email Utilizado 400
    [tags]   PUT    PUTEMAIL
    Criar Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios
    PUT Endpoint /usuarios    ${id_invalido}
    Validar Status Code "400"


