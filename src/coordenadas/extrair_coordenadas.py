# essa parte de oordenadas vamos pegar informações que estao na tabela cidade, para popular a tabela de coordenadas
# na tabela cidade vamos pegar o id e o nome das cidades, e consultar na api 
# vou passar o nome da cidade na funcao get_coordinates, e ela vai retornar as coordenadas da cidade, 
# e vamos salvar essas coordenadas na tabela de coordenadas, junto com o id da cidade

import json
from src.conexao import criar_conexao
import requests as requests

''' 

fazer a requisicao com o nome da cidade
entao tenho que percorrer a tabela cidade, fazer uma lista dos nomes das cidades e seu id
ou entao um dicionario com o id da cidade como chave e o nome da cidade como valor, ai eu passo o nome da cidade para a funcao 
get_coordinates

'''

def list_cidades():

    conexao = criar_conexao()
    cursor = conexao.cursor()
    
    #dicionario id nome da cidade
    cidades = {}       

    cursor.execute("SELECT TOP 3 id_cidade_ibge, nome_cidade FROM bruto.cidades_ibge")

    for row in cursor.fetchall():
        id_cidade = row[0]
        nome_cidade = row[1]

        cidades[id_cidade] = nome_cidade

    return cidades


def get_coordenada(cidade):
    
    URL_API_GEOCCODING = "https://geocoding-api.open-meteo.com/v1/search?name={cidade}&count=1&language=pt&format=json" 

    response = requests.get(URL_API_GEOCCODING.format(cidade=cidade))
    response.raise_for_status()  # Verifica se a requisição foi bem-sucedida

    return response.json()  # Retorna os dados em formato JSON

    
