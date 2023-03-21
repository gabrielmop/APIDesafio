USE [master]
GO
/****** Object:  Database [BRGamersSquare]    Script Date: 18/11/2022 00:33:20 ******/
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
/****** Object:  Table [dbo].[CategoriaJogo]    Script Date: 18/11/2022 00:33:21 ******/
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
/****** Object:  Table [dbo].[Postagem]    Script Date: 18/11/2022 00:33:21 ******/
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
/****** Object:  Table [dbo].[Squares]    Script Date: 18/11/2022 00:33:21 ******/
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
/****** Object:  Table [dbo].[UsuariosGame]    Script Date: 18/11/2022 00:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosGame](
	[UsuarioGameId] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](100) NULL,
	[UserName] [nvarchar](50) NULL,
	[Senha] [nvarchar](30) NULL,
	[email] [nvarchar](50) NULL,
	[idade] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioGameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (23, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 23)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (24, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 24)
INSERT [dbo].[Postagem] ([PostagemID], [TextoPostagem], [Imagem], [DataHora], [UsuarioGameId]) VALUES (25, N'Ola, Mundo!', N'https://blog.brq.com/wp-content/uploads/2022/07/logo_BRQ_2022.png', CAST(N'2022-11-17T08:39:00.000' AS DateTime), 25)
SET IDENTITY_INSERT [dbo].[Postagem] OFF
GO
SET IDENTITY_INSERT [dbo].[Squares] ON 

INSERT [dbo].[Squares] ([GruposId], [NomeGrupo], [QtdeParticipantes], [QtdePostagens], [CategoriaJogoId], [PostagemId], [membroID]) VALUES (6, N'God of Peace', 1, 2, 1, NULL, NULL)
INSERT [dbo].[Squares] ([GruposId], [NomeGrupo], [QtdeParticipantes], [QtdePostagens], [CategoriaJogoId], [PostagemId], [membroID]) VALUES (7, N'The Life Sim', 1, 3, 2, NULL, NULL)
INSERT [dbo].[Squares] ([GruposId], [NomeGrupo], [QtdeParticipantes], [QtdePostagens], [CategoriaJogoId], [PostagemId], [membroID]) VALUES (8, N'Top Run', 1, 4, 3, NULL, NULL)
INSERT [dbo].[Squares] ([GruposId], [NomeGrupo], [QtdeParticipantes], [QtdePostagens], [CategoriaJogoId], [PostagemId], [membroID]) VALUES (9, N'Dungeons and dragons and fairies', 1, 1, 4, NULL, NULL)
INSERT [dbo].[Squares] ([GruposId], [NomeGrupo], [QtdeParticipantes], [QtdePostagens], [CategoriaJogoId], [PostagemId], [membroID]) VALUES (10, N'The Cow', 1, 2, 5, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Squares] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuariosGame] ON 

INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (1, N'Gabriel Franco', N'Gabrielmop', N'Moop1502', N'gabriel_moop@hotmail.com', 26)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (2, N'Monalysa  de Padua', N'monalysapadua', N'123456', N'monalysa@gmail.com', 38)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (3, N'Esequiel de Padua', N'esequielpadua', N'123456', N'esequiel@gmail.com', 18)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (4, N'Esther de Padua', N'estherpadua', N'123456', N'esther@gmail.com', 40)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (5, N'Rebeca de Padua', N'rebecapadua', N'123456', N'rebeca@gmail.com', 12)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (6, N'Herminia Marques', N'herminiamarques', N'123456', N'herminia@gmail.com', 27)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (7, N'Moacir Junior', N'moacirjunior', N'123456', N'moacir@gmail.com', 30)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (8, N'Cicero Alan', N'ciceroalan', N'123456', N'cicero@gmail.com', 25)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (9, N'Vera Lucia', N'veralucia', N'123456', N'vera@gmail.com', 19)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (10, N'Maria Luiza', N'marialuiza', N'123456', N'maria@gmail.com', 31)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (11, N'Mara Roberta', N'mararoberta', N'123456', N'mara@gmail.com', 12)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (12, N'Pedro Gabriel', N'pedrogabriel', N'123456', N'pedro@gmail.com', 24)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (13, N'Thyalla Maria', N'thyallamaria', N'123456', N'thyalla@gmail.com', 30)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (14, N'Rosana Abdo', N'rosanaabdo', N'123456', N'rosana@gmail.com', 28)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (15, N'Ricardo Abdo', N'ricardoabdo', N'123456', N'ricardo@gmail.com', 14)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (16, N'Joana Abdo', N'joanaabdo', N'123456', N'joana@gmail.com', 19)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (17, N'Pedro Abdo', N'pedroabdo', N'123456', N'pedro@gmail.com', 20)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (18, N'Renata Alves', N'renataalves', N'123456', N'renata@gmail.com', 18)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (19, N'Samuel Abdo', N'samuelabdo', N'123456', N'samuel@gmail.com', 29)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (20, N'Alice Abdo', N'aliceabdo', N'123456', N'alice@gmail.com', 30)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (21, N'Veronica de Padua', N'veronicapadua', N'123456', N'veronica@gmail.com', 14)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (22, N'Isabele Jesus', N'isabelejesus', N'123456', N'isabele@gmail.com', 27)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (23, N'Enzo Miguel', N'enzomiguel', N'123456', N'enzo@gmail.com', 30)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (24, N'Debora Alves', N'Deboraalves', N'123456', N'Debora@gmail.com', 42)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (25, N'Julia Vitoria', N'juliaVitoria', N'123456', N'julia@gmail.com', 17)
INSERT [dbo].[UsuariosGame] ([UsuarioGameId], [Nome], [UserName], [Senha], [email], [idade]) VALUES (26, N'Bianca Alves', N'biancaalves', N'123456', N'bianca@gmail.com', 40)
SET IDENTITY_INSERT [dbo].[UsuariosGame] OFF
GO
ALTER TABLE [dbo].[Postagem]  WITH NOCHECK ADD FOREIGN KEY([UsuarioGameId])
REFERENCES [dbo].[UsuariosGame] ([UsuarioGameId])
GO
ALTER TABLE [dbo].[Squares]  WITH NOCHECK ADD FOREIGN KEY([CategoriaJogoId])
REFERENCES [dbo].[CategoriaJogo] ([CategoriaJogoId])
GO
ALTER TABLE [dbo].[Squares]  WITH CHECK ADD FOREIGN KEY([membroID])
REFERENCES [dbo].[UsuariosGame] ([UsuarioGameId])
GO
ALTER TABLE [dbo].[Squares]  WITH NOCHECK ADD FOREIGN KEY([PostagemId])
REFERENCES [dbo].[Postagem] ([PostagemID])
GO
USE [master]
GO
ALTER DATABASE [BRGamersSquare] SET  READ_WRITE 
GO
