# Climate Intelligence Pipeline

## Descrição
Pipeline ETL em Python para coletar, transformar e armazenar dados climáticos e de qualidade do ar de municípios brasileiros em SQL Server.

## Objetivo
Simular um projeto real de Engenharia de Dados, com ingestão de dados via APIs públicas, tratamento, carga em banco relacional e criação de camadas analíticas.

## Arquitetura inicial
API -> Extração em Python -> Transformação -> SQL Server -> Camada analítica

src/: código-fonte do pipeline
sql/: scripts de criação e transformação no banco
data/: arquivos brutos e processados
logs/: logs de execução
docs/: documentação técnica
tests/: todos os tipos de teste a ser feito

## Estrutura do banco de dados
- bruto: dados brutos das APIs
- tratado: dados limpos e estruturados
- analitico: dados agregados para análise
- controle: auditoria e execução do pipeline

## Tecnologias
Python
SQL Server
Pandas
Requests
PyODBC

### Funcionalidades implementadas
- extração de dados via API REST
- transformação de JSON para estrutura tabular
- carga incremental com prevenção de duplicidade
- logging em arquivo e console
- auditoria de execução em tabela de controle



## Status
Projeto em desenvolvimento por fases.
