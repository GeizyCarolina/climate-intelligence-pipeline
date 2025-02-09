

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bruto].[cidades_ibge](
	[id_cidade_ibge] [int] NOT NULL,
	[nome_cidade] [varchar](150) NOT NULL,
	[sigla_estado] [char](2) NOT NULL,
	[nome_regiao] [varchar](50) NULL,
	[nome_fonte] [varchar](50) NOT NULL,
	[json_resposta] [nvarchar](max) NULL,
	[data_insercao] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_bruto_cidades_ibge] PRIMARY KEY CLUSTERED 
(
	[id_cidade_ibge] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bruto].[clima_por_hora](
	[id_clima_bruto] [int] IDENTITY(1,1) NOT NULL,
	[id_cidade_ibge] [int] NOT NULL,
	[data_hora_medicao] [datetime2](7) NOT NULL,
	[temperatura_celsius] [decimal](10, 2) NULL,
	[umidade_relativa] [decimal](10, 2) NULL,
	[precipitacao_mm] [decimal](10, 2) NULL,
	[velocidade_vento_kmh] [decimal](10, 2) NULL,
	[codigo_condicao_tempo] [int] NULL,
	[data_insercao] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_bruto_clima_por_hora] PRIMARY KEY CLUSTERED 
(
	[id_clima_bruto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_bruto_clima_por_hora] UNIQUE NONCLUSTERED 
(
	[id_cidade_ibge] ASC,
	[data_hora_medicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bruto].[coordenadas_cidades](
	[id_coordenada_bruta] [int] IDENTITY(1,1) NOT NULL,
	[id_cidade_ibge] [int] NOT NULL,
	[nome_cidade_consultada] [varchar](150) NOT NULL,
	[latitude] [decimal](9, 6) NULL,
	[longitude] [decimal](9, 6) NULL,
	[nome_fuso_horario] [varchar](100) NULL,
	[sigla_pais] [varchar](10) NULL,
	[json_resposta] [nvarchar](max) NULL,
	[data_insercao] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_bruto_coordenadas_cidades] PRIMARY KEY CLUSTERED 
(
	[id_coordenada_bruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [bruto].[qualidade_ar_por_hora](
	[id_qualidade_ar_bruto] [int] IDENTITY(1,1) NOT NULL,
	[id_cidade_ibge] [int] NOT NULL,
	[data_hora_medicao] [datetime2](7) NOT NULL,
	[particulas_pm10] [decimal](10, 2) NULL,
	[particulas_pm25] [decimal](10, 2) NULL,
	[ozonio] [decimal](10, 2) NULL,
	[dioxido_nitrogenio] [decimal](10, 2) NULL,
	[data_insercao] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_bruto_qualidade_ar_por_hora] PRIMARY KEY CLUSTERED 
(
	[id_qualidade_ar_bruto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_bruto_qualidade_ar_por_hora] UNIQUE NONCLUSTERED 
(
	[id_cidade_ibge] ASC,
	[data_hora_medicao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [bruto].[cidades_ibge] ADD  DEFAULT (sysdatetime()) FOR [data_insercao]
GO
ALTER TABLE [bruto].[clima_por_hora] ADD  DEFAULT (sysdatetime()) FOR [data_insercao]
GO
ALTER TABLE [bruto].[coordenadas_cidades] ADD  DEFAULT (sysdatetime()) FOR [data_insercao]
GO
ALTER TABLE [bruto].[qualidade_ar_por_hora] ADD  DEFAULT (sysdatetime()) FOR [data_insercao]
GO


ALTER TABLE [bruto].[clima_por_hora]  WITH CHECK ADD  CONSTRAINT [FK_bruto_clima_cidades_ibge] FOREIGN KEY([id_cidade_ibge])
REFERENCES [bruto].[cidades_ibge] ([id_cidade_ibge])
GO
ALTER TABLE [bruto].[clima_por_hora] CHECK CONSTRAINT [FK_bruto_clima_cidades_ibge]
GO
ALTER TABLE [bruto].[coordenadas_cidades]  WITH CHECK ADD  CONSTRAINT [FK_bruto_coordenadas_cidades_ibge] FOREIGN KEY([id_cidade_ibge])
REFERENCES [bruto].[cidades_ibge] ([id_cidade_ibge])
GO
ALTER TABLE [bruto].[coordenadas_cidades] CHECK CONSTRAINT [FK_bruto_coordenadas_cidades_ibge]
GO
ALTER TABLE [bruto].[qualidade_ar_por_hora]  WITH CHECK ADD  CONSTRAINT [FK_bruto_qualidade_ar_cidades_ibge] FOREIGN KEY([id_cidade_ibge])
REFERENCES [bruto].[cidades_ibge] ([id_cidade_ibge])
GO
ALTER TABLE [bruto].[qualidade_ar_por_hora] CHECK CONSTRAINT [FK_bruto_qualidade_ar_cidades_ibge]
GO