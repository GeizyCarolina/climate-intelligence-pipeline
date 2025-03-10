# Registrar logs para a pipeline de inteligência climática
# inicio, fim, hora de execucao, sucesso ou falha, mensagens de erro, etc.

from datetime import datetime
from src.conexao import criar_conexao
from src.config import NOME_PIPELINE

def log_inicio_execucao_pipeline():

    dt_inicio = datetime.now()
    nome_pipeline = NOME_PIPELINE
    nome_status_execucao = "EM EXECUÇÃO"

    # Criar conexão com o banco de dados
    conexao = criar_conexao()   
    cursor = conexao.cursor()

    sql = """
        INSERT INTO controle.execucoes_pipeline(
        nome_pipeline, 
        data_hora_inicio, 
        nome_status_execucao)

        OUTPUT inserted.id_execucao_pipeline

        VALUES (?, ?, ?)
    """

    cursor.execute(sql, nome_pipeline, dt_inicio, nome_status_execucao)
    id_execucao_pipeline = cursor.fetchone()[0]
    conexao.commit()
    cursor.close()
    conexao.close()

    return id_execucao_pipeline


def log_fim_execucao_pipeline(id_execucao_pipeline, quantidade_registros_processados, staus_execucao, descricao_erro=None):

    conexao = criar_conexao()
    cursor = conexao.cursor()

    sql = """
        UPDATE controle.execucoes_pipeline
        SET data_hora_fim = ? ,
        quantidade_registros_processados = ?,
        nome_status_execucao = ?,
        descricao_erro = ?  
        WHERE id_execucao_pipeline = ?
    """
    cursor.execute(sql, datetime.now(), quantidade_registros_processados, staus_execucao, descricao_erro, id_execucao_pipeline)
    conexao.commit() 

    return True
