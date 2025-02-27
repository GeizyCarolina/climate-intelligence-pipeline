from conexao import criar_conexao

def carregar_cidades(dados_cidades):
    conexao = criar_conexao() # conexão com o banco de dados
    cursor = conexao.cursor() # executa comandos SQL no banco


    for cidade in dados_cidades:
        cursor.execute("""
            INSERT INTO cidades_ibge (id_cidade_ibge, nome_cidade, sigla_estado, nome_regiao, nome_fonte, json_resposta)
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
            quantidade_inserida =+ 1
            print(f"{quantidade_inserida} cidade(s) inserida(s) com sucesso.")
        else:   
            print(f"Falha ao inserir a cidade: {cidade['nome_cidade']}")

    conexao.commit() # confirma as alterações no banco
    cursor.close() # fecha o cursor 

    return quantidade_inserida




    