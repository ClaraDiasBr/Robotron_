from faker import Faker
import requests as req
import json

def Criar_Dados_Dinamicos_Usuario_Admin_Ou_Nao(admin):
    fake = Faker()
    nome = fake.name()
    email = fake.email()
    senha = "senha123"
    payload = {"nome": nome, "email": email, "password": senha, "administrador":admin}
    return payload

def Buscar_Quantidade_Usuarios_Cadastrado():
    r = req.get("http://localhost:3000/usuarios/")
    response_js = r.json()  
    return response_js["quantidade"]

def Buscar_Quantidade_Produtos_Cadastrados():
    r = req.get("http://localhost:3000/produtos/")
    response_js = r.json()  
    return response_js["quantidade"]