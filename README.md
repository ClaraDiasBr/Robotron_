# Challenge Sprint 6 

# API ServeRest: Testes Automatizados com Robot Framework
Repositório com o projeto final da trilha de automação com Robot Framework


[![Badge ServeRest](https://img.shields.io/badge/API-ServeRest-blue)](https://github.com/ServeRest/ServeRest/)


## Ferramentas
- Visual Studio Code
- Robot Framework
- ServeRest
- Node.Js
- GitHub

## Linguagem
- Python 3

## Requisitos
- Instalar Python <http://python.org/downloads>
- Instalar Node.Js
- Instalar Robot Framework 

## Instalação
Considerando que o Python já esteja instalado, no terminal execute:
``` 
pip install robotframework
```

### ServeRest Instalada Localmente com NPM
Execute o seguinte comando no terminal:
```shell
npx serverest@latest
```

### Bibliotecas Externas
- JSONLibrary
- RequestsLibrary
- FakerLibrary 

### Clone o Repositório:
```shell
git clone https://github.com/ClaraDiasBr/Robotron_6_Maria_Dias_Compass.git
```

## Executando os Testes
- Abra o terminal na pasta 'tests'

### Testes por Endpoint:
    Login     Executa todos os testes do Endpoint /login
    
        robot -d ./reports  login_test.robot
    
    Usuários     Executa todos os testes do Endpoint /usuarios
    
        robot -d ./reports  usuario_test.robot
    
    Produtos     Executa todos os testes do Endpoint /produtos
    
        robot -d ./reports  produto_test.robot
    
    Carrinhos     Executa todos os testes do Endpoint /carrinhos
    
        robot -d ./reports  carrinho_test.robot
    
Suites de Testes
    ```
        robot -d ./reports  suite_test.robot
    ```

### Testes Por Tags
- Executar no terminal: `robot -d ./reports -i "tag"  "arquivo_de_teste"`
    - Substituir "arquivo_de_teste" pelo arquivo desejado.
    - Substituir "tag" pela Tag desejada.

- Os Endpoints possuem tags e subtags que permitem executar os testes, por:
    - Métodos HTTP: GET, POST, PUT, DELETE
    Exemplo:
    ```shell
        robot -d ./reports -i GET  usuario_test.robot
    ```
    - Subtags: encontradas nos cenários de testes, permitem rodar testes individuais
    Exemplo:
    ```shell
        robot -d ./reports -i GETUSERID  usuario_test.robot
    ```

## Resultado dos Testes
- Entrar na pasta *reports* e acessar o arquivo *log.html*


### Autora
Maria Clara Dias

