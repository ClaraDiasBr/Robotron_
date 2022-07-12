#Sessão para configuração, documemtação, imports de arquivos e library
* Settings *
Documentation       Arquivo de Testes para o Endpoint /carrinho
Resource            ../keywords/carrinho_keywords.robot
Suite Setup         Criar Sessao

#Sessão para criação dos cenários de teste
* Test Cases *
Cenario: GET Listar Todos os Carrinhos 200
    [tags]  GET    GETALL
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenario: GET Buscar Carrinho por ID 200
    [tags]  GET    GETID
    GET Endpoint /carrinhos ID    ${id_carrinho_fixo}
    Validar Status Code "200"

Cenario: GET Buscar Carrinho ID Invalido 400
    [tags]  GET    GETINVALIDO
    GET Endpoint /carrinhos ID    ${id_invalido}
    Validar Status Code "400"

Cenario: POST Cadastrar Carrinho 201
    [tags]   POST     POSTCADCARRINHO
    Criar Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios
    GET Endpoint /usuarios ID
    POST Endpoint /login
    Fazer login e Armazenar Token
    Criar Carrinho Valido
    POST Endpoint /carrinhos
    Validar Status Code "201"

Cenario: POST Cadastrar Carrinho ERRO 400
    [tags]   POST     POSTERRO
    POST Endpoint /login  ${email_para_login}   ${password_para_login}
    Fazer login e Armazenar Token
    Criar Carrinho Valido
    POST Endpoint /carrinhos
    Validar Status Code "400"

Cenario: POST Cadastrar Carrinho Token Ausente 401
    [tags]   POST        POSTSEMTOKEN
    POST Endpoint /login  ${email_para_login}   ${password_para_login}
    Fazer login e Armazenar Token    
    Criar Carrinho Valido
    POST Endpoint /carrinhos      ${inv_token_auth}
    Validar Status Code "401"

Cenario: DELETE Concluir Compra 200
    [tags]    DELETE      CONCLUIRCOMPRA
    Criar Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios
    GET Endpoint /usuarios ID
    POST Endpoint /login
    Fazer login e Armazenar Token
    Criar Carrinho Valido
    POST Endpoint /carrinhos
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "200"

Cenario: DELETE ERRO Concluir Compra 401
    [tags]    DELETE      ERROCONCLUIRCOMPRA
    Criar Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios
    GET Endpoint /usuarios ID
    POST Endpoint /login
    Fazer login e Armazenar Token
    Criar Carrinho Valido
    POST Endpoint /carrinhos    
    DELETE Endpoint /carrinhos/concluir-compra    ${inv_token_auth}
    Validar Status Code "401"

Cenario: DELETE Excluir Carrinho 200
    [tags]    DELETE     EXCLUIRCAR
    Criar Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios
    GET Endpoint /usuarios ID
    POST Endpoint /login
    Fazer login e Armazenar Token
    Criar Carrinho Valido
    POST Endpoint /carrinhos 
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "200"

Cenario: DELETE ERRO Excluir Carrinho 200
    [tags]    DELETE     ERROEXCLUIRCAR
    Criar Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios
    GET Endpoint /usuarios ID
    POST Endpoint /login
    Fazer login e Armazenar Token
    Criar Carrinho Valido
    POST Endpoint /carrinhos 
    DELETE Endpoint /carrinhos/cancelar-compra    ${inv_token_auth}
    Validar Status Code "401"


