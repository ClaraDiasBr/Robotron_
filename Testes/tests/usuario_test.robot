#Sessão para configuração, documemtação, imports de arquivos e library
* Settings *
Documentation       Arquivo de Testes para o Endpoint /usuarios
Resource            ../keywords/usuarios_keywords.robot
Suite Setup         Criar Sessao

#Sessão para criação dos cenários de teste
* Test Cases *
#Cenario Usuarios
Cenario: GET Todos os Usuarios 200
    [tags]      GET
    GET Endpoint /usuarios
    Validar Status Code "200"
    #Validar Quantidade "${9}"
    Printar Conteudo Response

Cenario: GET Buscar Usuario por ID
    [tags]  GETUSERID
    Buscar Usuario por ID
    Validar Status Code "200"

Cenario: GET Buscar Usuario Nao Cadastrado por ID
    [tags]  GETUSERIDNAOCADASTRADO
    Buscar Usuario Nao Cadastrado por ID
    Validar Status Code "400"

Cenario: POST Cadastrar Usuario Dinamico 201
    [tags]      POSTDINAMICO
    Cadastrar Usuario Dinamico Valido
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenario: POST Cadastrar Usuario Email Utilizado 400
    [tags]  POSTMESMOEMAIL
    # Criar Usuario Email Utilizado
    Cadastrar Usuario Dinamico Valido
    POST Endpoint /usuarios
    POST Endpoint /usuarios
    Validar Status Code "400"

Cenario: POST Criar Usuario Sem nome 400
    [tags]  POSTCRIARUSERSEMNOME
    Criar Usuario Estatico Sem Nome
    POST Endpoint /usuarios
    Validar Status Code "400"

Cenario: POST Criar Usuario Sem Senha 400
    [tags]  POSTCRIARUSERSEMSENHA
    Criar Usuario Estatico Sem Senha
    POST Endpoint /usuarios
    Validar Status Code "400"

Cenario: POST Criar Usuario Sem Email 400
    [tags]  POSTCRIARUSERSEMEMAIL
    Criar Usuario Estatico Sem Email
    POST Endpoint /usuarios
    Validar Status Code "400"

Cenario: POST User NAO Admin
    [tags]  POSTUSERNAOADMIN
    Criar Usuario Estatico Nao Admin
    POST Endpoint /usuarios
    Validar Status Code "201"

Cenario: DELETE Usuario 200
    [tags]      DELETE
    Cadastrar Usuario Dinamico Valido
    POST Endpoint /usuarios
    Buscar Id do Usuario e Armazenar
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenario: DELETE Usuario com Carrinho 400
    [tags]      DELETECOMCARRINHO
    DELETE com Carrinho Endpoint /usuarios
    Validar Status Code "400"

Cenario: PUT Editar Usuario 200
    [tags]      PUT
    PUT Endpoint /usuarios
    Validar Status Code "200"

Cenario: PUT Editar Usuario Nao Cadastrado 201
    [tags]      PUTNEWUSER
    Cadastrar Usuario Dinamico Valido
    PUT Novo Usuario Endpoint /usuarios
    Validar Status Code "201"

Cenario: PUT Editar Usuario Email Utilizado 400
    [tags]      PUTEMAIL
    PUT Email Utilizado Endpoint /usuarios
    Validar Status Code "400"


