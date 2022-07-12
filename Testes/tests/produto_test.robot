#Sessão para configuração, documemtação, imports de arquivos e library
* Settings *
Documentation       Arquivo de Testes para o Endpoint /produtos
Resource            ../keywords/produtos_keywords.robot
Suite Setup         Criar Sessao

#Sessão para criação dos cenários de teste
* Test Cases *
# Cenario Produtos
Cenario: GET Listar Produtos 200
    [tags]  GET     GETALL
    GET Endpoint /produtos
    Quantidade Produtos Cadastrados
    Validar Status Code "200"

Cenario: GET Produtos Id 200
    [tags]  GET     GETPRODUTOID
    GET ID Endpoint /produtos     ${id_produto}
    Validar Status Code "200"

Cenario: GET Produtos Id Nao Encontrado 400
    [tags]   GET     GETPRODUTOEXC
    GET ID Endpoint /produtos     ${id_produto_inv}
    Validar Status Code "400"

Cenario: POST Cadastrar Produto Dinanmico 201
    [tags]   POST   POSTPRODUTODINAMICO
    POST Endpoint /login  ${email_para_login}   ${password_para_login}
    Fazer login e Armazenar Token
    Criar Produto Dinamicos Valido
    POST Endpoint /produtos
    Validar Status Code "201"

Cenario: POST Cadastrar o Mesmo Produto 400
    [tags]   POST    POSTMESMOPRODUTO
    POST Endpoint /login  ${email_para_login}   ${password_para_login}
    Fazer login e Armazenar Token
    Criar Produto Dinamicos Valido
    POST Endpoint /produtos
    POST Endpoint /produtos
    Validar Status Code "400"

Cenario: POST Cadastrar Produto Token Ausente 401
    [tags]   POST    POSTAUSENTE
    POST Endpoint /login  ${email_para_login}   ${password_para_login}
    Fazer login e Armazenar Token
    Criar Produto Dinamicos Valido
    POST Endpoint /produtos      ${inv_token_auth}
    Validar Status Code "401"

Cenario: POST Cadastrar Produto Nao Admin 403
    [tags]   POST     POSTPRODUTONADMIN
    POST Endpoint /login  ${email_nao_admin}   ${password_nao_admin}
    Fazer login e Armazenar Token
    Criar Produto Dinamicos Valido
    POST Endpoint /produtos
    Validar Status Code "403"

Cenario: DELETE Excluir Produto ID 200
    [tags]    DELETE        DELETEPROD
    POST Endpoint /login  ${email_para_login}   ${password_para_login}
    Fazer Login e Armazenar Token
    Criar Produto Dinamicos Valido
    POST Endpoint /produtos
    DELETE Endpoint /produtos   
    Validar Status Code "200"

Cenario: DELETE Excluir Produto ID Faz parte CARRINHO 400
    [tags]    DELETE       DELETEPRODCARRINHO
    POST Endpoint /login  ${email_para_login}   ${password_para_login}
    Fazer Login e Armazenar Token
    DELETE Endpoint /produtos  ${id_produto}
    Validar Status Code "400"

Cenario: DELETE Excluir Produto Rota do ADMIN para o Status Code 403
    [tags]   DELETE        DELETEP403
    POST Endpoint /login  ${email_nao_admin}   ${password_nao_admin}
    Fazer login e Armazenar Token
    DELETE Endpoint /produtos    ${id_produto}
    Validar Status Code "403"
    
Cenario: DELETE Excluir Produto ID Token Ausente 401
    [tags]   DELETE      DELETEPRODSEMTOKEN
    POST Endpoint /login  ${email_para_login}   ${password_para_login}
    Fazer Login e Armazenar Token    
    DELETE Endpoint /produtos  ${id_produto}    ${inv_token_auth}
    Validar Status Code "401"

Cenario: PUT Editar Produto 200
    [tags]  PUT   PUTPROD
    POST Endpoint /login  ${email_para_login}   ${password_para_login}
    Fazer Login e Armazenar Token
    Criar Produto Dinamicos Valido
    PUT Endpoint /produtos  ${id_produto_editavel}
    Validar Status Code "200"

Cenario: PUT Editar Produto Mesmo Nome 400
    [tags]   PUT  PUTNOMEXISTENTE
    POST Endpoint /login  ${email_para_login}   ${password_para_login}
    Fazer Login e Armazenar Token
    Criar Produto Dinamicos Valido
    POST Endpoint /produtos
    PUT Endpoint /produtos  ${id_produto_editavel}
    Validar Status Code "400"

Cenario: PUT Editar Produto TOKEN Ausente 401
    [tags]  PUT  PUTTOKENAUSENTE
    POST Endpoint /login  ${email_para_login}   ${password_para_login}
    Fazer Login e Armazenar Token
    Editar Produto
    PUT Endpoint /produtos  ${id_produto_editavel}    ${inv_token_auth}
    Validar Status Code "401"

Cenario: PUT Editar Produto NAO Admin 403
    [tags]  PUT   PUTNAOADMIN
    POST Endpoint /login  ${email_nao_admin}   ${password_nao_admin}
    Fazer login e Armazenar Token
    Editar Produto
    PUT Endpoint /produtos  ${id_produto_editavel}
    Validar Status Code "403"