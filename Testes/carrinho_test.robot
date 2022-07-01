#Sessão para configuração, documemtação, imports de arquivos e library
* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs REST
Library         RequestsLibrary
Resource        keywords/usuarios_keywords.robot
Resource        keywords/login_keywords.robot
Resource        keywords/produtos_keywords.robot
Resource        keywords/carrinho_keywords.robot

#Sessão para criação dos cenários de teste
* Test Cases *
Cenario: GET Listar Todos os Carrinhos
    [tags]  GETALL
    Criar Sessao
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenario: POST Cadastrar Carrinho
    [tags]  POSTCADCARRINHO
    Criar Sessao
    Fazer login e Armazenar Token
    POST Endpoint /carrinhos
    Validar Status Code "201"

Cenario: GET Buscar Carrinho por ID
    [tags]   GETID
    Criar Sessao
    GET Endpoint /carrinhos ID
    Validar Status Code "200"

Cenario: DELETE Concluir Compra
    [tags]     CONCLUIRCOMPRA
    Criar Sessao
    Fazer login e Armazenar Token
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "200"

Cenario: DELETE Excluir Carrinho
    [tags]     EXCLUIRCAR
    Criar Sessao
    Fazer login e Armazenar Token
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "200"



