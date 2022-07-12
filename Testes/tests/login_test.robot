#Sessão para configuração, documemtação, imports de arquivos e library
* Settings *
Documentation   Arquivo de Testes para o Endpoint /login
Resource            ../keywords/login_keywords.robot
Suite Setup         Criar Sessao

#Sessão para criação dos cenários de teste
* Test Cases *
# Cenario Login

Cenario: POST Realizar Login 200
    [tags]  POST     POSTLOGIN
    POST Endpoint /login  ${email_para_login}   ${password_para_login}
    Validar Status Code Login "200"

Cenario: POST Realizar Login Sem Email 400
    [tags]  POST     POSTSEMEMAIL
    POST Endpoint /login  ${email_vazio}   ${password_para_login}
    Validar Status Code Login "400"
