* Settings *
Documentation       Keywords e Variaveis para ações do endpoint /login
Resource            ../support/base.robot

#Sessão para setagem de variáveis para utilização
* Variables *
# ${email_vazio}              
# ${email_para_login}         fulano@qa.com
# ${email_do_usuario}         tony.stark@gmail.com
# ${password_para_login}      teste

# ${email_nao_admin}          steve.rogers@gmail.com
# ${password_nao_admin}       test123

* Keywords *
POST Endpoint /login
    [Arguments]             ${email_para_login}=${response.json()["email"]}        ${password_para_login}=${response.json()["password"]}
    &{payload}              Create Dictionary     email=${email_para_login}      password=${password_para_login}
    ${login_response}             POST On Session      serverest       /login      data=&{payload}    expected_status=any
    Log to Console          Response: ${login_response.content}
    Set Global Variable     ${login_response}

# POST Endpoint /login - carrinho
#     &{payload}              Create Dictionary     email=${email_para_login}      password=${password_para_login}
#     ${response}             POST On Session      serverest       /login      data=&{payload}    expected_status=any
#     Log to Console          Response: ${response.content}
#     Set Global Variable     ${response}

# POST Sem Email Endpoint /login
#     &{payload}              Create Dictionary     email=${email_vazio}      password=${password_para_login} 
#     ${response}             POST On Session      serverest       /login      data=&{payload}  expected_status=any
#     Log to Console          Response: ${response.content}
#     Set Global Variable     ${response}

# POST Nao Admin Endpoint /login
#     &{payload}              Create Dictionary     email=${email_nao_admin}      password=${password_nao_admin} 
#     ${response}             POST On Session      serverest       /login      data=&{payload}    
#     Log to Console          Response: ${response.content}
#     Set Global Variable     ${response}

Validar Status Code Login "${statuscode}"
    Should Be True          ${login_response.status_code} == ${statuscode}

Validar Ter Logado
    Should be Equal         ${login_response.json()["message"]}               Login realizado com sucesso
    Should Not Be Empty     ${login_response.json()["authorization"]} 

Fazer login e Armazenar Token
    # POST Endpoint /login
    Validar Ter Logado
    ${token_auth}           Set Variable        ${login_response.json()["authorization"]}
    Log to Console          Token Salvo:        ${token_auth}
    Set Global Variable                         ${token_auth}

Fazer login Nao Admin e Armazenar Token
    POST Nao Admin Endpoint /login
    Validar Ter Logado
    ${token_auth}           Set Variable        ${login_response.json()["authorization"]}
    Log to Console          Token Salvo:        ${token_auth}
    Set Global Variable                         ${token_auth}
