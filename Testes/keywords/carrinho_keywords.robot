* Settings *
Documentation       Keywords e Variaveis para ações do endpoint /carrinhos
Resource            ./common.robot

#Sessão para setar variáveis para utilização
* Variables *
${id_carrinho_fixo}     qbMqntef4iTOwWfg

* Keywords *

GET Endpoint /carrinhos
    ${response}             GET On Session       serverest       /carrinhos
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

GET Endpoint /carrinhos ID
    ${response}             GET On Session       serverest       /carrinhos/${id_carrinho_fixo}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Criar Carrinho Valido
    ${produtos}             Importar JSON Estatico  json_carrinho.json
    ${payload}              Set Variable     ${produtos}
    Set Global Variable     ${payload}

POST Endpoint /carrinhos
    Criar Carrinho Valido
    &{header}               Create Dictionary     Authorization=${token_auth}  Content-Type=application/json
    ${response}             POST On Session       serverest       /carrinhos      json=${payload}    headers=${header}   
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos/concluir-compra
    &{header}               Create Dictionary     Authorization=${token_auth}  Content-Type=application/json
    ${response}             DELETE On Session       serverest       /carrinhos/concluir-compra     headers=${header}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos/cancelar-compra
    &{header}               Create Dictionary     Authorization=${token_auth}  Content-Type=application/json
    ${response}             DELETE On Session       serverest       /carrinhos/cancelar-compra     headers=${header}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}