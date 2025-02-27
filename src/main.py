import json

from conexao import criar_conexao
from extrair_cidades_ibge import extrair_cidades
from transformar_cidades_ibge import transformar_cidades  
from carregar_cidades_ibge import carregar_cidades  


def main():
    print("Climate Intelligence Pipeline - projeto inicial")
    conexao = criar_conexao()
    if conexao:
        print("Tudo certo!")
        dados_cidades = extrair_cidades()
        transformada = transformar_cidades(dados_cidades)
        print(json.dumps(transformada[:2], indent=4, ensure_ascii=False))
        insert_cidades = carregar_cidades(transformada)
        print(f"{insert_cidades} cidades inseridas com sucesso.")
        

if __name__ == "__main__":    
    main()