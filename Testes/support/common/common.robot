* Settings *
Documentation       Keywords e Variaveis para ações gerais
Library             OperatingSystem


* Keywords *
# Criar Sessao
#     Create Session       serverest       ${BASE_URI}

Validar Status Code "${statuscode}"
    Should Be True          ${response.status_code} == ${statuscode}

Validar Quantidade "${quantidade}"
    Should Be Equal     ${response.json()["quantidade"]}        ${quantidade}

Validar Se Mensagem Contem "${palavra}"
    Should Contain      ${response.json()["message"]}           ${palavra}

Importar JSON Estatico
    [Arguments]         ${nome_arquivo}
    ${arquivo}          Get File    ${EXECDIR}/../support/fixtures/static/${nome_arquivo}
    ${data}             Evaluate    json.loads('''${arquivo}''')    json
    [return]            ${data}