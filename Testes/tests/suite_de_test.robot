* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs REST
Library         RequestsLibrary
Resource        keywords/usuarios_keywords.robot
Resource        keywords/login_keywords.robot
Resource        keywords/produtos_keywords.robot
Resource        keywords/carrinho_keywords.robot
Suite Setup         Criar Sessao

*Test Cases *
Cenario: Login, Cadastrar Carrinho e Concluir Compra
    [tags]  SUITE1
    Fazer login e Armazenar Token
    Criar Carrinho Valido
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "200"
