
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [analitico].[resumo_climatico_diario_cidades](
	[id_resumo_climatico_diario] [int] IDENTITY(1,1) NOT NULL,
	[id_cidade] [int] NOT NULL,
	[data_referencia] [date] NOT NULL,
	[temperatura_media_celsius] [decimal](10, 2) NULL,
	[temperatura_maxima_celsius] [decimal](10, 2) NULL,
	[precipitacao_total_mm] [decimal](10, 2) NULL,
	[media_pm25] [decimal](10, 2) NULL,
	[classificacao_risco_operacional] [varchar](20) NULL,
	[data_carga] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_analitico_resumo_climatico_diario] PRIMARY KEY CLUSTERED 
(
	[id_resumo_climatico_diario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_analitico_resumo_climatico_diario] UNIQUE NONCLUSTERED 
(
	[id_cidade] ASC,
	[data_referencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [analitico].[resumo_climatico_diario_cidades] ADD  DEFAULT (sysdatetime()) FOR [data_carga]
GO
ALTER TABLE [analitico].[resumo_climatico_diario_cidades]  WITH CHECK ADD  CONSTRAINT [FK_analitico_resumo_climatico_diario_cidades] FOREIGN KEY([id_cidade])
REFERENCES [tratado].[cidades] ([id_cidade])
GO
ALTER TABLE [analitico].[resumo_climatico_diario_cidades] CHECK CONSTRAINT [FK_analitico_resumo_climatico_diario_cidades]
GO