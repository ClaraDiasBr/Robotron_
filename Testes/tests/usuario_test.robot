#Sessão para configuração, documemtação, imports de arquivos e library
* Settings *
Documentation   Arquivo de Testes para o Endpoint /usuarios
Resource        ../keywords/usuarios_keywords.robot

#Sessão para criação dos cenários de teste
* Test Cases *
#Cenario Usuarios
Cenario: GET Todos os Usuarios 200
    [tags]      GET
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    #Validar Quantidade "${9}"
    Printar Conteudo Response

Cenario: GET Buscar Usuario por ID
    [tags]  GETUSERID
    Criar Sessao
    Buscar Usuario por ID
    Validar Status Code "200"

Cenario: GET Buscar Usuario Nao Cadastrado por ID
    [tags]  GETUSERIDNAOCADASTRADO
    Criar Sessao
    Buscar Usuario Nao Cadastrado por ID
    Validar Status Code "400"

Cenario: POST Cadastrar Usuario 201
    [tags]      POST
    Criar Sessao
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenario: POST Cadastrar Usuario Email Utilizado 400
    [tags]  POSTMESMOEMAIL
    Criar Sessao
    # Criar Usuario Email Utilizado
    POST Email Utilizado Endpoint /usuarios
    Validar Status Code "400"

Cenario: POST Criar Usuario de Massa Estatica 201
    [tags]      POSTCRIARUSUARIOESTATICO
    Criar Sessao
    Criar Usuario Estatico Valido
    POST Endpoint /usuarios
    Validar Status Code "201"

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

Cenario: POST Cadastrar Usuario de Massa Dinamica 201
    [tags]      POSTDINAMICO
    Criar Sessao
    Cadastrar Usuario Dinamico Valido
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenario: DELETE Usuario 200
    [tags]      DELETE
    Criar Sessao
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenario: DELETE Usuario com Carrinho 400
    [tags]      DELETECOMCARRINHO
    Criar Sessao
    DELETE com Carrinho Endpoint /usuarios
    Validar Status Code "400"

Cenario: PUT Editar Usuario 200
    [tags]      PUT
    Criar Sessao
    PUT Endpoint /usuarios
    Validar Status Code "200"

Cenario: PUT Editar Usuario Nao Cadastrado 201
    [tags]      PUTNEWUSER
    Criar Sessao
    PUT Novo Usuario Endpoint /usuarios
    Validar Status Code "201"

Cenario: PUT Editar Usuario Email Utilizado 400
    [tags]      PUTEMAIL
    Criar Sessao
    PUT Email Utilizado Endpoint /usuarios
    Validar Status Code "400"


