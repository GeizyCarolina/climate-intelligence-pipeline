from asyncio.log import logger
import json
from datetime import datetime
from logs.logger import configurar_logger
from logs.registro_logs import log_inicio_execucao_pipeline, log_fim_execucao_pipeline
from src.config import NOME_PIPELINE
from src.conexao import criar_conexao
from src.cidade.extrair_cidades_ibge import extrair_cidades
from src.cidade.transformar_cidades_ibge import transformar_cidades  
from src.cidade.carregar_cidades_ibge import carregar_cidades  


def main():
    logger = configurar_logger()
    id_execucao = None
    qnt_dados_carregados = 0
    
    try:
        logger.info("Iniciando pipeline de ingestão de cidades do IBGE.")

        logger.info("Extraindo dados das cidades do IBGE...")
        dados_cidades = extrair_cidades()

        logger.info(f"Quantidade de dados extraidos: {len(dados_cidades)}")


        logger.info("Transformando dados das cidades do IBGE...")
        cidades_transdormadas, qnt_dados = transformar_cidades(dados_cidades)

        logger.info(f"Quantidade de dados transformados: {qnt_dados}")



        logger.info("Inserindo dados das cidades do IBGE no banco de dados...")
        id_execucao_pipeline = log_inicio_execucao_pipeline()
        logger.info(f"ID da execução da pipeline: {id_execucao_pipeline}")

        quantidade_inserida = carregar_cidades(cidades_transdormadas)
        logger.info(f"Quantidade de dados inseridos no banco de dados: {quantidade_inserida}")
        
        if(quantidade_inserida > 0):
            log_fim_execucao_pipeline(id_execucao_pipeline, quantidade_inserida, "SUCESSO")


        logger.info("Pipeline de ingestão de cidades do IBGE finalizada com sucesso.")
        

    except Exception as e:
        logger.exception("Erro durante a execução do pipeline.")

        log_fim_execucao_pipeline(id_execucao_pipeline, qnt_dados_carregados, "FALHA", f"`{str(e)}`")



if __name__ == "__main__":    
    main()