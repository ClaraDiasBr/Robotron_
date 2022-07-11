* Settings *
Documentation       Keywords e Variaveis para ações do endpoint /login
Resource            ../support/base.robot

#Sessão para setagem de variáveis para utilização
* Variables *
${email_vazio}              
${email_para_login}         fulano@qa.com
${password_para_login}      teste
${email_do_usuario}         tony.stark@gmail.com
${senha_do_usuario}         test123
${email_nao_admin}          steve.rogers@gmail.com
${password_nao_admin}       test123

* Keywords *
POST Endpoint /login
    &{payload}              Create Dictionary     email=${email_para_login}      password=${password_para_login}
    ${response}             POST On Session      serverest       /login      data=&{payload}
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Sem Email Endpoint /login
    &{payload}              Create Dictionary     email=${email_vazio}      password=${password_para_login} 
    ${response}             POST On Session      serverest       /login      data=&{payload}  expected_status=400
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Nao Admin Endpoint /login
    &{payload}              Create Dictionary     email=${email_nao_admin}      password=${password_nao_admin} 
    ${response}             POST On Session      serverest       /login      data=&{payload}    
    Log to Console          Response: ${response.content}
    Set Global Variable     ${response}

Validar Ter Logado
    Should be Equal         ${response.json()["message"]}               Login realizado com sucesso
    Should Not Be Empty     ${response.json()["authorization"]} 

Fazer login e Armazenar Token
    POST Endpoint /login
    Validar Ter Logado
    ${token_auth}           Set Variable        ${response.json()["authorization"]}
    Log to Console          Token Salvo:        ${token_auth}
    Set Global Variable                         ${token_auth}

Fazer login Nao Admin e Armazenar Token
    POST Nao Admin Endpoint /login
    Validar Ter Logado
    ${token_auth}           Set Variable        ${response.json()["authorization"]}
    Log to Console          Token Salvo:        ${token_auth}
    Set Global Variable                         ${token_auth}
