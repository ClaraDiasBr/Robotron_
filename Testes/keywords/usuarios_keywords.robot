* Settings *
Documentation       Keywords e Variaveis para ações do endpoint /usuarios
Resource            ../support/base.robot


#Sessão para setagem de variáveis para utilização
* Variables *
# ${nome_do_usuario}          steve rogers
# ${senha_do_usuario}         test123
# ${email_do_usuario}         steve.rogers@gmail.com
# ${id_do_usuario}            viXiN0xKXO8ut6cZ
# ${id_nao_usuario}           AKN4pWQ4dp0cH7vW


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
    #&{payload}              Create Dictionary     nome=${nome_do_usuario}     email=${email_do_usuario}      password=${senha_do_usuario}    administrador=false
    ${response}             POST On Session      serverest       /usuarios      json=${payload}    expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios
    [Arguments]             ${id_usuario}=${response.json()["_id"]}
    ${response}             DELETE On Session      serverest       /usuarios/${id_usuario}    expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Editar Usuario
    &{payload}              Create Dictionary     nome=Valido tester     email=fulano@qa.com.br      password=teste    administrador=true

PUT Endpoint /usuarios
    [Arguments]             ${id_usuario}=${response.json()["_id"]}
    ${response}             PUT On Session      serverest       /usuarios/${id_usuario}      data=&{payload}     expected_status=any
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Validar Quantidade "${quantidade}"
    Should Be Equal     ${response.json()["quantidade"]}        ${quantidade}

Validar Se Mensagem Contem "${palavra}"
    Should Contain      ${response.json()["message"]}           ${palavra}

Printar Conteudo Response
    Log To Console      Response: ${response.json()["usuarios"]}

Criar Usuario Estatico Sem Nome
    ${json}                 Importar JSON Estatico  json_usuario.json
    ${payload}              Set Variable    ${json["user_sem_nome"]}
    Set Global Variable     ${payload}   

Criar Usuario Estatico Sem Senha
    ${json}                 Importar JSON Estatico  json_usuario.json
    ${payload}              Set Variable    ${json["user_sem_senha"]}
    Set Global Variable     ${payload}   

Criar Usuario Estatico Sem Email
    ${json}                 Importar JSON Estatico  json_usuario.json
    ${payload}              Set Variable    ${json["user_sem_email"]}
    Set Global Variable     ${payload}

# Criar Usuario Estatico Nao Admin
#     ${json}                 Importar JSON Estatico  json_usuario.json
#     ${payload}              Set Variable    ${json["user_nao_admin"]}
#     Set Global Variable     ${payload}

Cadastrar Usuario Dinamico Valido
    ${payload}             Criar Dados Dinamicos Usuario Valido
    Set Global Variable    ${payload}

Cadastrar Usuario Dinamico Nao ADMIN Valido
    ${payload}             Criar Dados Dinamicos Usuario Nao ADMIN Valido
    Set Global Variable    ${payload}


Validar Ter Criado Usuario
    Should be Equal         ${response.json()["message"]}               Cadastro realizado com sucesso
    Should Not Be Empty     ${response.json()["_id"]} 
    
Buscar Id do Usuario e Armazenar
   ${id_usuario}             Set Variable        ${response.json()["_id"]}
   Log to Console          Response: ${id_usuario}
   Set Global Variable     ${id_usuario}