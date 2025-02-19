# Cria a conexao com o banco de dados usando a string de conexão definida em config.py


import pyodbc
from config import DB_CONNECTION_STRING

def criar_conexao():
    try:
        conn = pyodbc.connect(DB_CONNECTION_STRING)
        print("Conexão com o banco de dados criada com sucesso!")
        return conn
    except Exception as e:
        print(f"Erro ao criar conexão com o banco de dados: {e}")
        return None
    