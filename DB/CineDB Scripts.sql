USE [CineDB]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 5/02/2025 01:54:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reserva]') AND type in (N'U'))
DROP TABLE [dbo].[Reserva]
GO
/****** Object:  View [dbo].[vwFuncionesPorPelicula]    Script Date: 5/02/2025 01:54:42 ******/
DROP VIEW [dbo].[vwFuncionesPorPelicula]
GO
/****** Object:  View [dbo].[vwFunciones]    Script Date: 5/02/2025 01:54:42 ******/
DROP VIEW [dbo].[vwFunciones]
GO
/****** Object:  View [dbo].[vwFuncion]    Script Date: 5/02/2025 01:54:42 ******/
DROP VIEW [dbo].[vwFuncion]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 5/02/2025 01:54:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Genero]') AND type in (N'U'))
DROP TABLE [dbo].[Genero]
GO
/****** Object:  View [dbo].[vwPeliculas]    Script Date: 5/02/2025 01:54:42 ******/
DROP VIEW [dbo].[vwPeliculas]
GO
/****** Object:  Table [dbo].[Pelicula]    Script Date: 5/02/2025 01:54:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pelicula]') AND type in (N'U'))
DROP TABLE [dbo].[Pelicula]
GO
/****** Object:  Table [dbo].[Funcion]    Script Date: 5/02/2025 01:54:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Funcion]') AND type in (N'U'))
DROP TABLE [dbo].[Funcion]
GO
/****** Object:  Table [dbo].[Sala]    Script Date: 5/02/2025 01:54:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sala]') AND type in (N'U'))
DROP TABLE [dbo].[Sala]
GO
/****** Object:  Table [dbo].[Sala]    Script Date: 5/02/2025 01:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sala](
	[SalaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Capacidad] [int] NULL,
 CONSTRAINT [PK_Sala] PRIMARY KEY CLUSTERED 
(
	[SalaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funcion]    Script Date: 5/02/2025 01:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcion](
	[FuncionId] [int] IDENTITY(1,1) NOT NULL,
	[PeliculaId] [int] NULL,
	[SalaId] [int] NULL,
	[HoraInicio] [time](7) NULL,
	[HoraFin] [time](7) NULL,
	[EntradasDisponibles] [int] NULL,
 CONSTRAINT [PK_Funcion] PRIMARY KEY CLUSTERED 
(
	[FuncionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pelicula]    Script Date: 5/02/2025 01:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pelicula](
	[PeliculaId] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](250) NULL,
	[GeneroId] [int] NULL,
	[Sinopsis] [varchar](max) NULL,
	[Duracion] [int] NULL,
	[ImagenUrl] [varchar](max) NULL,
 CONSTRAINT [PK_Pelicula] PRIMARY KEY CLUSTERED 
(
	[PeliculaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwPeliculas]    Script Date: 5/02/2025 01:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from funcion
create   view [dbo].[vwPeliculas]
as
select 
f.FuncionId,
p.Titulo,
p.Genero,
p.Sinopsis,
s.SalaId,
s.Nombre Sala,
f.HoraInicio,
f.HoraFin,
EntradasDisponibles
from Funcion F inner join 
Pelicula P on f.PeliculaId= p.PeliculaId inner join 
Sala S on f.SalaId = s.SalaId

-- select * from vwPeliculas
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 5/02/2025 01:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[GeneroId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](250) NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[GeneroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwFuncion]    Script Date: 5/02/2025 01:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from funcion
create   view [dbo].[vwFuncion]
as
select 
f.FuncionId,
p.PeliculaId,
p.Titulo,
g.generoid,
g.nombre Genero,
p.Sinopsis,
s.SalaId,
s.Nombre Sala,
p.Duracion,
f.HoraInicio,
f.HoraFin,
EntradasDisponibles,
p.ImagenUrl
from Funcion F inner join 
Pelicula P on f.PeliculaId= p.PeliculaId inner join 
Sala S on f.SalaId = s.SalaId inner join 
genero g on P.Generoid = g.generoid


-- select * from vwFuncion

GO
/****** Object:  View [dbo].[vwFunciones]    Script Date: 5/02/2025 01:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[vwFunciones]
as
SELECT f.[FuncionId]
      ,f.[PeliculaId]
      ,f.[SalaId]
	  ,s.Nombre Sala 
      ,f.[HoraInicio]
      ,f.[HoraFin]
      ,f.[EntradasDisponibles]
  FROM [Funcion] f inner join 
  Sala s on f.SalaId= s.SalaId

GO
/****** Object:  View [dbo].[vwFuncionesPorPelicula]    Script Date: 5/02/2025 01:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[vwFuncionesPorPelicula]
as
SELECT f.[FuncionId]
      ,f.[PeliculaId]
      ,f.[SalaId]
	  ,s.Nombre Sala 
      ,f.[HoraInicio]
      ,f.[HoraFin]
      ,f.[EntradasDisponibles]
  FROM [Funcion] f inner join 
  Sala s on f.SalaId= s.SalaId

GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 5/02/2025 01:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[ReservaId] [int] IDENTITY(1,1) NOT NULL,
	[FuncionId] [int] NULL,
	[Nombres] [varchar](250) NULL,
	[Apellidos] [varchar](250) NULL,
	[FechaNacimiento] [datetime] NULL,
	[Genero] [varchar](100) NULL,
	[TipoDocumento] [varchar](100) NULL,
	[NumeroDocumento] [varchar](50) NULL,
	[FechaReserva] [datetime] NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[ReservaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Funcion] ON 
GO
INSERT [dbo].[Funcion] ([FuncionId], [PeliculaId], [SalaId], [HoraInicio], [HoraFin], [EntradasDisponibles]) VALUES (1, 1, 1, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 100)
GO
INSERT [dbo].[Funcion] ([FuncionId], [PeliculaId], [SalaId], [HoraInicio], [HoraFin], [EntradasDisponibles]) VALUES (2, 1, 2, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), 100)
GO
INSERT [dbo].[Funcion] ([FuncionId], [PeliculaId], [SalaId], [HoraInicio], [HoraFin], [EntradasDisponibles]) VALUES (3, 1, 3, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 100)
GO
INSERT [dbo].[Funcion] ([FuncionId], [PeliculaId], [SalaId], [HoraInicio], [HoraFin], [EntradasDisponibles]) VALUES (4, 2, 1, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 100)
GO
INSERT [dbo].[Funcion] ([FuncionId], [PeliculaId], [SalaId], [HoraInicio], [HoraFin], [EntradasDisponibles]) VALUES (5, 2, 2, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), 100)
GO
INSERT [dbo].[Funcion] ([FuncionId], [PeliculaId], [SalaId], [HoraInicio], [HoraFin], [EntradasDisponibles]) VALUES (6, 2, 3, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 100)
GO
INSERT [dbo].[Funcion] ([FuncionId], [PeliculaId], [SalaId], [HoraInicio], [HoraFin], [EntradasDisponibles]) VALUES (7, 3, 1, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), 100)
GO
INSERT [dbo].[Funcion] ([FuncionId], [PeliculaId], [SalaId], [HoraInicio], [HoraFin], [EntradasDisponibles]) VALUES (8, 3, 2, CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), 100)
GO
INSERT [dbo].[Funcion] ([FuncionId], [PeliculaId], [SalaId], [HoraInicio], [HoraFin], [EntradasDisponibles]) VALUES (9, 3, 3, CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 100)
GO
SET IDENTITY_INSERT [dbo].[Funcion] OFF
GO
SET IDENTITY_INSERT [dbo].[Genero] ON 
GO
INSERT [dbo].[Genero] ([GeneroId], [Nombre]) VALUES (1, N'Acción')
GO
INSERT [dbo].[Genero] ([GeneroId], [Nombre]) VALUES (2, N'Familiar')
GO
INSERT [dbo].[Genero] ([GeneroId], [Nombre]) VALUES (3, N'Thriller')
GO
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO
SET IDENTITY_INSERT [dbo].[Pelicula] ON 
GO
INSERT [dbo].[Pelicula] ([PeliculaId], [Titulo], [GeneroId], [Sinopsis], [Duracion], [ImagenUrl]) VALUES (1, N'Amenaza en el Aire', 1, N'En este emocionante thriller de alto riesgo y acción, Mark Wahlberg, da vida a un piloto encargado de transportar a una teniente y a un fugitivo hacia su juicio. A lo largo de su viaje por la imponente naturaleza de Alaska, se crea un ambiente de tensión y la confianza entre los personajes es puesta a prueba, revelando que las apariencias engañan y que no todos los presentes son lo que parecen.', 90, N'https://cdn.apis.cineplanet.com.pe/CDN/media/entity/get/FilmPosterGraphic/HO00002111?referenceScheme=HeadOffice&allowPlaceHolder=true')
GO
INSERT [dbo].[Pelicula] ([PeliculaId], [Titulo], [GeneroId], [Sinopsis], [Duracion], [ImagenUrl]) VALUES (2, N'Bambi: Una Aventura en el Bosque', 2, N'La historia cuenta las aventuras de un joven cervatillo, rodeado de su madre y de los animales del bosque: su amigo el cuervo, el conejo, el mapache... Descubre el mundo de los árboles y sus secretos. Cada día, su madre lo educa para que pueda crecer fuerte. Pero cuando llega el otoño, Bambi se aventura a la intemperie cuando los cazadores lo separan para siempre de su madre.', 80, N'https://cdn.apis.cineplanet.com.pe/CDN/media/entity/get/FilmPosterGraphic/HO00002220?referenceScheme=HeadOffice&allowPlaceHolder=true')
GO
INSERT [dbo].[Pelicula] ([PeliculaId], [Titulo], [GeneroId], [Sinopsis], [Duracion], [ImagenUrl]) VALUES (3, N'Compañera Perfecta', 3, N'Estás cordialmente invitado a experimentar una nueva especie de historia de amor.', 100, N'https://cdn.apis.cineplanet.com.pe/CDN/media/entity/get/FilmPosterGraphic/HO00002289?referenceScheme=HeadOffice&allowPlaceHolder=true')
GO
SET IDENTITY_INSERT [dbo].[Pelicula] OFF
GO
SET IDENTITY_INSERT [dbo].[Sala] ON 
GO
INSERT [dbo].[Sala] ([SalaId], [Nombre], [Capacidad]) VALUES (1, N'Sala 1', 100)
GO
INSERT [dbo].[Sala] ([SalaId], [Nombre], [Capacidad]) VALUES (2, N'Sala 2', 100)
GO
INSERT [dbo].[Sala] ([SalaId], [Nombre], [Capacidad]) VALUES (3, N'Sala 3', 100)
GO
SET IDENTITY_INSERT [dbo].[Sala] OFF
GO
