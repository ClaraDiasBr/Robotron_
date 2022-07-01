* Settings *
Documentation       Keywords e Variaveis para ações do endpoint /produtos
Resource            ./common.robot



* Keywords *
Criar Produto Valido
    &{payload}              Create Dictionary     nome=Processador    preco=100   descricao=R5 3600x     quantidade=550
    Set Global Variable     ${payload} 

Criar Produto Nao Valido
    &{payload}              Create Dictionary     nome=Processador    preco=100   descricao=i7     quantidade=550
    Set Global Variable     ${payload} 

POST Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${token_auth}
    Criar Produto Valido
    ${response}             POST On Session       serverest       /produtos      data=&{payload}    headers=${header}   
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET Endpoint /produtos
    ${response}             GET On Session      serverest       /produtos
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${token_auth} 
    ${response}             DELETE On Session       serverest       /produtos/${id_produto}         headers=${header}
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

GET ID Endpoint /produtos
    ${response}             GET On Session      serverest       /produtos/YFl8nqmP1C1WHce0
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}