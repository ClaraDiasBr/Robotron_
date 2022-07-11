#Sessão para configuração, documemtação, imports de arquivos e library
* Settings *
Documentation   Arquivo de Testes para o Endpoint /produtos
Resource            ../keywords/produtos_keywords.robot

#Sessão para criação dos cenários de teste
* Test Cases *
# Cenario Produtos
Cenario: GET Listar Produtos 200
    [tags]  GETALL
    Criar Sessao
    Fazer login e Armazenar Token
    GET Endpoint /produtos
    Validar Status Code "200"

Cenario: POST Cadastrar Produto 201
    [tags]      POSTPRODUTO
    Criar Sessao
    Fazer login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"

Cenario: POST Cadastrar o Mesmo Produto 400
    [tags]      POSTMESMOPRODUTO
    Criar Sessao
    Fazer login e Armazenar Token
    POST ja Cadastrado Endpoint /produtos
    Validar Status Code "400"

Cenario: POST Cadastrar Produto Token Ausente 401
    [tags]     POSTAUSENTE
    Criar Sessao
    Fazer login e Armazenar Token
    POST Token Ausente Endpoint /produtos
    Validar Status Code "401"

Cenario: POST Cadastrar Produto Nao Admin 403
    [tags]      POSTPRODUTONADMIN
    Criar Sessao
    Fazer login Nao Admin e Armazenar Token
    POST User Nao Admin Endpoint /produtos
    Validar Status Code "403"

Cenario: GET Produtos Id 200
    [tags]  GETPRODUTOID
    Criar Sessao
    GET ID Endpoint /produtos
    Validar Status Code "200"

Cenario: GET Produtos Id Nao Encontrado 400
    [tags]  GETPRODUTOEXC
    Criar Sessao
    GET ID Produto Nao Encontrado Endpoint /produtos
    Validar Status Code "400"

Cenario: DELETE Excluir Produto ID 200
    [tags]  DELETEPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"

Cenario: DELETE Excluir Produto ID Faz parte CARRINHO 400
    [tags]  DELETEPRODCARRINHO
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Faz Parte Carrinho Endpoint /produtos
    Validar Status Code "400"

Cenario: DELETE Excluir Produto ID Token Ausente 401
    [tags]  DELETEPRODSEMTOKEN
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Token Ausente Endpoint /produtos
    Validar Status Code "401"

Cenario: DELETE Excluir Produto Rota do ADMIN para o Status Code 403
    [tags]  DELETEP403
    Criar Sessao
    Fazer login Nao Admin e Armazenar Token
    DELETE ROTA 403 Endpoint /produtos
    Validar Status Code "403"

Cenario: PUT Editar Produto 200
    [tags]  PUTPROD
    Criar Sessao
    Fazer login e Armazenar Token
    PUT Endpoint /produtos
    Validar Status Code "200"

Cenario: PUT Editar Produto Mesmo Nome 400
    [tags]  PUTNOMEXISTENTE
    Criar Sessao
    Fazer login e Armazenar Token
    PUT Mesmo Nome Endpoint /produtos
    Validar Status Code "400"

Cenario: PUT Editar Produto TOKEN Ausente 401
    [tags]  PUTTOKENAUSENTE
    Criar Sessao
    Fazer login e Armazenar Token
    PUT TOKEN Ausente Endpoint /produtos
    Validar Status Code "401"

Cenario: PUT Editar Produto NAO Admin 403
    [tags]  PUTNAOADMIN
    Criar Sessao
    Fazer login Nao Admin e Armazenar Token
    PUT NAO ADMIN Endpoint /produtos
    Validar Status Code "403"