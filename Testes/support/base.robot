#Sessão para configuração, documemtação, imports de arquivos e library
* Settings *
Documentation       Arquivo simples para requisições HTTP em APIs REST
Library             OperatingSystem
Library             RequestsLibrary
Library             Collections
Resource            ./common/common.robot
Resource            ./fixtures/dynamics.robot
Resource            ./variaveis/serverest_variaveis.robot
Resource            ../keywords/carrinho_keywords.robot
Resource            ../keywords/login_keywords.robot
Resource            ../keywords/produtos_keywords.robot
Resource            ../keywords/usuarios_keywords.robot


* Keywords *
Criar Sessao
    Create Session       serverest       ${BASE_URI}

