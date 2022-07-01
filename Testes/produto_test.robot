#Sessão para configuração, documemtação, imports de arquivos e library
* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs REST
Library         RequestsLibrary
Resource        keywords/usuarios_keywords.robot
Resource        keywords/login_keywords.robot
Resource        keywords/produtos_keywords.robot

#Sessão para criação dos cenários de teste
* Test Cases *
# Cenario Produtos
Cenario: POST Criar Produto
    [tags]      POSTPRODUTO
    Criar Sessao
    Fazer login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"

Cenario: DELETE Excluir Produto 200
    [tags]  DELETEPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"
##########################################
Cenario: GET Listar Produtos 200
    [tags]  GETLISTAPRODUTOS
    Criar Sessao
    Fazer login e Armazenar Token
    GET Endpoint /produtos
    Validar Status Code "200"

Cenario: POST Cadastrar o Mesmo Produto
    [tags]      POSTMESMOPRODUTO
    Criar Sessao
    Fazer login e Armazenar Token
    POST ja Cadastrado Endpoint /produtos
    Validar Status Code "400"

Cenario: POST Criar Produto Nao Admin
    [tags]      POSTPRODUTONADMIN
    Criar Sessao
    Fazer login Nao Admin e Armazenar Token
    POST User Nao Admin Endpoint /produtos
    Validar Status Code "403"

Cenario: GET Produtos Id
    [tags]  GETPRODUTOID
    Criar Sessao
    GET ID Endpoint /produtos
    Validar Status Code "200"
#### Falta cenario DELETE para o Status Code 403
#### Falta cenario com o PUT
#### Cenario Triste GET Produtos Id