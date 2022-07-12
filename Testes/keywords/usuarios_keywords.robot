* Settings *
Documentation       Keywords e Variaveis para ações do endpoint /usuarios
Resource            ../support/base.robot

* Keywords *
GET Endpoint /usuarios
    ${response}             GET On Session      serverest       /usuarios
    Set Global Variable     ${response}

GET Endpoint /usuarios ID
    [Arguments]             ${id_usuario}=${response.json()["_id"]}
    ${response}             GET On Session      serverest       /usuarios/${id_usuario}     expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /usuarios
    ${response}             POST On Session      serverest       /usuarios      json=${payload}    expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}
PUT Endpoint /usuarios
    [Arguments]             ${id_usuario}=${response.json()["_id"]}
    ${response}             PUT On Session      serverest       /usuarios/${id_usuario}      data=&{payload}     expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios
    [Arguments]             ${id_usuario}=${response.json()["_id"]}
    ${response}             DELETE On Session      serverest       /usuarios/${id_usuario}    expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Editar Usuario
    &{payload}              Create Dictionary     nome=Valido tester     email=fulano@qa.com.br      password=teste    administrador=true

Pegar Usuario Estatico Sem Nome
    ${json}                 Importar JSON Estatico  json_usuario.json
    ${payload}              Set Variable    ${json["user_sem_nome"]}
    Set Global Variable     ${payload}   

Pegar Usuario Estatico Sem Senha
    ${json}                 Importar JSON Estatico  json_usuario.json
    ${payload}              Set Variable    ${json["user_sem_senha"]}
    Set Global Variable     ${payload}   

Pegar Usuario Estatico Sem Email
    ${json}                 Importar JSON Estatico  json_usuario.json
    ${payload}              Set Variable    ${json["user_sem_email"]}
    Set Global Variable     ${payload}

Validar Ter Criado Usuario
    Should be Equal         ${response.json()["message"]}               Cadastro realizado com sucesso
    Should Not Be Empty     ${response.json()["_id"]} 

Quantidade Usuarios Cadastrados
    ${quantidade_usuarios}      Buscar Quantidade Usuarios Cadastrado
    Log to Console              Response: ${quantidade_usuarios}