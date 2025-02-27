# Pega o JSON da API e transforma em algo mais organizado para salvar no banco.

import json

def transformar_cidades(dados_cidades):
    
    #listta
    cidades_transformadas = []
    
    # percorrer a api do json
    for cidade in dados_cidades:
        microrregiao = cidade.get("microrregiao") or {}
        mesorregiao = microrregiao.get("mesorregiao") or {}
        uf = mesorregiao.get("UF") or {}
        regiao = uf.get("regiao") or {}

        dados = {
            "id_cidade_ibge": cidade.get("id"),
            "nome_cidade": cidade.get("nome"),
            "sigla_estado": uf.get("sigla"),
            "nome_regiao": regiao.get("nome"),
            "nome_fonte": "API IBGE",
            "json_resposta": json.dumps(cidade, indent=4, ensure_ascii=False)
        }

        cidades_transformadas.append(dados)

    return cidades_transformadas