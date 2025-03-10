# Cria a conexao com o banco de dados usando a string de conexão definida em config.py


import pyodbc
from src.config import DB_CONNECTION_STRING

def criar_conexao():
    try:
        conn = pyodbc.connect(DB_CONNECTION_STRING)
        return conn
    except Exception as e:
        print(f"Erro ao criar conexão com o banco de dados: {e}")
        return None
    