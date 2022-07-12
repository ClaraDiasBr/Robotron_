#Sessão para configuração, documemtação, imports de arquivos e library
* Settings *
Documentation   Arquivo de Testes para o Endpoint /login
Resource            ../keywords/login_keywords.robot
Suite Setup         Criar Sessao

#Sessão para criação dos cenários de teste
* Test Cases *
# Cenario Login

Cenario: POST Realizar Login 200
    [tags]      POSTLOGIN
    POST Endpoint /login
    Validar Status Code "200"

Cenario: POST Realizar Login Sem Email 400
    [tags]     POSTSEMEMAIL
    POST Sem Email Endpoint /login
    Validar Status Code "400"
