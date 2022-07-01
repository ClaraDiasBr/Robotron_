#Sessão para configuração, documemtação, imports de arquivos e library
* Settings *
Documentation   Arquivo simples para requisições HTTP em APIs REST
Library         RequestsLibrary
Resource        keywords/login_keywords.robot

#Sessão para criação dos cenários de teste
* Test Cases *
# Cenario Login

Cenario: POST Realizar Login 200
    [tags]      POSTLOGIN
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "200"

Cenario: POST Realizar Login Sem Email 400
    [tags]     POSTSEMEMAIL
    Criar Sessao
    POST Sem Email Endpoint /login
    Validar Status Code "400"
