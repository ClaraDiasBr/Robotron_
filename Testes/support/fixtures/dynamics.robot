* Settings *
Documentation       Keywords e Variaveis para geração de dados dinâmicos
Library             FakerLibrary
Library             ../python_functions/python_functions.py

* Keywords *
Criar Dados Dinamicos Usuario Valido
    ${payload}        Criar Dados Dinamicos Usuario Admin Ou Nao    admin=true
    Log to Console         ${payload}
    Set Global Variable    ${payload}

Criar Dados Dinamicos Usuario Nao ADMIN Valido
    ${nome}         FakerLibrary.Name
    ${email}        FakerLibrary.Email
    ${payload}      Create Dictionary            nome=${nome}    email=${email}    password=senha123        administrador=false     
    Log to Console         ${payload}
    Set Global Variable    ${payload}

Criar Produto Dinamicos Valido
    ${nome_produto}         FakerLibrary.Text           max_nb_chars=5
    ${preco_produto}        FakerLibrary.Random Number  digits= 4
    ${descricao_produto}    FakerLibrary.Text           max_nb_chars=6
    ${quantidade_produto}   FakerLibrary.Random Number  digits= 3
    ${payload}      Create Dictionary            nome=${nome_produto}    preco=${preco_produto}    descricao=${descricao_produto}        quantidade=${quantidade_produto}     
    Log to Console  ${payload}
    Set Global Variable    ${payload}