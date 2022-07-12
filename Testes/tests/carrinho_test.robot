#Sessão para configuração, documemtação, imports de arquivos e library
* Settings *
Documentation       Arquivo de Testes para o Endpoint /carrinho
Resource            ../keywords/carrinho_keywords.robot
Suite Setup         Criar Sessao

#Sessão para criação dos cenários de teste
* Test Cases *
Cenario: GET Listar Todos os Carrinhos
    [tags]  GETALL
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenario: POST Cadastrar Carrinho 201
    [tags]  POSTCADCARRINHO
    Fazer login e Armazenar Token
    POST Endpoint /carrinhos
    Validar Status Code "201"

Cenario: POST Cadastrar Carrinho ERRO 400
    [tags]  POSTERRO
    Fazer login e Armazenar Token
    POST Endpoint /carrinhos
    Validar Status Code "400"

Cenario: POST Cadastrar Carrinho Token Ausente 401
    [tags]  POSTSEMTOKEN
    Fazer login e Armazenar Token
    POST Endpoint /carrinhos
    Validar Status Code "401"

Cenario: GET Buscar Carrinho por ID
    [tags]   GETID
    GET Endpoint /carrinhos ID
    Validar Status Code "200"

Cenario: DELETE Concluir Compra
    [tags]     CONCLUIRCOMPRA
    Fazer login e Armazenar Token
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "200"

Cenario: DELETE Excluir Carrinho
    [tags]     EXCLUIRCAR
    Fazer login e Armazenar Token
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "200"



