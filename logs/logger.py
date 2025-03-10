import logging
import os
from src.config import LOG_FILE


def configurar_logger():
    # cria pasta looger se nao existir ainda
    os.makedirs(os.path.dirname(LOG_FILE), exist_ok=True) # exists evita erro caso a pasta já exista

    # configuracao do logger para escrever no arquivo e no console
    logging.basicConfig(
        # define o tipo de log, info significa que vai poder usar INFO, WARNING, ERROR e CRITICAL
        level=logging.INFO,
        # define como o log vai ser exibido exemplo: 2025-02-01 14:30:00 | INFO | Pipeline iniciado
        format="%(asctime)s - %(levelname)s - %(message)s",
        # define para onde os logs vão ser enviados.
        #Salva os logs em um arquivo LOG_FILE → caminho do arquivo
        handlers=[
            logging.FileHandler(LOG_FILE, encoding="utf-8"),
            logging.StreamHandler() # mostra no console
        ]
    )

    return logging.getLogger("pipeline_clima")