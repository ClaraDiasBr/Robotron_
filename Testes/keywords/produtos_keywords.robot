* Settings *
Documentation       Keywords e Variaveis para ações do endpoint /produtos
Resource            ../support/base.robot

*Variables*

${id_produto_excluido}    YFl8nqmP1C1WHce0
${inv_token_auth}         YJHAJSKjaf879
${id_produto}             BeeJh5lz3k6kSIzA
${id_produto_MESMO_NOME}  dGqTkMUkFoThbk1h


* Keywords *
GET Endpoint /produtos
    ${response}             GET On Session      serverest       /produtos
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET ID Endpoint /produtos
    ${response}             GET On Session      serverest       /produtos/${id_produto}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET ID Produto Nao Encontrado Endpoint /produtos
    ${response}             GET On Session      serverest       /produtos/${id_produto_excluido}   expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${token_auth}
    ${response}             POST On Session       serverest       /produtos      json=${payload}    headers=${header}   expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Token Ausente Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${inv_token_auth}
    ${response}             POST On Session       serverest       /produtos      json=${payload}    headers=${header}   expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${token_auth} 
    ${response}             DELETE On Session       serverest       /produtos/${id_produto}         headers=${header}    expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Token Ausente Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${inv_token_auth}
    ${response}             DELETE On Session       serverest       /produtos/${id_produto}    headers=${header}   expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${token_auth}  
    ${response}             PUT On Session      serverest       /produtos/${id_produto}      json=${payload}  headers=${header}   expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Mesmo Nome Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${token_auth}   
    ${response}             PUT On Session      serverest       /produtos/${id_produto_MESMO_NOME}      json=${payload}  headers=${header}   expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

PUT TOKEN Ausente Endpoint /produtos
    &{header}               Create Dictionary     Authorization=${inv_token_auth}   
    ${response}             PUT On Session      serverest       /produtos/${id_produto}      json=${payload}  headers=${header}   expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Cadastrar Produto Dinamico Valido
    ${payload}             Criar Dados Dinamicos Produto Valido
    Set Global Variable    ${payload}

Editar Produto
    ${payload}              Create Dictionary     nome=SuperTecladoGamer    preco=150   descricao=Teclado     quantidade=550 
    Set Global Variable     ${payload}

Validar Ter Criado Produto
    Should be Equal         ${response.json()["message"]}               Cadastro realizado com sucesso
    Should Not Be Empty     ${response.json()["_id"]} 
    
Buscar Id do Produto e Armazenar
   ${id_produto}             Set Variable        ${response.json()["_id"]}
   Log to Console          Response: ${id_produto}
   Set Global Variable     ${id_produto}