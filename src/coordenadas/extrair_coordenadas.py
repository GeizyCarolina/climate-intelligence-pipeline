# essa parte de oordenadas vamos pegar informações que estao na tabela cidade, para popular a tabela de coordenadas
# na tabela cidade vamos pegar o id e o nome das cidades, e consultar na api 
# vou passar o nome da cidade na funcao get_coordinates, e ela vai retornar as coordenadas da cidade, 
# e vamos salvar essas coordenadas na tabela de coordenadas, junto com o id da cidade

from src.conexao import criar_conexao

''' 

fazer a requisicao com o nome da cidade
emtao tenho que percorrer a tabela cidade, fazer uma lista dos nomes das cidades e seu id
ou entao um dicionario com o id da cidade como chave e o nome da cidade como valor, ai eu passo o nome da cidade para a funcao 
get_coordinates

'''

def lista_cidades():

    conexao = criar_conexao()
    cursor = conexao.cursor()
    
    #dicionario id nome da cidade
    cidades = {}       

    cursor.execute("SELECT id_cidade_ibge, nome_cidade FROM bruto.cidades_ibge")

    for row in cursor.fetchall():
        id_cidade = row[0]
        nome_cidade = row[1]
        cidades[id_cidade] = nome_cidade

    return cidades

