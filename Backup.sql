USE [master]
GO
/****** Object:  Database [BRGamersSquare]    Script Date: 09/05/2023 23:49:59 ******/
CREATE DATABASE [BRGamersSquare]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BRGamersSquare', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BRGamersSquare.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BRGamersSquare_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BRGamersSquare_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BRGamersSquare] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BRGamersSquare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BRGamersSquare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BRGamersSquare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BRGamersSquare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BRGamersSquare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BRGamersSquare] SET ARITHABORT OFF 
GO
ALTER DATABASE [BRGamersSquare] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BRGamersSquare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BRGamersSquare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BRGamersSquare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BRGamersSquare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BRGamersSquare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BRGamersSquare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BRGamersSquare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BRGamersSquare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BRGamersSquare] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BRGamersSquare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BRGamersSquare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BRGamersSquare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BRGamersSquare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BRGamersSquare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BRGamersSquare] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BRGamersSquare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BRGamersSquare] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BRGamersSquare] SET  MULTI_USER 
GO
ALTER DATABASE [BRGamersSquare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BRGamersSquare] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BRGamersSquare] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BRGamersSquare] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BRGamersSquare] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BRGamersSquare] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BRGamersSquare] SET QUERY_STORE = OFF
GO
USE [BRGamersSquare]
GO
/****** Object:  Table [dbo].[CargasLayout]    Script Date: 09/05/2023 23:50:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CargasLayout](
	[id] [int] NOT NULL,
	[idcarga] [int] NULL,
	[Coluna] [nvarchar](200) NULL,
	[tipo] [nvarchar](50) NULL,
	[obrigatorio] [bit] NULL,
	[Minimo] [int] NULL,
	[maximo] [int] NULL,
	[ordem] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriaJogo]    Script Date: 09/05/2023 23:50:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaJogo](
	[CategoriaJogoId] [int] IDENTITY(1,1) NOT NULL,
	[NomeDoJogo] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoriaJogoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventoLog]    Script Date: 09/05/2023 23:50:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Evento] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 09/05/2023 23:50:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime2](3) NOT NULL,
	[TipoEvento] [int] NULL,
	[Mensagem] [varchar](200) NULL,
	[Exception] [varchar](400) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postagem]    Script Date: 09/05/2023 23:50:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postagem](
	[PostagemID] [int] IDENTITY(1,1) NOT NULL,
	[TextoPostagem] [nvarchar](max) NULL,
	[Imagem] [nvarchar](max) NULL,
	[DataHora] [datetime] NULL,
	[UsuarioGameId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PostagemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Squares]    Script Date: 09/05/2023 23:50:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Squares](
	[GruposId] [int] IDENTITY(1,1) NOT NULL,
	[NomeGrupo] [nvarchar](max) NULL,
	[QtdeParticipantes] [int] NULL,
	[QtdePostagens] [int] NULL,
	[CategoriaJogoId] [int] NULL,
	[PostagemId] [int] NULL,
	[membroID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GruposId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 09/05/2023 23:50:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioGameId] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](100) NULL,
	[UserName] [nvarchar](50) NULL,
	[Senha] [nvarchar](max) NULL,
	[email] [nvarchar](50) NULL,
	[idade] [int] NULL,
	[Imagem] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioGameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[CargasLayout] ([id], [idcarga], [Coluna], [tipo], [obrigatorio], [Minimo], [maximo], [ordem]) VALUES (1, 2, N'DATANASCIMENTO', N'Data', 0, 0, 0, 26)
INSERT [dbo].[CargasLayout] ([id], [idcarga], [Coluna], [tipo], [obrigatorio], [Minimo], [maximo], [ordem]) VALUES (2, 3, N'DATANASCIMENTO', N'Data', 0, 0, 0, 26)
GO
SET IDENTITY_INSERT [dbo].[CategoriaJogo] ON 

INSERT [dbo].[CategoriaJogo] ([CategoriaJogoId], [NomeDoJogo]) VALUES (1, N'God of Peace')
INSERT [dbo].[CategoriaJogo] ([CategoriaJogoId], [NomeDoJogo]) VALUES (2, N'The Life Sim')
INSERT [dbo].[CategoriaJogo] ([CategoriaJogoId], [NomeDoJogo]) VALUES (3, N'Top Run')
INSERT [dbo].[CategoriaJogo] ([CategoriaJogoId], [NomeDoJogo]) VALUES (4, N'Dungeons and dragons and fairies')
INSERT [dbo].[CategoriaJogo] ([CategoriaJogoId], [NomeDoJogo]) VALUES (5, N'The Cow')
INSERT [dbo].[CategoriaJogo] ([CategoriaJogoId], [NomeDoJogo]) VALUES (6, N'God of Peace;5;2;1;')
INSERT [dbo].[CategoriaJogo] ([CategoriaJogoId], [NomeDoJogo]) VALUES (7, N'The Life Sim;5;3;2;')
INSERT [dbo].[CategoriaJogo] ([CategoriaJogoId], [NomeDoJogo]) VALUES (8, N'Top Run;5;4;3;')
INSERT [dbo].[CategoriaJogo] ([CategoriaJogoId], [NomeDoJogo]) VALUES (9, N'Dungeons and dragons and fairies;5;1;4;')
INSERT [dbo].[CategoriaJogo] ([CategoriaJogoId], [NomeDoJogo]) VALUES (10, N'The Cow;5;2;5;')
SET IDENTITY_INSERT [dbo].[CategoriaJogo] OFF
GO
SET IDENTITY_INSERT [dbo].[EventoLog] ON 

INSERT [dbo].[EventoLog] ([id], [Evento]) VALUES (1, N'Informação')
INSERT [dbo].[EventoLog] ([id], [Evento]) VALUES (2, N'Erro')
SET IDENTITY_INSERT [dbo].[EventoLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (1, CAST(N'2022-12-16T22:03:21.0730000' AS DateTime2), 1, N'O Usuario Nelson Nicolas Viana Foi cadastrado no sistema.', N'null')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (2, CAST(N'2022-12-16T22:08:53.2970000' AS DateTime2), 1, N'Um Erro Ocorreu, Verifique o banco de dados para mais detalhes', N'Usuario Não encontrado')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (3, CAST(N'2022-12-16T22:12:02.1330000' AS DateTime2), 1, N'O Usuario de Id 40 Foi apagado do sistema.', N'-')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (4, CAST(N'2022-12-21T09:57:45.6070000' AS DateTime2), 1, N'O Usuario Vera Nicole Allana Mendes Foi cadastrado no sistema.', N'-')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (5, CAST(N'2022-12-21T10:33:01.0270000' AS DateTime2), 1, N'Ocorreu um erro, Verifique o banco de dados para mais detalhes', N'Unable to cast object of type ''System.DBNull'' to type ''System.String''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (6, CAST(N'2022-12-21T10:34:37.1840000' AS DateTime2), 1, N'Ocorreu um erro, Verifique o banco de dados para mais detalhes', N'Unable to cast object of type ''System.DBNull'' to type ''System.String''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (7, CAST(N'2022-12-21T10:34:44.4830000' AS DateTime2), 1, N'Ocorreu um erro, Verifique o banco de dados para mais detalhes', N'Unable to cast object of type ''System.DBNull'' to type ''System.String''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (8, CAST(N'2022-12-21T10:34:59.8060000' AS DateTime2), 1, N'Ocorreu um erro, Verifique o campo Exception no SQL para mais detalhes', N'Unable to cast object of type ''System.DBNull'' to type ''System.String''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (9, CAST(N'2022-12-21T10:45:27.0540000' AS DateTime2), 1, N'O Usuario Aline Aparecida Viana Foi cadastrado no sistema.', N'-')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (10, CAST(N'2022-12-28T16:38:17.3460000' AS DateTime2), 1, N'Ocorreu um erro, Verifique o banco de dados para mais detalhes', N'Unable to cast object of type ''APIDesafio.Modelos.Usuarios'' to type ''Microsoft.AspNetCore.Mvc.IActionResult''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (11, CAST(N'2022-12-28T16:39:59.4900000' AS DateTime2), 1, N'Ocorreu um erro, Verifique o banco de dados para mais detalhes', N'Unable to cast object of type ''APIDesafio.Modelos.Usuarios'' to type ''Microsoft.AspNetCore.Mvc.IActionResult''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (12, CAST(N'2022-12-28T16:40:09.3120000' AS DateTime2), 1, N'Ocorreu um erro, Verifique o banco de dados para mais detalhes', N'Unable to cast object of type ''APIDesafio.Modelos.Usuarios'' to type ''Microsoft.AspNetCore.Mvc.IActionResult''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (13, CAST(N'2022-12-28T16:43:51.2410000' AS DateTime2), 1, N'O Usuario de Id 42 Foi apagado do sistema.', N'-')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (14, CAST(N'2022-12-28T16:47:38.6390000' AS DateTime2), 1, N'O Usuario de Id 43 Foi apagado do sistema.', N'-')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (15, CAST(N'2022-12-28T16:52:29.3840000' AS DateTime2), 1, N'Ocorreu um erro', N'Unable to cast object of type ''APIDesafio.Modelos.Usuarios'' to type ''Microsoft.AspNetCore.Mvc.IActionResult''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (16, CAST(N'2022-12-28T16:53:28.8120000' AS DateTime2), 1, N'Ocorreu um erro', N'Unable to cast object of type ''APIDesafio.Modelos.Usuarios'' to type ''Microsoft.AspNetCore.Mvc.IActionResult''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (17, CAST(N'2022-12-28T16:54:16.1090000' AS DateTime2), 1, N'O Usuario de Id 45 Foi apagado do sistema.', N'-')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (18, CAST(N'2022-12-28T17:19:00.0740000' AS DateTime2), 1, N'Ocorreu um erro', N'Unable to cast object of type ''APIDesafio.Modelos.Usuarios'' to type ''Microsoft.AspNetCore.Mvc.IActionResult''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (19, CAST(N'2022-12-28T17:19:08.4930000' AS DateTime2), 1, N'Ocorreu um erro', N'Unable to cast object of type ''APIDesafio.Modelos.Usuarios'' to type ''Microsoft.AspNetCore.Mvc.IActionResult''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (20, CAST(N'2022-12-28T17:19:09.2360000' AS DateTime2), 1, N'Ocorreu um erro', N'Unable to cast object of type ''APIDesafio.Modelos.Usuarios'' to type ''Microsoft.AspNetCore.Mvc.IActionResult''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (21, CAST(N'2022-12-28T17:19:09.7640000' AS DateTime2), 1, N'Ocorreu um erro', N'Unable to cast object of type ''APIDesafio.Modelos.Usuarios'' to type ''Microsoft.AspNetCore.Mvc.IActionResult''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (22, CAST(N'2022-12-28T17:19:10.2760000' AS DateTime2), 1, N'Ocorreu um erro', N'Unable to cast object of type ''APIDesafio.Modelos.Usuarios'' to type ''Microsoft.AspNetCore.Mvc.IActionResult''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (23, CAST(N'2022-12-28T17:19:31.9110000' AS DateTime2), 1, N'O Usuario de Id 47 Foi apagado do sistema.', N'-')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (24, CAST(N'2022-12-28T17:25:37.0000000' AS DateTime2), 1, N'O Usuario de Id 48 Foi apagado do sistema.', N'-')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (25, CAST(N'2022-12-28T17:50:25.2330000' AS DateTime2), 1, N'Ocorreu um erro', N'Unable to cast object of type ''APIDesafio.Modelos.Usuarios'' to type ''Microsoft.AspNetCore.Mvc.IActionResult''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (26, CAST(N'2022-12-28T17:51:27.1990000' AS DateTime2), 1, N'O Usuario Evelyn Laís Rafaela Pires Foi cadastrado no sistema.', N'-')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (27, CAST(N'2022-12-28T17:58:35.1040000' AS DateTime2), 1, N'O Usuario Evelyn Laís Rafaela Pires Foi cadastrado no sistema.', N'-')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (28, CAST(N'2023-01-03T17:52:02.3270000' AS DateTime2), 1, N'A Postagem de Id 23 foi apagada em 03/01/2023 17:52:02', N'Nenhum Erro encontrado')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (29, CAST(N'2023-01-09T15:14:52.2260000' AS DateTime2), 1, N'A o Usuario 1 fez uma nova postagem em 09/01/2023 15:14:52', N'Não foi encontrado erros')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (30, CAST(N'2023-01-09T15:17:29.0040000' AS DateTime2), 1, N'A o Usuario 2 fez uma nova postagem em 09/01/2023 15:17:29', N'Não foi encontrado erros')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (31, CAST(N'2023-01-09T15:18:55.2460000' AS DateTime2), 1, N'A o Usuario 3 fez uma nova postagem em 09/01/2023 15:18:55', N'Não foi encontrado erros')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (32, CAST(N'2023-01-09T15:19:58.1770000' AS DateTime2), 1, N'A o Usuario 5 fez uma nova postagem em 09/01/2023 15:19:58', N'Não foi encontrado erros')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (33, CAST(N'2023-01-09T15:20:35.0710000' AS DateTime2), 1, N'A Postagem de Id 27 foi apagada do sistema', N'Nenhum Erro encontrado')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (34, CAST(N'2023-01-09T15:21:03.7970000' AS DateTime2), 1, N'A o Usuario 6 fez uma nova postagem em 09/01/2023 15:21:03', N'Não foi encontrado erros')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (35, CAST(N'2023-01-09T15:23:35.5770000' AS DateTime2), 1, N'A o Usuario 8 fez uma nova postagem em 09/01/2023 15:23:35', N'Não foi encontrado erros')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (36, CAST(N'2023-01-09T15:25:41.1620000' AS DateTime2), 1, N'A o Usuario 10 fez uma nova postagem em 09/01/2023 15:25:41', N'Não foi encontrado erros')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (38, CAST(N'2023-01-13T15:55:04.6700000' AS DateTime2), 1, N'Postagem de id 26, foi alterada', N'Nenhum Erro encontrado')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (39, CAST(N'2023-01-13T15:57:24.8030000' AS DateTime2), 1, N'Postagem de id 26, foi alterada', N'Nenhum Erro encontrado')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (40, CAST(N'2023-01-13T15:59:18.2320000' AS DateTime2), 1, N'Postagem de id 26, foi alterada', N'Nenhum Erro encontrado')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (41, CAST(N'2023-01-13T16:42:10.3400000' AS DateTime2), 1, N'Postagem de id 26, foi alterada', N'Nenhum Erro encontrado')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (42, CAST(N'2023-01-13T16:44:08.1980000' AS DateTime2), 1, N'Postagem de id 26, foi alterada', N'Nenhum Erro encontrado')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (43, CAST(N'2023-01-18T14:29:36.9330000' AS DateTime2), 1, N'Ocorreu um erro, Verifique o banco de dados para mais detalhes', N'Usuario Não encontrado')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (44, CAST(N'2023-01-18T14:29:42.1710000' AS DateTime2), 1, N'Ocorreu um erro, Verifique o banco de dados para mais detalhes', N'Usuario Não encontrado')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (1043, CAST(N'2023-01-18T15:52:19.8820000' AS DateTime2), 1, N'O Usuario de Id 49 Foi apagado do sistema.', N'Nenhum Erro encontrado')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (1044, CAST(N'2023-01-18T15:52:32.0310000' AS DateTime2), 1, N'Ocorreu um erro, Verifique o banco de dados para mais detalhes', N'Failure sending mail.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (1045, CAST(N'2023-01-18T15:53:58.4170000' AS DateTime2), 1, N'Ocorreu um erro, Verifique o banco de dados para mais detalhes', N'Usuario Não encontrado')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (1046, CAST(N'2023-02-27T10:20:51.7870000' AS DateTime2), 1, N'O Usuario Teste Foi cadastrado no sistema.', N'Nenhum Erro encontrado')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (1047, CAST(N'2023-02-27T11:19:22.7910000' AS DateTime2), 1, N'Ocorreu um erro, Verifique a coluna Exception para mais detalhes', N'Unable to cast object of type ''APIDesafio.Modelos.Usuarios'' to type ''Microsoft.AspNetCore.Mvc.IActionResult''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (1048, CAST(N'2023-02-27T11:21:03.5870000' AS DateTime2), 1, N'Ocorreu um erro, Verifique a coluna Exception para mais detalhes', N'A consulta parametrizada ''(@id int,@Nome nvarchar(5),@UserName nvarchar(8),@Senha nvarchar'' espera o parâmetro ''@Imagem'', que não foi fornecido.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (1049, CAST(N'2023-02-27T11:21:53.3660000' AS DateTime2), 1, N'Ocorreu um erro, Verifique a coluna Exception para mais detalhes', N'Sintaxe incorreta próxima à palavra-chave ''Where''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (1050, CAST(N'2023-02-27T11:22:09.3030000' AS DateTime2), 1, N'Ocorreu um erro, Verifique a coluna Exception para mais detalhes', N'A consulta parametrizada ''(@id int,@Nome nvarchar(5),@UserName nvarchar(8),@Senha nvarchar'' espera o parâmetro ''@Imagem'', que não foi fornecido.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (1051, CAST(N'2023-02-27T11:22:38.8970000' AS DateTime2), 1, N'Ocorreu um erro, Verifique a coluna Exception para mais detalhes', N'Unable to cast object of type ''APIDesafio.Modelos.Usuarios'' to type ''Microsoft.AspNetCore.Mvc.IActionResult''.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (1052, CAST(N'2023-02-27T11:27:42.7830000' AS DateTime2), 1, N'Ocorreu um erro, Verifique a coluna Exception para mais detalhes', N'Os dados de sequência ou binários estão truncados na tabela ''BRGamersSquare.dbo.Usuarios'', coluna ''Senha''. Valor truncado: ''????8?????`??B ? ???_??3D?''.
A instrução foi finalizada.')
INSERT [dbo].[Logs] ([Id], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (1053, CAST(N'2023-02-27T11:29:58.4740000' AS DateTime2), 1, N'Ocorreu um erro, Verifique a coluna Exception para mais detalhes', N'Unable to cast object of type ''APIDesafio.Modelos.Usuarios'' to type ''Microsoft.AspNetCore.Mvc.IActionResult''.')
SET IDENTITY_INSERT [dbo].[Logs] OFF
GO
SET IDENTITY_INSERT [dbo].[Postagem] ON 

INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (1, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 1)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (2, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 2)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (3, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 3)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (4, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 4)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (5, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 5)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (6, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 6)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (7, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 7)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (8, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 8)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (9, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 9)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (10, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 10)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (11, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 11)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (12, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 12)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (13, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 13)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (14, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 14)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (15, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 15)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (16, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 16)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (17, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 17)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (18, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 18)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (19, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 19)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (20, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 20)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (21, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 21)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (22, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 22)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (26, N'Teste', N'c2817f9c-1a7c-4d8c-9216-5bc4a1c54655.png', CAST(N'2023-01-13T16:43:34.597' AS DateTime), 1)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (28, N'Teste1', N'443304af-9a34-4602-8601-16bf800c3100.jpg', NULL, 3)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (29, N'TEste111', N'55c0e86b-cf84-4e8e-ad22-901dde84559c.png', NULL, 5)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (30, N'DateTimeTest', N'Object reference not set to an instance of an object.', NULL, 6)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (31, N'DateTimeTest', N'd19ce183-5bec-4433-82f2-36329ee49486.jpg', NULL, 8)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (32, N' Considerando que temos bons administradores de rede, a implementação do código não pode mais se dissociar da autenticidade das informações. Por outro lado, a valorização de fatores subjetivos deve passar por alterações no escopo dos requisitos mínimos de hardware exigidos. Assim mesmo, o entendimento dos fluxos de processamento exige o upgrade e a atualização dos problemas de segurança escondidos que existem nos sistemas operacionais proprietários. Pensando mais a longo prazo, o consenso sobre a utilização da orientação a objeto talvez venha causar instabilidade do fluxo de informações.            Ainda assim, existem dúvidas a respeito de como o novo modelo computacional aqui preconizado garante a integridade dos dados envolvidos dos equipamentos pré-especificados.', N'3ae460eb-f65a-4401-8f1a-e93566ca9453.png', CAST(N'2023-01-09T15:25:29.660' AS DateTime), 10)
SET IDENTITY_INSERT [dbo].[Postagem] OFF
GO
SET IDENTITY_INSERT [dbo].[Squares] ON 

INSERT [dbo].[Squares] ([GruposId], [NomeGrupo], [QtdeParticipantes], [QtdePostagens], [CategoriaJogoId], [PostagemId], [membroID]) VALUES (1, N'Teste', 1, 1, 1, 1, 3)
SET IDENTITY_INSERT [dbo].[Squares] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (1, N'Gabriel Franco', N'Gabrielmop', N'Moop1502', N'gabriel_moop@hotmail.com', 26, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (2, N'Juliana', N'Julina29', N'string12345', N'Juliana@email.com', 30, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (3, N'Esequiel de Padua', N'esequielpadua', N'123456', N'esequiel@gmail.com', 18, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (4, N'Esther de Padua', N'estherpadua', N'123456', N'esther@gmail.com', 40, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (5, N'Rebeca de Padua', N'rebecapadua', N'123456', N'rebeca@gmail.com', 12, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (6, N'Herminia Marques', N'herminiamarques', N'123456', N'herminia@gmail.com', 27, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (7, N'Moacir Junior', N'moacirjunior', N'123456', N'moacir@gmail.com', 30, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (8, N'Cicero Alan', N'ciceroalan', N'123456', N'cicero@gmail.com', 25, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (9, N'Vera Lucia', N'veralucia', N'123456', N'vera@gmail.com', 19, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (10, N'Maria Luiza', N'marialuiza', N'123456', N'maria@gmail.com', 31, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (11, N'Mara Roberta', N'mararoberta', N'123456', N'mara@gmail.com', 12, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (12, N'Pedro Gabriel', N'pedrogabriel', N'123456', N'pedro@gmail.com', 24, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (13, N'Thyalla Maria', N'thyallamaria', N'123456', N'thyalla@gmail.com', 30, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (14, N'Rosana Abdo', N'rosanaabdo', N'123456', N'rosana@gmail.com', 28, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (15, N'Ricardo Abdo', N'ricardoabdo', N'123456', N'ricardo@gmail.com', 14, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (16, N'Joana Abdo', N'joanaabdo', N'123456', N'joana@gmail.com', 19, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (17, N'Pedro Abdo', N'pedroabdo', N'123456', N'pedro@gmail.com', 20, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (18, N'Renata Alves', N'renataalves', N'123456', N'renata@gmail.com', 18, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (19, N'Samuel Abdo', N'samuelabdo', N'123456', N'samuel@gmail.com', 29, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (20, N'Alice Abdo', N'aliceabdo', N'123456', N'alice@gmail.com', 30, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (21, N'Veronica de Padua', N'veronicapadua', N'123456', N'veronica@gmail.com', 14, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (22, N'Isabele Jesus', N'isabelejesus', N'123456', N'isabele@gmail.com', 27, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (23, N'Enzo Miguel', N'enzomiguel', N'123456', N'enzo@gmail.com', 30, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (24, N'Debora Alves', N'Deboraalves', N'123456', N'Debora@gmail.com', 42, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (25, N'Julia Vitoria', N'juliaVitoria', N'123456', N'julia@gmail.com', 17, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (26, N'Bianca Alves', N'biancaalves', N'123456', N'bianca@gmail.com', 40, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (29, N'Joana Tavares', N'JoanaTav', N'string123', N'Joanatav@email.com', 24, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (33, N'Vera Joana Fogaça', N'VeraJoana1', N'DMrLprDNFt', N'vera_joana_fogaca@infolink.com.br', 61, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (34, N'Eduardo Caio Cláudio Porto', N'EduardoCaio1', N'DKH6brsLEK', N'eduardocaioporto@lht.com.br', 41, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (35, N'Thomas Roberto Gustavo Drumond', N'Thoams1', N'c8HtJHJJPH', N'thomas-drumond77@tilapiareal.com.br', 25, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (36, N'Jaqueline Vanessa Rodrigues', N'Jaque1', N'MnOBzjIPwL', N'jaqueline.vanessa.rodrigues@live.ca', 30, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (37, N'Oliver Caleb Osvaldo Viana', N'OliverC1', N'F7p9DKokJz', N'oliver_viana@grupoitaipu.com.br', 24, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (38, N'Nelson Nicolas Viana', N'NelsonN1', N'Yz8TFaOO51', N'nelsonnicolasviana@fepextrusao.com.br', 63, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (39, N'Vera Nicole Allana Mendes', N'VeraNicole', N'4xYk4tzX13', N'veranicolemendes@fernandaleal.com.br', 40, NULL)
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (40, N'Aline Aparecida Viana', N'AlineAp1', N'LpzhHEZ9O5', N'aline_viana@wsiconsultores.com.br', 36, N'1f4f9fc2-f412-43c2-81f7-a2efa14131ab.jpg')
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (41, N'Rebeca Stella Louise Silva', N'Rebeca1', N'T60fX2btcs', N'rebecastellasilva@hitmail.com', 30, N'Object reference not set to an instance of an object.')
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (44, N'Nelson Victor Osvaldo Silva', N'Nelson11', N'0RZI0t9dab', N'nelson_victor_silva@dcazzainteriores.com.br', 57, N'08685e70-28e3-4230-b4c2-bf28b9bb0729.jpg')
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (46, N'Luana Luzia Alana Monteiro', N'Luabna1', N'Lxc74XBMDt', N'luana_luzia_monteiro@band.com.br', 27, N'ad3ad008-5fad-4e15-a1b7-a72bd61548da.jpg')
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (50, N'Luana Luzia Alana Monteiro', N'Luabna1', N'Lxc74XBMDt', N'luana_luzia_monteiro@band.com.br', 27, N'ad05b5e7-644e-4cae-b2f6-37131fc95ad7.jpg')
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (51, N'Evelyn Laís Rafaela Pires', N'Evelyn1', N'0Z057kiSqz', N'evelyn_lais_pires@zepto.com.br', 25, N'b47b5a71-3ba9-4350-9be6-470d58046bd6.jpg')
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (52, N'Evelyn Laís Rafaela Pires', N'Evelyn1', N'0Z057kiSqz', N'evelyn_lais_pires@zepto.com.br', 25, N'706b68a8-0e84-4cce-9a77-db529cef81b4.jpg')
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (53, N'Evelyn Laís Rafaela Pires', N'Evelyn1', N'0Z057kiSqz', N'evelyn_lais_pires@zepto.com.br', 25, N'02c6af0e-598e-45bc-9ed4-62aff1ca136e.jpg')
INSERT [dbo].[Usuarios] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade], [Imagem]) VALUES (54, N'gab', N'gabmop', N'????8?????`??B ? ???_??3D??%', N'Gabriel_moop@hotmail.com', 27, N'Object reference not set to an instance of an object.')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD FOREIGN KEY([TipoEvento])
REFERENCES [dbo].[EventoLog] ([id])
GO
ALTER TABLE [dbo].[Postagem]  WITH NOCHECK ADD FOREIGN KEY([UsuarioGameId])
REFERENCES [dbo].[Usuarios] ([UsuarioGameId])
GO
ALTER TABLE [dbo].[Squares]  WITH NOCHECK ADD FOREIGN KEY([CategoriaJogoId])
REFERENCES [dbo].[CategoriaJogo] ([CategoriaJogoId])
GO
ALTER TABLE [dbo].[Squares]  WITH CHECK ADD FOREIGN KEY([membroID])
REFERENCES [dbo].[Usuarios] ([UsuarioGameId])
GO
ALTER TABLE [dbo].[Squares]  WITH NOCHECK ADD FOREIGN KEY([PostagemId])
REFERENCES [dbo].[Postagem] ([PostagemID])
GO
/****** Object:  StoredProcedure [dbo].[Fazer_Login]    Script Date: 09/05/2023 23:50:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Fazer_Login]
@email nvarchar,
@senha nvarchar

AS
BEGIN
select * from Usuarios where email = @email and Senha = @senha
END
GO
USE [master]
GO
ALTER DATABASE [BRGamersSquare] SET  READ_WRITE 
GO
