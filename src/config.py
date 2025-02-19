# Esse arquivo guarda as configurações do projeto.

import os
from dotenv import load_dotenv


#Lê o arquivo .env e coloca os valores na memória.
load_dotenv()


URL_API = "https://servicodados.ibge.gov.br/api/v1/localidades/municipios"

# Recupera os valores das variáveis de ambiente usando o módulo os.getenv() e armazena em variáveis locais

DB_CONFIG = {
    "driver": os.getenv("DB_DRIVER"),
    "server": os.getenv("DB_SERVER"),
    "database": os.getenv("DB_DATABASE"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),   
}

DB_CONNECTION_STRING = os.getenv("DB_CONNECTION_STRING")

LOG_FILE = os.getenv("LOG_FILE", "logs/etl.log")
NOME_PIPELINE = "ingestao_cidades_ibge"
