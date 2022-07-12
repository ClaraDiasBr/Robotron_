#Sessão para configuração, documemtação, imports de arquivos e library
* Settings *
Documentation       Arquivo de Testes para o Endpoint /produtos
Resource            ../keywords/produtos_keywords.robot
Suite Setup         Criar Sessao

#Sessão para criação dos cenários de teste
* Test Cases *
# Cenario Produtos
Cenario: GET Listar Produtos 200
    [tags]  GETALL
    Fazer login e Armazenar Token
    GET Endpoint /produtos
    Validar Status Code "200"

Cenario: POST Cadastrar Produto Dinanmico 201
    [tags]      POSTPRODUTODINAMICO
    Fazer login e Armazenar Token
    Cadastrar Produto Dinamico Valido
    POST Endpoint /produtos
    Validar Status Code "201"

Cenario: POST Cadastrar o Mesmo Produto 400
    [tags]      POSTMESMOPRODUTO
    Fazer login e Armazenar Token
    Cadastrar Produto Dinamico Valido
    POST Endpoint /produtos
    POST Endpoint /produtos
    Validar Status Code "400"

Cenario: POST Cadastrar Produto Token Ausente 401
    [tags]     POSTAUSENTE
    Fazer login e Armazenar Token
    Cadastrar Produto Dinamico Valido
    POST Token Ausente Endpoint /produtos
    Validar Status Code "401"

Cenario: POST Cadastrar Produto Nao Admin 403
    [tags]      POSTPRODUTONADMIN
    Fazer login Nao Admin e Armazenar Token
    Cadastrar Produto Dinamico Valido
    POST Endpoint /produtos
    Validar Status Code "403"

Cenario: GET Produtos Id 200
    [tags]  GETPRODUTOID
    GET ID Endpoint /produtos
    Validar Status Code "200"

Cenario: GET Produtos Id Nao Encontrado 400
    [tags]  GETPRODUTOEXC
    GET ID Produto Nao Encontrado Endpoint /produtos
    Validar Status Code "400"

Cenario: DELETE Excluir Produto ID 200
    [tags]  DELETEPROD
    Fazer Login e Armazenar Token
    Cadastrar Produto Dinamico Valido
    POST Endpoint /produtos
    Validar Ter Criado Produto
    Buscar Id do Produto e Armazenar
    DELETE Endpoint /produtos
    Validar Status Code "200"

Cenario: DELETE Excluir Produto ID Faz parte CARRINHO 400
    [tags]  DELETEPRODCARRINHO
    Fazer Login e Armazenar Token
    DELETE Endpoint /produtos
    Validar Status Code "400"

Cenario: DELETE Excluir Produto Rota do ADMIN para o Status Code 403
    [tags]  DELETEP403
    Fazer login Nao Admin e Armazenar Token
    DELETE Endpoint /produtos
    Validar Status Code "403"
    
Cenario: DELETE Excluir Produto ID Token Ausente 401
    [tags]  DELETEPRODSEMTOKEN
    Fazer Login e Armazenar Token
    DELETE Token Ausente Endpoint /produtos
    Validar Status Code "401"

Cenario: PUT Editar Produto 200
    [tags]  PUTPROD
    Fazer login e Armazenar Token
    Editar Produto
    PUT Endpoint /produtos
    Validar Status Code "200"

Cenario: PUT Editar Produto Mesmo Nome 400
    [tags]  PUTNOMEXISTENTE
    Fazer login e Armazenar Token
    Editar Produto
    PUT Mesmo Nome Endpoint /produtos
    Validar Status Code "400"

Cenario: PUT Editar Produto TOKEN Ausente 401
    [tags]  PUTTOKENAUSENTE
    Fazer login e Armazenar Token
    Editar Produto
    PUT TOKEN Ausente Endpoint /produtos
    Validar Status Code "401"

Cenario: PUT Editar Produto NAO Admin 403
    [tags]  PUTNAOADMIN
    Fazer login Nao Admin e Armazenar Token
    Editar Produto
    PUT Endpoint /produtos
    Validar Status Code "403"