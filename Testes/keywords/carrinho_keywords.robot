* Settings *
Documentation       Keywords e Variaveis para ações do endpoint /carrinhos
Resource            ../support/base.robot

* Keywords *

GET Endpoint /carrinhos
    ${response}             GET On Session       serverest       /carrinhos
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET Endpoint /carrinhos ID
    [Arguments]             ${id_carrinho}
    ${response}             GET On Session       serverest       /carrinhos/${id_carrinho}   expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Criar Carrinho Valido
    ${produtos}             Importar JSON Estatico  json_carrinho.json
    ${payload}              Set Variable     ${produtos}
    Set Global Variable     ${payload}

POST Endpoint /carrinhos
    [Arguments]             ${token_auth}=${login_response.json()["authorization"]}
    &{header}               Create Dictionary     Authorization=${token_auth}  Content-Type=application/json
    ${response}             POST On Session       serverest       /carrinhos      json=${payload}    headers=${header}    expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos/concluir-compra
    [Arguments]             ${token_auth}=${login_response.json()["authorization"]}
    &{header}               Create Dictionary     Authorization=${token_auth}  Content-Type=application/json
    ${response}             DELETE On Session       serverest       /carrinhos/concluir-compra     headers=${header}     expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos/cancelar-compra
    [Arguments]             ${token_auth}=${login_response.json()["authorization"]}
    &{header}               Create Dictionary     Authorization=${token_auth}  Content-Type=application/json
    ${response}             DELETE On Session       serverest       /carrinhos/cancelar-compra     headers=${header}     expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}