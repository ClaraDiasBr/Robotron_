* Settings *
Documentation       Keywords e Variaveis para ações do endpoint /usuarios
Resource            ./common.robot

#Sessão para setagem de variáveis para utilização
* Variables *
${nome_do_usuario}          tony stark
${senha_do_usuario}         test123
${email_do_usuario}         tony.stark@gmail.com
${id_do_usuario}            9Ma0mdfiQO8Gd3st
${id_nao_usuario}           AKN4pWQ4dp0cH7vW


* Keywords *
GET Endpoint /usuarios
    ${response}             GET On Session      serverest       /usuarios
    Set Global Variable     ${response}

POST Endpoint /usuarios
   # &{payload}              Create Dictionary     nome=${nome_do_usuario}     email=${email_do_usuario}      password=${senha_do_usuario}    administrador=true
    ${response}             POST On Session      serverest       /usuarios      json=&{payload}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Invalido Endpoint /usuarios
   # &{payload}              Create Dictionary     nome=${nome_do_usuario}     email=${email_do_usuario}      password=${senha_do_usuario}    administrador=true
    ${response}             POST On Session      serverest       /usuarios      json=&{payload}     expected_status=400
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    &{payload}              Create Dictionary     nome=Valido tester     email=fulano@qa.com.br      password=teste    administrador=true
    ${response}             PUT On Session      serverest       /usuarios/FwgIw7mrb7PET19M      data=&{payload}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios
    ${response}             DELETE On Session      serverest       /usuarios/AKN4pWQ4dp0cH7vW
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Validar Quantidade "${quantidade}"
    Should Be Equal     ${response.json()["quantidade"]}        ${quantidade}

Validar Se Mensagem Contem "${palavra}"
    Should Contain      ${response.json()["message"]}           ${palavra}

Printar Conteudo Response
    Log To Console      Response: ${response.json()["usuarios"]}

Buscar Usuario por ID
    ${response}             GET On Session      serverest       /usuarios/${id_do_usuario}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Buscar Usuario Nao Cadastrado por ID
    ${response}             GET On Session      serverest       /usuarios/${id_nao_usuario}     expected_status=400
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Criar Usuario Estatico Valido
    ${json}                 Importar JSON Estatico  json_usuario_ex.json
    ${payload}              Set Variable    ${json["user_valido"]}
    Set Global Variable     ${payload}   

Criar Usuario Estatico Invalido Sem Nome
    ${json}                 Importar JSON Estatico  json_usuario_ex.json
    ${payload}              Set Variable    ${json["user_sem_nome"]}
    Set Global Variable     ${payload}   

Criar Usuario Estatico Sem Senha
    ${json}                 Importar JSON Estatico  json_usuario_ex.json
    ${payload}              Set Variable    ${json["user_sem_senha"]}
    Set Global Variable     ${payload}   

Criar Usuario Estatico Sem Email
    ${json}                 Importar JSON Estatico  json_usuario_ex.json
    ${payload}              Set Variable    ${json["user_sem_email"]}
    Set Global Variable     ${payload}

Criar Usuario Estatico Nao Admin
    ${json}                 Importar JSON Estatico  json_usuario_ex.json
    ${payload}              Set Variable    ${json["user_nao_admin"]}
    Set Global Variable     ${payload}
    