from src.conexao import criar_conexao

def carregar_cidades(dados_cidades):
    conexao = criar_conexao() # conexão com o banco de dados
    cursor = conexao.cursor() # executa comandos SQL no banco

    quantidade_inserida = 0
    for cidade in dados_cidades:
        cursor.execute("""
            INSERT INTO bruto.cidades_ibge (id_cidade_ibge, nome_cidade, sigla_estado, nome_regiao, nome_fonte, json_resposta)
            VALUES (?, ?, ?, ?, ?, ?)
        """, (
            cidade["id_cidade_ibge"],
            cidade["nome_cidade"],
            cidade["sigla_estado"],
            cidade["nome_regiao"],
            cidade["nome_fonte"],
            cidade["json_resposta"]
        ))

        if cursor.rowcount > 0:
            quantidade_inserida += 1
            
        else:   
            print(f"Falha ao inserir a cidade: {cidade['nome_cidade']}")
            return False

    conexao.commit() # confirma as alterações no banco
    cursor.close() # fecha o cursor 

    return quantidade_inserida



    