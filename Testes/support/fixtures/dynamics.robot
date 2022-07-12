* Settings *
Documentation       Keywords e Variaveis para geração de dados dinâmicos
Library             FakerLibrary

* Keywords *
Criar Dados Dinamicos Usuario Valido
    ${nome}         FakerLibrary.Name
    ${email}        FakerLibrary.Email
    ${payload}      Create Dictionary            nome=${nome}    email=${email}    password=senha123        administrador=true     
    Log to Console  ${payload}
    [return]        ${payload}

Criar Dados Dinamicos Produto Valido
    ${nome_produto}         FakerLibrary.Text           max_nb_chars=5
    ${preco_produto}        FakerLibrary.Random Number  digits= 4
    ${descricao_produto}    FakerLibrary.Text           max_nb_chars=6
    ${quantidade_produto}   FakerLibrary.Random Number  digits= 3
    ${payload}      Create Dictionary            nome=${nome_produto}    preco=${preco_produto}    descricao=${descricao_produto}        quantidade=${quantidade_produto}     
    Log to Console  ${payload}
    [return]        ${payload}