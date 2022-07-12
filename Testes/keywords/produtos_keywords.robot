* Settings *
Documentation       Keywords e Variaveis para ações do endpoint /produtos
Resource            ../support/base.robot

* Keywords *
GET Endpoint /produtos
    ${response}             GET On Session      serverest       /produtos
    Set Global Variable     ${response}

GET ID Endpoint /produtos
    [Arguments]             ${id_produto}=${response.json()["_id"]}
    ${response}             GET On Session      serverest       /produtos/${id_produto}    expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /produtos
    [Arguments]             ${token_auth}=${login_response.json()["authorization"]}
    &{header}               Create Dictionary     Authorization=${token_auth}
    ${response}             POST On Session       serverest       /produtos      json=${payload}    headers=${header}   expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /produtos
    [Arguments]             ${id_produto}=${response.json()["_id"]}         ${token_auth}=${login_response.json()["authorization"]}
    &{header}               Create Dictionary     Authorization=${token_auth} 
    ${response}             DELETE On Session       serverest       /produtos/${id_produto}         headers=${header}    expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /produtos
    [Arguments]             ${id_produto}         ${token_auth}=${login_response.json()["authorization"]}    
    &{header}               Create Dictionary     Authorization=${token_auth}  
    ${response}             PUT On Session      serverest       /produtos/${id_produto}      json=${payload}  headers=${header}   expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Editar Produto
    ${payload}              Create Dictionary     nome=SuperTecladoGamer    preco=150   descricao=Teclado     quantidade=550 
    Set Global Variable     ${payload}

Validar Ter Criado Produto
    Should be Equal         ${response.json()["message"]}               Cadastro realizado com sucesso
    Should Not Be Empty     ${response.json()["_id"]} 

Quantidade Produtos Cadastrados
    ${quantidade_produtos}      Buscar Quantidade Produtos Cadastrados
    Log to Console              Response: ${quantidade_produtos}