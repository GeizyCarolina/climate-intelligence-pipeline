CREATE INDEX IX_bruto_coordenadas_cidades_id_cidade_ibge
    ON bruto.coordenadas_cidades (id_cidade_ibge);
GO

CREATE INDEX IX_bruto_clima_por_hora_cidade_data
    ON bruto.clima_por_hora (id_cidade_ibge, data_hora_medicao);
GO

CREATE INDEX IX_bruto_qualidade_ar_por_hora_cidade_data
    ON bruto.qualidade_ar_por_hora (id_cidade_ibge, data_hora_medicao);
GO

CREATE INDEX IX_tratado_medicoes_climaticas_cidade_data
    ON tratado.medicoes_climaticas (id_cidade, data_hora_medicao);
GO

CREATE INDEX IX_tratado_medicoes_qualidade_ar_cidade_data
    ON tratado.medicoes_qualidade_ar (id_cidade, data_hora_medicao);
GO

CREATE INDEX IX_analitico_resumo_climatico_diario_cidade_data
    ON analitico.resumo_climatico_diario_cidades (id_cidade, data_referencia);
GO