* Settings *
Documentation       Keywords e Variaveis para ações do endpoint /produtos
Resource            ../support/base.robot

*Variables*

${id_produto_excluido}    YFl8nqmP1C1WHce0
${inv_token_auth}         YJHAJSKjaf879
${id_produto_carrinho}    BeeJh5lz3k6kSIzA
${id_produto_MESMO_NOME}    BeeJh5lz3k6kSIzA
${id_produto}             0SPoxolKEBX37l76


* Keywords *
Criar Produto Valido
    &{payload}              Create Dictionary     nome=MouseTech    preco=100   descricao=Mouse     quantidade=550
    Set Global Variable     ${payload} 

Criar Produto Nao Valido
    &{payload}              Create Dictionary     nome=Processador    preco=100   descricao=i7     quantidade=550
    Set Global Variable     ${payload} 

GET Endpoint /produtos
    ${response}             GET On Session      serverest       /produtos
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET ID Endpoint /produtos
    ${response}             GET On Session      serverest       /produtos/YFl8nqmP1C1WHce0
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET ID Produto Nao Encontrado Endpoint /produtos
    ${response}             GET On Session      serverest       /produtos/${id_produto_excluido}   expected_status=400
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${token_auth}
    Criar Produto Valido
    ${response}             POST On Session       serverest       /produtos      data=&{payload}    headers=${header}   
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST User Nao Admin Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${token_auth}
    Criar Produto Valido
    ${response}             POST On Session       serverest       /produtos      data=&{payload}    headers=${header}   expected_status=403
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST ja Cadastrado Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${token_auth}
    Criar Produto Nao Valido
    ${response}             POST On Session       serverest       /produtos      data=&{payload}    headers=${header}   expected_status=400
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Token Ausente Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${inv_token_auth}
    Criar Produto Valido
    ${response}             POST On Session       serverest       /produtos      data=&{payload}    headers=${header}   expected_status=401
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${token_auth}
    &{payload}              Create Dictionary     nome=TecladoGamer    preco=150   descricao=Teclado     quantidade=550   
    ${response}             PUT On Session      serverest       /produtos/${id_produto}      data=&{payload}  headers=${header}   expected_status=200
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

PUT NAO ADMIN Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${token_auth}
    &{payload}              Create Dictionary     nome=TecladoGamer    preco=150   descricao=Teclado     quantidade=550   
    ${response}             PUT On Session      serverest       /produtos/${id_produto}      data=&{payload}  headers=${header}   expected_status=403
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Mesmo Nome Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${token_auth}
    &{payload}              Create Dictionary     nome=TecladoGamer    preco=150   descricao=Teclado     quantidade=550   
    ${response}             PUT On Session      serverest       /produtos/${id_produto_MESMO_NOME}      data=&{payload}  headers=${header}   expected_status=400
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

PUT TOKEN Ausente Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${inv_token_auth}
    &{payload}              Create Dictionary     nome=TecladoGamer    preco=150   descricao=Teclado     quantidade=550   
    ${response}             PUT On Session      serverest       /produtos/${id_produto_MESMO_NOME}      data=&{payload}  headers=${header}   expected_status=401
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${token_auth} 
    ${response}             DELETE On Session       serverest       /produtos/${id_produto}         headers=${header}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Faz Parte Carrinho Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${token_auth} 
    ${response}             DELETE On Session       serverest       /produtos/${id_produto_carrinho}         headers=${header}  expected_status=400
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Token Ausente Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${inv_token_auth}
    Criar Produto Valido
    ${response}             DELETE On Session       serverest       /produtos/${id_produto}      data=&{payload}    headers=${header}   expected_status=401
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Validar Ter Criado Produto
    Should be Equal         ${response.json()["message"]}               Cadastro realizado com sucesso
    Should Not Be Empty     ${response.json()["_id"]} 

Criar Produto e Armazenar ID
  POST Endpoint /produtos
  Validar Ter Criado Produto
  ${id_produto}             Set Variable        ${response.json()["_id"]}
  Log to Console          Response: ${id_produto}
  Set Global Variable     ${id_produto}

Cadastrar Produto ja Cadastrado
    POST ja Cadastrado Endpoint /produtos
    Validar Ter Criado Produto
    ${id_produto}             Set Variable        ${response.json()["_id"]}
    Log to Console          Response: ${id_produto}
    Set Global Variable     ${id_produto}




DELETE ROTA 403 Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${token_auth} 
    ${response}             DELETE On Session       serverest       /produtos/${id_produto}         headers=${header}     expected_status=403
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}
