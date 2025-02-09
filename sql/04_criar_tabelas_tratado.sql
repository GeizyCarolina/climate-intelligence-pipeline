
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tratado].[medicoes_climaticas](
	[id_medicao_climatica] [int] IDENTITY(1,1) NOT NULL,
	[id_cidade] [int] NOT NULL,
	[data_hora_medicao] [datetime2](7) NOT NULL,
	[temperatura_celsius] [decimal](10, 2) NULL,
	[umidade_relativa] [decimal](10, 2) NULL,
	[precipitacao_mm] [decimal](10, 2) NULL,
	[velocidade_vento_kmh] [decimal](10, 2) NULL,
	[codigo_condicao_tempo] [int] NULL,
	[data_carga] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_tratado_medicoes_climaticas] PRIMARY KEY CLUSTERED 
(
	[id_medicao_climatica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_tratado_medicoes_climaticas] UNIQUE NONCLUSTERED 
(
	[id_cidade] ASC,
	[data_hora_medicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tratado].[medicoes_qualidade_ar](
	[id_medicao_qualidade_ar] [int] IDENTITY(1,1) NOT NULL,
	[id_cidade] [int] NOT NULL,
	[data_hora_medicao] [datetime2](7) NOT NULL,
	[particulas_pm10] [decimal](10, 2) NULL,
	[particulas_pm25] [decimal](10, 2) NULL,
	[ozonio] [decimal](10, 2) NULL,
	[dioxido_nitrogenio] [decimal](10, 2) NULL,
	[data_carga] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_tratado_medicoes_qualidade_ar] PRIMARY KEY CLUSTERED 
(
	[id_medicao_qualidade_ar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_tratado_medicoes_qualidade_ar] UNIQUE NONCLUSTERED 
(
	[id_cidade] ASC,
	[data_hora_medicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [tratado].[cidades] ADD  DEFAULT ((1)) FOR [indicador_ativo]
GO
ALTER TABLE [tratado].[cidades] ADD  DEFAULT (sysdatetime()) FOR [data_carga]
GO
ALTER TABLE [tratado].[medicoes_climaticas] ADD  DEFAULT (sysdatetime()) FOR [data_carga]
GO
ALTER TABLE [tratado].[medicoes_qualidade_ar] ADD  DEFAULT (sysdatetime()) FOR [data_carga]
GO

ALTER TABLE [tratado].[medicoes_climaticas]  WITH CHECK ADD  CONSTRAINT [FK_tratado_medicoes_climaticas_cidades] FOREIGN KEY([id_cidade])
REFERENCES [tratado].[cidades] ([id_cidade])
GO
ALTER TABLE [tratado].[medicoes_climaticas] CHECK CONSTRAINT [FK_tratado_medicoes_climaticas_cidades]
GO
ALTER TABLE [tratado].[medicoes_qualidade_ar]  WITH CHECK ADD  CONSTRAINT [FK_tratado_medicoes_qualidade_ar_cidades] FOREIGN KEY([id_cidade])
REFERENCES [tratado].[cidades] ([id_cidade])
GO
ALTER TABLE [tratado].[medicoes_qualidade_ar] CHECK CONSTRAINT [FK_tratado_medicoes_qualidade_ar_cidades]
GO
