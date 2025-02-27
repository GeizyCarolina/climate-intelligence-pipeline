

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [controle].[execucoes_pipeline](
	[id_execucao_pipeline] [int] IDENTITY(1,1) NOT NULL,
	[nome_pipeline] [varchar](150) NOT NULL,
	[data_hora_inicio] [datetime2](7) NOT NULL,
	[data_hora_fim] [datetime2](7) NULL,
	[nome_status_execucao] [varchar](30) NOT NULL,
	[quantidade_registros_processados] [int] NULL,
	[descricao_erro] [nvarchar](max) NULL,
	[data_registro] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_controle_execucoes_pipeline] PRIMARY KEY CLUSTERED 
(
	[id_execucao_pipeline] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


ALTER TABLE [controle].[execucoes_pipeline] ADD  DEFAULT (sysdatetime()) FOR [data_registro]
GO