# Climate Intelligence Pipeline

## Descrição
Pipeline ETL em Python para coletar, transformar e armazenar dados climáticos e de qualidade do ar de municípios brasileiros em SQL Server.

## Objetivo
Simular um projeto real de Engenharia de Dados, com ingestão de dados via APIs públicas, tratamento, carga em banco relacional e criação de camadas analíticas.

## Arquitetura inicial
```text
API -> Extração em Python -> Transformação -> SQL Server -> Camada analítica

src/: código-fonte do pipeline
sql/: scripts de criação e transformação no banco
data/: arquivos brutos e processados
logs/: logs de execução
docs/: documentação técnica
tests/: todos os tipos de teste a ser feito



Tecnologias

Python
SQL Server
Pandas
Requests
PyODBC


Status

Projeto em desenvolvimento por fases.