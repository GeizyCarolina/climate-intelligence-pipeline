
from src.coordenadas.extrair_coordenadas import get_coordenada, list_cidades
import json


def transformar_coordenadas():

    """ if coordenada['results']:
            return coordenada['results'][0]['latitude'], coordenada['results'][0]['longitude']
        else:
            return None, None """
    
    cidades = list_cidades()
    coordenadas_cidades = [] # Novo dicionário para guardar os resultados

    # x representa o nome da cidade (o valor do dicionário original)
    for id_cidade, nome_cidade in cidades.items():
        dados_api = get_coordenada(nome_cidade)
        
        if dados_api:
            x = dados_api['results'][0]
            dados = {
                "id_coordenada_bruta": x.get('id'),
                "id_cidade_ibge": x.get('name'),
                "nome_cidade_consultada": id_cidade,
                "latitude": x.get('latitude'),
                "longitude": x.get('longitude'),
                "nome_fuso_horario": x.get('timezone'),
                "sigla_pais": x.get('country_code'),
                #"json_resposta": json.dumps(x)  
            }
            coordenadas_cidades.append(dados)  # Adiciona o dicionário ao array de coordenadas
        
    # Imprime o dicionário de coordenadas no formato JSON
    return coordenadas_cidades