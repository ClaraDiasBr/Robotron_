* Settings *
Documentation       Suites de Testes para requisições HTTP na APIs ServeRest
Resource            ../support/base.robot
Suite Setup         Criar Sessao

*Test Cases *
Cenario: DELETE Concluir Compra 200
    [tags]    FL   ST01
    Criar Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios
    GET Endpoint /usuarios ID
    POST Endpoint /login
    Fazer login e Armazenar Token
    Criar Carrinho Valido
    POST Endpoint /carrinhos
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "200"

Cenario: DELETE Excluir Carrinho 200
    [tags]    FL   ST02
    Criar Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios
    GET Endpoint /usuarios ID
    POST Endpoint /login
    Fazer login e Armazenar Token
    Criar Carrinho Valido
    POST Endpoint /carrinhos 
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "200"

