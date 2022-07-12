* Settings *
Documentation       Keywords e Variaveis para ações do endpoint /login
Resource            ../support/base.robot

* Keywords *
POST Endpoint /login
    [Arguments]             ${email_para_login}=${response.json()["email"]}        ${password_para_login}=${response.json()["password"]}
    &{payload}              Create Dictionary     email=${email_para_login}      password=${password_para_login}
    ${login_response}             POST On Session      serverest       /login      data=&{payload}    expected_status=any
    Log to Console          Response: ${login_response.content}
    Set Global Variable     ${login_response}

Validar Status Code Login "${statuscode}"
    Should Be True          ${login_response.status_code} == ${statuscode}

Validar Ter Logado
    Should be Equal         ${login_response.json()["message"]}               Login realizado com sucesso
    Should Not Be Empty     ${login_response.json()["authorization"]} 

Fazer login e Armazenar Token
    Validar Ter Logado
    ${token_auth}           Set Variable        ${login_response.json()["authorization"]}
    Log to Console          Token Salvo:        ${token_auth}
    Set Global Variable                         ${token_auth}

