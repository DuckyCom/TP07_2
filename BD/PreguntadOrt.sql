USE [master]
GO
/****** Object:  Database [Preguntados]    Script Date: 28/8/2023 20:51:21 ******/
CREATE DATABASE [Preguntados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Preguntados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Preguntados.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Preguntados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Preguntados_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Preguntados] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Preguntados].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Preguntados] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Preguntados] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Preguntados] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Preguntados] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Preguntados] SET ARITHABORT OFF 
GO
ALTER DATABASE [Preguntados] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Preguntados] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Preguntados] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Preguntados] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Preguntados] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Preguntados] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Preguntados] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Preguntados] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Preguntados] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Preguntados] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Preguntados] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Preguntados] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Preguntados] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Preguntados] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Preguntados] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Preguntados] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Preguntados] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Preguntados] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Preguntados] SET  MULTI_USER 
GO
ALTER DATABASE [Preguntados] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Preguntados] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Preguntados] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Preguntados] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Preguntados] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Preguntados] SET QUERY_STORE = OFF
GO
USE [Preguntados]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 28/8/2023 20:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Foto] [nvarchar](500) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 28/8/2023 20:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[IdDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dificultad] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 28/8/2023 20:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NULL,
	[IdDificultad] [int] NULL,
	[Enunciado] [nvarchar](50) NULL,
	[Foto] [nvarchar](500) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 28/8/2023 20:51:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NULL,
	[Opcion] [int] NULL,
	[Contenido] [nvarchar](50) NULL,
	[Correcta] [bit] NULL,
	[Foto] [nvarchar](500) NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (1, N'4ID', N'n')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'Videojuegos', N'n')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'Cine', N'n')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (4, N'Programacion', N'n')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (1, N'Facil')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (2, N'Medio')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (3, N'Dificil')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'Quien es la montaña?', N'n')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (2, 1, 1, N'Quien es el inge?', N'n')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (3, 1, 1, N'Quien no anda en el aula?', N'n')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (4, 1, 3, N'Cual es el segundo nombre de noah?', N'n')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (5, 2, 1, N'¿Cuantos ports oficiales tuvo Resident Evil 4?', N'n')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (7, 2, 1, N'Cuantos jugadores hay en una partida de fortnite?', N'n')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (14, 2, 1, N'Cual es el nombre del primer dios enemigo de GOWR?', N'n')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (16, 2, 2, N'En que año se lanzo el primer zelda?', N'n')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (19, 2, 2, N'El protagonista de legends of zelda es?', N'n')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (20, 2, 2, N'En que año se lanzo el primer GTA?', N'n')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (21, 2, 3, N'Cual es el personaje protagonista de Metroid?', N'n')
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (1, 1, 1, N'Pablo', 1, N'n')
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (2, 1, 2, N'Simon', 0, N'n')
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (3, 1, 3, N'Ivo', 0, N'n')
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (4, 2, 1, N'Benja', 1, N'n')
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (5, 3, 1, N'Nada', 1, N'n')
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (6, 4, 1, N'Demian', 1, N'n')
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([IdDificultad])
REFERENCES [dbo].[Dificultades] ([IdDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
USE [master]
GO
ALTER DATABASE [Preguntados] SET  READ_WRITE 
GO
