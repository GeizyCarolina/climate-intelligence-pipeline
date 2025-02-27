# Busca os dados dda API do IBGE

import requests
from config import URL_API

def extrair_cidades():
    resposta = requests.get(URL_API)
    resposta.raise_for_status()  # Verifica se a requisição foi bem-sucedida
    return resposta.json()  # Retorna os dados em formato JSON