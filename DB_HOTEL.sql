USE [master]
GO
/****** Object:  Database [DB_HOTEL]    Script Date: 18/04/2022 09:48:48 JC ******/
CREATE DATABASE [DB_HOTEL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_HOTEL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_HOTEL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_HOTEL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_HOTEL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_HOTEL] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_HOTEL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_HOTEL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_HOTEL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_HOTEL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_HOTEL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_HOTEL] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_HOTEL] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB_HOTEL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_HOTEL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_HOTEL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_HOTEL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_HOTEL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_HOTEL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_HOTEL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_HOTEL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_HOTEL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_HOTEL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_HOTEL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_HOTEL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_HOTEL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_HOTEL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_HOTEL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_HOTEL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_HOTEL] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_HOTEL] SET  MULTI_USER 
GO
ALTER DATABASE [DB_HOTEL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_HOTEL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_HOTEL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_HOTEL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_HOTEL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_HOTEL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB_HOTEL] SET QUERY_STORE = OFF
GO
USE [DB_HOTEL]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Estado] [bit] NULL,
	[FechaCreacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_VENTA]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_VENTA](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdVenta] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[SubTotal] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESTADO_HABITACION]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADO_HABITACION](
	[IdEstadoHabitacion] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Estado] [bit] NULL,
	[FechaCreacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstadoHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HABITACION]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HABITACION](
	[IdHabitacion] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [varchar](50) NULL,
	[Detalle] [varchar](100) NULL,
	[Precio] [decimal](10, 2) NULL,
	[IdEstadoHabitacion] [int] NULL,
	[IdPiso] [int] NULL,
	[IdCategoria] [int] NULL,
	[Estado] [bit] NULL,
	[FechaCreacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONA]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONA](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [varchar](15) NULL,
	[Documento] [varchar](15) NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Clave] [varchar](50) NULL,
	[IdTipoPersona] [int] NULL,
	[Estado] [bit] NULL,
	[FechaCreacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PISO]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PISO](
	[IdPiso] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Estado] [bit] NULL,
	[FechaCreacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Detalle] [varchar](100) NULL,
	[Precio] [decimal](10, 2) NULL,
	[Cantidad] [int] NULL,
	[Estado] [bit] NULL,
	[FechaCreacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RECEPCION]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RECEPCION](
	[IdRecepcion] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[IdHabitacion] [int] NULL,
	[FechaEntrada] [datetime] NULL,
	[FechaSalida] [datetime] NULL,
	[FechaSalidaConfirmacion] [datetime] NULL,
	[PrecioInicial] [decimal](10, 2) NULL,
	[Adelanto] [decimal](10, 2) NULL,
	[PrecioRestante] [decimal](10, 2) NULL,
	[TotalPagado] [decimal](10, 2) NULL,
	[CostoPenalidad] [decimal](10, 2) NULL,
	[Observacion] [varchar](500) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRecepcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO_PERSONA]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_PERSONA](
	[IdTipoPersona] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Estado] [bit] NULL,
	[FechaCreacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdRecepcion] [int] NULL,
	[Total] [decimal](10, 2) NULL,
	[Estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CATEGORIA] ON 

INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Estado], [FechaCreacion]) VALUES (1, N'Matrimonial', 1, CAST(N'2022-02-24T22:45:43.167' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Estado], [FechaCreacion]) VALUES (2, N'Doble', 1, CAST(N'2022-02-24T22:45:43.167' AS DateTime))
INSERT [dbo].[CATEGORIA] ([IdCategoria], [Descripcion], [Estado], [FechaCreacion]) VALUES (3, N'Individual', 1, CAST(N'2022-02-24T22:45:43.167' AS DateTime))
SET IDENTITY_INSERT [dbo].[CATEGORIA] OFF
GO
SET IDENTITY_INSERT [dbo].[DETALLE_VENTA] ON 

INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [SubTotal]) VALUES (1, 1, 9, 1, CAST(2.70 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [SubTotal]) VALUES (2, 2, 12, 1, CAST(3.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [SubTotal]) VALUES (3, 3, 4, 1, CAST(2.60 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [SubTotal]) VALUES (4, 4, 8, 2, CAST(9.00 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [SubTotal]) VALUES (5, 5, 3, 1, CAST(0.80 AS Decimal(10, 2)))
INSERT [dbo].[DETALLE_VENTA] ([IdDetalleVenta], [IdVenta], [IdProducto], [Cantidad], [SubTotal]) VALUES (6, 5, 5, 1, CAST(2.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DETALLE_VENTA] OFF
GO
INSERT [dbo].[ESTADO_HABITACION] ([IdEstadoHabitacion], [Descripcion], [Estado], [FechaCreacion]) VALUES (1, N'DISPONIBLE', 1, CAST(N'2022-02-24T22:45:43.107' AS DateTime))
INSERT [dbo].[ESTADO_HABITACION] ([IdEstadoHabitacion], [Descripcion], [Estado], [FechaCreacion]) VALUES (2, N'OCUPADO', 1, CAST(N'2022-02-24T22:45:43.107' AS DateTime))
INSERT [dbo].[ESTADO_HABITACION] ([IdEstadoHabitacion], [Descripcion], [Estado], [FechaCreacion]) VALUES (3, N'LIMPIEZA', 1, CAST(N'2022-02-24T22:45:43.107' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[HABITACION] ON 

INSERT [dbo].[HABITACION] ([IdHabitacion], [Numero], [Detalle], [Precio], [IdEstadoHabitacion], [IdPiso], [IdCategoria], [Estado], [FechaCreacion]) VALUES (1, N'001', N'WIFI + BAÑO + TV + CABLE', CAST(60.00 AS Decimal(10, 2)), 1, 1, 3, 1, CAST(N'2022-02-24T22:45:43.187' AS DateTime))
INSERT [dbo].[HABITACION] ([IdHabitacion], [Numero], [Detalle], [Precio], [IdEstadoHabitacion], [IdPiso], [IdCategoria], [Estado], [FechaCreacion]) VALUES (2, N'002', N'WIFI + BAÑO + TV + CABLE', CAST(80.00 AS Decimal(10, 2)), 2, 1, 2, 1, CAST(N'2022-02-24T22:45:43.187' AS DateTime))
INSERT [dbo].[HABITACION] ([IdHabitacion], [Numero], [Detalle], [Precio], [IdEstadoHabitacion], [IdPiso], [IdCategoria], [Estado], [FechaCreacion]) VALUES (3, N'003', N'BAÑO + TV + CABLE', CAST(60.00 AS Decimal(10, 2)), 1, 1, 3, 1, CAST(N'2022-02-24T22:45:43.187' AS DateTime))
INSERT [dbo].[HABITACION] ([IdHabitacion], [Numero], [Detalle], [Precio], [IdEstadoHabitacion], [IdPiso], [IdCategoria], [Estado], [FechaCreacion]) VALUES (4, N'004', N'WIFI + BAÑO + TV + CABLE', CAST(80.00 AS Decimal(10, 2)), 1, 1, 2, 1, CAST(N'2022-02-24T22:45:43.187' AS DateTime))
INSERT [dbo].[HABITACION] ([IdHabitacion], [Numero], [Detalle], [Precio], [IdEstadoHabitacion], [IdPiso], [IdCategoria], [Estado], [FechaCreacion]) VALUES (5, N'005', N'WIFI + BAÑO', CAST(50.00 AS Decimal(10, 2)), 1, 1, 3, 1, CAST(N'2022-02-24T22:45:43.187' AS DateTime))
INSERT [dbo].[HABITACION] ([IdHabitacion], [Numero], [Detalle], [Precio], [IdEstadoHabitacion], [IdPiso], [IdCategoria], [Estado], [FechaCreacion]) VALUES (6, N'006', N'WIFI + BAÑO + TV 4K + CABLE', CAST(80.00 AS Decimal(10, 2)), 1, 2, 3, 1, CAST(N'2022-02-24T22:45:43.187' AS DateTime))
INSERT [dbo].[HABITACION] ([IdHabitacion], [Numero], [Detalle], [Precio], [IdEstadoHabitacion], [IdPiso], [IdCategoria], [Estado], [FechaCreacion]) VALUES (7, N'007', N'WIFI + BAÑO + TV 4K + CABLE', CAST(90.00 AS Decimal(10, 2)), 1, 2, 2, 1, CAST(N'2022-02-24T22:45:43.187' AS DateTime))
INSERT [dbo].[HABITACION] ([IdHabitacion], [Numero], [Detalle], [Precio], [IdEstadoHabitacion], [IdPiso], [IdCategoria], [Estado], [FechaCreacion]) VALUES (8, N'008', N'WIFI + BAÑO + TV + CABLE', CAST(70.00 AS Decimal(10, 2)), 1, 2, 3, 1, CAST(N'2022-02-24T22:45:43.187' AS DateTime))
INSERT [dbo].[HABITACION] ([IdHabitacion], [Numero], [Detalle], [Precio], [IdEstadoHabitacion], [IdPiso], [IdCategoria], [Estado], [FechaCreacion]) VALUES (9, N'009', N'WIFI + BAÑO + TV + CABLE', CAST(80.00 AS Decimal(10, 2)), 1, 2, 2, 1, CAST(N'2022-02-24T22:45:43.187' AS DateTime))
INSERT [dbo].[HABITACION] ([IdHabitacion], [Numero], [Detalle], [Precio], [IdEstadoHabitacion], [IdPiso], [IdCategoria], [Estado], [FechaCreacion]) VALUES (10, N'010', N'WIFI + BAÑO + TV + CABLE', CAST(70.00 AS Decimal(10, 2)), 1, 2, 3, 1, CAST(N'2022-02-24T22:45:43.187' AS DateTime))
INSERT [dbo].[HABITACION] ([IdHabitacion], [Numero], [Detalle], [Precio], [IdEstadoHabitacion], [IdPiso], [IdCategoria], [Estado], [FechaCreacion]) VALUES (11, N'011', N'WIFI + BAÑO + TV 4K + CABLE', CAST(120.00 AS Decimal(10, 2)), 1, 3, 1, 1, CAST(N'2022-02-24T22:45:43.187' AS DateTime))
INSERT [dbo].[HABITACION] ([IdHabitacion], [Numero], [Detalle], [Precio], [IdEstadoHabitacion], [IdPiso], [IdCategoria], [Estado], [FechaCreacion]) VALUES (12, N'012', N'WIFI + BAÑO + TV 4K + CABLE', CAST(120.00 AS Decimal(10, 2)), 1, 3, 1, 1, CAST(N'2022-02-24T22:45:43.187' AS DateTime))
INSERT [dbo].[HABITACION] ([IdHabitacion], [Numero], [Detalle], [Precio], [IdEstadoHabitacion], [IdPiso], [IdCategoria], [Estado], [FechaCreacion]) VALUES (13, N'013', N'WIFI + BAÑO + TV 4K + CABLE', CAST(120.00 AS Decimal(10, 2)), 1, 3, 1, 1, CAST(N'2022-02-24T22:45:43.187' AS DateTime))
INSERT [dbo].[HABITACION] ([IdHabitacion], [Numero], [Detalle], [Precio], [IdEstadoHabitacion], [IdPiso], [IdCategoria], [Estado], [FechaCreacion]) VALUES (14, N'014', N'WIFI + BAÑO + TV + CABLE', CAST(85.00 AS Decimal(10, 2)), 1, 3, 2, 1, CAST(N'2022-02-24T22:45:43.187' AS DateTime))
INSERT [dbo].[HABITACION] ([IdHabitacion], [Numero], [Detalle], [Precio], [IdEstadoHabitacion], [IdPiso], [IdCategoria], [Estado], [FechaCreacion]) VALUES (15, N'015', N'WIFI + BAÑO + TV + CABLE', CAST(75.00 AS Decimal(10, 2)), 1, 3, 3, 1, CAST(N'2022-02-24T22:45:43.187' AS DateTime))
SET IDENTITY_INSERT [dbo].[HABITACION] OFF
GO
SET IDENTITY_INSERT [dbo].[PERSONA] ON 

INSERT [dbo].[PERSONA] ([IdPersona], [TipoDocumento], [Documento], [Nombre], [Apellido], [Correo], [Clave], [IdTipoPersona], [Estado], [FechaCreacion]) VALUES (1, NULL, N'12345678', N'Admin', N'', N'admin@gmail.com', N'admin123', 1, 1, CAST(N'2022-02-24T22:45:43.147' AS DateTime))
INSERT [dbo].[PERSONA] ([IdPersona], [TipoDocumento], [Documento], [Nombre], [Apellido], [Correo], [Clave], [IdTipoPersona], [Estado], [FechaCreacion]) VALUES (2, NULL, N'4353434', N'Mizuki', N'Hayashi', N'Mizuki@gmail.com', N'456', 2, 1, CAST(N'2022-02-24T22:45:43.147' AS DateTime))
INSERT [dbo].[PERSONA] ([IdPersona], [TipoDocumento], [Documento], [Nombre], [Apellido], [Correo], [Clave], [IdTipoPersona], [Estado], [FechaCreacion]) VALUES (3, N'DNI', N'34345656', N'Bartolome', N'Abe', N'Abe@gmail.com', NULL, 3, 1, CAST(N'2022-02-24T22:45:43.160' AS DateTime))
INSERT [dbo].[PERSONA] ([IdPersona], [TipoDocumento], [Documento], [Nombre], [Apellido], [Correo], [Clave], [IdTipoPersona], [Estado], [FechaCreacion]) VALUES (4, N'DNI', N'56567878', N'Hanan', N'Beppu', N'Beppu@gmail.com', NULL, 3, 1, CAST(N'2022-02-24T22:45:43.160' AS DateTime))
INSERT [dbo].[PERSONA] ([IdPersona], [TipoDocumento], [Documento], [Nombre], [Apellido], [Correo], [Clave], [IdTipoPersona], [Estado], [FechaCreacion]) VALUES (5, N'DNI', N'34237878', N'Haru', N'Endo', N'Endo@gmail.com', NULL, 3, 1, CAST(N'2022-02-24T22:45:43.160' AS DateTime))
INSERT [dbo].[PERSONA] ([IdPersona], [TipoDocumento], [Documento], [Nombre], [Apellido], [Correo], [Clave], [IdTipoPersona], [Estado], [FechaCreacion]) VALUES (6, N'PASAPORTE', N'78909078', N'Juan Luis', N'Vico', N'Vico@gmail.com', NULL, 3, 1, CAST(N'2022-02-24T22:45:43.160' AS DateTime))
INSERT [dbo].[PERSONA] ([IdPersona], [TipoDocumento], [Documento], [Nombre], [Apellido], [Correo], [Clave], [IdTipoPersona], [Estado], [FechaCreacion]) VALUES (7, N'DNI', N'45456767', N'Victoriano', N'Araujo', N'Araujo@gmail.com', NULL, 3, 1, CAST(N'2022-02-24T22:45:43.160' AS DateTime))
INSERT [dbo].[PERSONA] ([IdPersona], [TipoDocumento], [Documento], [Nombre], [Apellido], [Correo], [Clave], [IdTipoPersona], [Estado], [FechaCreacion]) VALUES (8, N'DNI', N'45343434', N'Kameyo', N'Hashimoto', N'Hashimoto@gmail.com', NULL, 3, 1, CAST(N'2022-02-24T22:45:43.160' AS DateTime))
INSERT [dbo].[PERSONA] ([IdPersona], [TipoDocumento], [Documento], [Nombre], [Apellido], [Correo], [Clave], [IdTipoPersona], [Estado], [FechaCreacion]) VALUES (9, N'PASAPORTE', N'34232334', N'Nerea', N'Chavez', N'Chavez@gmail.com', NULL, 3, 1, CAST(N'2022-02-24T22:45:43.160' AS DateTime))
INSERT [dbo].[PERSONA] ([IdPersona], [TipoDocumento], [Documento], [Nombre], [Apellido], [Correo], [Clave], [IdTipoPersona], [Estado], [FechaCreacion]) VALUES (10, N'DNI', N'78676756', N'Maria Sonia', N'Lillo', N'Lillo@gmail.com', NULL, 3, 1, CAST(N'2022-02-24T22:45:43.160' AS DateTime))
INSERT [dbo].[PERSONA] ([IdPersona], [TipoDocumento], [Documento], [Nombre], [Apellido], [Correo], [Clave], [IdTipoPersona], [Estado], [FechaCreacion]) VALUES (11, N'DNI', N'78787979', N'Nagore', N'Quiros', N'Quiros@gmail.com', NULL, 3, 1, CAST(N'2022-02-24T22:45:43.160' AS DateTime))
INSERT [dbo].[PERSONA] ([IdPersona], [TipoDocumento], [Documento], [Nombre], [Apellido], [Correo], [Clave], [IdTipoPersona], [Estado], [FechaCreacion]) VALUES (12, N'DNI', N'70707878', N'Maria Belen', N'Antunez', N'Antunez@gmail.com', NULL, 3, 1, CAST(N'2022-02-24T22:45:43.160' AS DateTime))
INSERT [dbo].[PERSONA] ([IdPersona], [TipoDocumento], [Documento], [Nombre], [Apellido], [Correo], [Clave], [IdTipoPersona], [Estado], [FechaCreacion]) VALUES (13, N'DNI', N'70205923', N'Juan', N'Ignacio Velásquez', N'juan@hotmail.com', NULL, 3, 1, CAST(N'2022-02-25T00:59:46.997' AS DateTime))
INSERT [dbo].[PERSONA] ([IdPersona], [TipoDocumento], [Documento], [Nombre], [Apellido], [Correo], [Clave], [IdTipoPersona], [Estado], [FechaCreacion]) VALUES (14, N'', N'45678912', N'Jhan', N'Velásquez', N'carlos@gmail.com', N'123456', 2, 1, CAST(N'2022-02-25T01:40:26.467' AS DateTime))
INSERT [dbo].[PERSONA] ([IdPersona], [TipoDocumento], [Documento], [Nombre], [Apellido], [Correo], [Clave], [IdTipoPersona], [Estado], [FechaCreacion]) VALUES (15, N'DNI', N'12345678', N'PRUEBA', N'PRUEBAS', N'PRUEBA@GMAIL.COM', NULL, 3, 1, CAST(N'2022-02-25T01:58:07.793' AS DateTime))
INSERT [dbo].[PERSONA] ([IdPersona], [TipoDocumento], [Documento], [Nombre], [Apellido], [Correo], [Clave], [IdTipoPersona], [Estado], [FechaCreacion]) VALUES (16, N'DNI', N'78945612', N'Demo', N'Demos', N'demo@hotmail.com', NULL, 3, 1, CAST(N'2022-03-01T21:43:22.163' AS DateTime))
SET IDENTITY_INSERT [dbo].[PERSONA] OFF
GO
SET IDENTITY_INSERT [dbo].[PISO] ON 

INSERT [dbo].[PISO] ([IdPiso], [Descripcion], [Estado], [FechaCreacion]) VALUES (1, N'PRIMERO', 1, CAST(N'2022-02-24T22:45:43.170' AS DateTime))
INSERT [dbo].[PISO] ([IdPiso], [Descripcion], [Estado], [FechaCreacion]) VALUES (2, N'SEGUNDO', 1, CAST(N'2022-02-24T22:45:43.170' AS DateTime))
INSERT [dbo].[PISO] ([IdPiso], [Descripcion], [Estado], [FechaCreacion]) VALUES (3, N'TERCERO', 1, CAST(N'2022-02-24T22:45:43.170' AS DateTime))
SET IDENTITY_INSERT [dbo].[PISO] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] ON 

INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Detalle], [Precio], [Cantidad], [Estado], [FechaCreacion]) VALUES (1, N'GALLETAS DORAS', N'NINGUNA', CAST(0.70 AS Decimal(10, 2)), 50, 1, CAST(N'2022-02-24T22:45:43.163' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Detalle], [Precio], [Cantidad], [Estado], [FechaCreacion]) VALUES (2, N'REFRESCO POCMAS', N'350 ML', CAST(1.50 AS Decimal(10, 2)), 80, 1, CAST(N'2022-02-24T22:45:43.163' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Detalle], [Precio], [Cantidad], [Estado], [FechaCreacion]) VALUES (3, N'CHOCOLATE DMX', N'50 GRM', CAST(0.80 AS Decimal(10, 2)), 59, 1, CAST(N'2022-02-24T22:45:43.163' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Detalle], [Precio], [Cantidad], [Estado], [FechaCreacion]) VALUES (4, N'PAPAS DORADAS', N'150 GRM', CAST(2.60 AS Decimal(10, 2)), 19, 1, CAST(N'2022-02-24T22:45:43.163' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Detalle], [Precio], [Cantidad], [Estado], [FechaCreacion]) VALUES (5, N'REFRESCO OXA', N'300 ML', CAST(2.00 AS Decimal(10, 2)), 29, 1, CAST(N'2022-02-24T22:45:43.163' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Detalle], [Precio], [Cantidad], [Estado], [FechaCreacion]) VALUES (6, N'CIGARRILLOS DEM', N'10 UNID', CAST(3.50 AS Decimal(10, 2)), 55, 1, CAST(N'2022-02-24T22:45:43.163' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Detalle], [Precio], [Cantidad], [Estado], [FechaCreacion]) VALUES (7, N'AGUA LIFE', N'250 ML', CAST(3.00 AS Decimal(10, 2)), 45, 1, CAST(N'2022-02-24T22:45:43.163' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Detalle], [Precio], [Cantidad], [Estado], [FechaCreacion]) VALUES (8, N'GASEOSA ALMOADA', N'350 ML', CAST(4.50 AS Decimal(10, 2)), 28, 1, CAST(N'2022-02-24T22:45:43.163' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Detalle], [Precio], [Cantidad], [Estado], [FechaCreacion]) VALUES (9, N'CEREALES PANDA', N'NIN', CAST(2.70 AS Decimal(10, 2)), 39, 1, CAST(N'2022-02-24T22:45:43.163' AS DateTime))
INSERT [dbo].[PRODUCTO] ([IdProducto], [Nombre], [Detalle], [Precio], [Cantidad], [Estado], [FechaCreacion]) VALUES (12, N'GALLETAS OREO', N'NINGUNA', CAST(3.00 AS Decimal(10, 2)), 11, 1, CAST(N'2022-02-25T01:41:55.423' AS DateTime))
SET IDENTITY_INSERT [dbo].[PRODUCTO] OFF
GO
SET IDENTITY_INSERT [dbo].[RECEPCION] ON 

INSERT [dbo].[RECEPCION] ([IdRecepcion], [IdCliente], [IdHabitacion], [FechaEntrada], [FechaSalida], [FechaSalidaConfirmacion], [PrecioInicial], [Adelanto], [PrecioRestante], [TotalPagado], [CostoPenalidad], [Observacion], [Estado]) VALUES (1, 13, 2, CAST(N'2022-02-25T00:59:46.997' AS DateTime), CAST(N'2022-02-26T00:00:00.000' AS DateTime), NULL, CAST(160.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(160.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'Ingreso a las 12:59', 1)
INSERT [dbo].[RECEPCION] ([IdRecepcion], [IdCliente], [IdHabitacion], [FechaEntrada], [FechaSalida], [FechaSalidaConfirmacion], [PrecioInicial], [Adelanto], [PrecioRestante], [TotalPagado], [CostoPenalidad], [Observacion], [Estado]) VALUES (2, 15, 9, CAST(N'2022-02-25T01:58:07.793' AS DateTime), CAST(N'2022-02-26T00:00:00.000' AS DateTime), CAST(N'2022-02-25T02:03:58.197' AS DateTime), CAST(160.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(160.00 AS Decimal(10, 2)), CAST(162.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'INGRESO 01:57', 0)
INSERT [dbo].[RECEPCION] ([IdRecepcion], [IdCliente], [IdHabitacion], [FechaEntrada], [FechaSalida], [FechaSalidaConfirmacion], [PrecioInicial], [Adelanto], [PrecioRestante], [TotalPagado], [CostoPenalidad], [Observacion], [Estado]) VALUES (3, 16, 1, CAST(N'2022-03-01T21:43:22.163' AS DateTime), CAST(N'2022-03-02T00:00:00.000' AS DateTime), CAST(N'2022-03-01T21:52:27.047' AS DateTime), CAST(120.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), CAST(122.80 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'', 0)
SET IDENTITY_INSERT [dbo].[RECEPCION] OFF
GO
INSERT [dbo].[TIPO_PERSONA] ([IdTipoPersona], [Descripcion], [Estado], [FechaCreacion]) VALUES (1, N'Administrador', 1, CAST(N'2022-02-24T22:45:43.123' AS DateTime))
INSERT [dbo].[TIPO_PERSONA] ([IdTipoPersona], [Descripcion], [Estado], [FechaCreacion]) VALUES (2, N'Empleado', 1, CAST(N'2022-02-24T22:45:43.123' AS DateTime))
INSERT [dbo].[TIPO_PERSONA] ([IdTipoPersona], [Descripcion], [Estado], [FechaCreacion]) VALUES (3, N'Cliente', 1, CAST(N'2022-02-24T22:45:43.123' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[VENTA] ON 

INSERT [dbo].[VENTA] ([IdVenta], [IdRecepcion], [Total], [Estado]) VALUES (1, 1, CAST(2.70 AS Decimal(10, 2)), N'Pendiente')
INSERT [dbo].[VENTA] ([IdVenta], [IdRecepcion], [Total], [Estado]) VALUES (2, 1, CAST(3.00 AS Decimal(10, 2)), N'Cancelado')
INSERT [dbo].[VENTA] ([IdVenta], [IdRecepcion], [Total], [Estado]) VALUES (3, 2, CAST(2.60 AS Decimal(10, 2)), N'Pendiente')
INSERT [dbo].[VENTA] ([IdVenta], [IdRecepcion], [Total], [Estado]) VALUES (4, 2, CAST(9.00 AS Decimal(10, 2)), N'Cancelado')
INSERT [dbo].[VENTA] ([IdVenta], [IdRecepcion], [Total], [Estado]) VALUES (5, 3, CAST(2.80 AS Decimal(10, 2)), N'Pendiente')
SET IDENTITY_INSERT [dbo].[VENTA] OFF
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[CATEGORIA] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ESTADO_HABITACION] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[ESTADO_HABITACION] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[HABITACION] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[HABITACION] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[PERSONA] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[PERSONA] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[PISO] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[PISO] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[RECEPCION] ADD  DEFAULT (getdate()) FOR [FechaEntrada]
GO
ALTER TABLE [dbo].[RECEPCION] ADD  DEFAULT ((0)) FOR [TotalPagado]
GO
ALTER TABLE [dbo].[RECEPCION] ADD  DEFAULT ((0)) FOR [CostoPenalidad]
GO
ALTER TABLE [dbo].[TIPO_PERSONA] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[TIPO_PERSONA] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[PRODUCTO] ([IdProducto])
GO
ALTER TABLE [dbo].[DETALLE_VENTA]  WITH CHECK ADD FOREIGN KEY([IdVenta])
REFERENCES [dbo].[VENTA] ([IdVenta])
GO
ALTER TABLE [dbo].[HABITACION]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[CATEGORIA] ([IdCategoria])
GO
ALTER TABLE [dbo].[HABITACION]  WITH CHECK ADD FOREIGN KEY([IdEstadoHabitacion])
REFERENCES [dbo].[ESTADO_HABITACION] ([IdEstadoHabitacion])
GO
ALTER TABLE [dbo].[HABITACION]  WITH CHECK ADD FOREIGN KEY([IdPiso])
REFERENCES [dbo].[PISO] ([IdPiso])
GO
ALTER TABLE [dbo].[PERSONA]  WITH CHECK ADD FOREIGN KEY([IdTipoPersona])
REFERENCES [dbo].[TIPO_PERSONA] ([IdTipoPersona])
GO
ALTER TABLE [dbo].[RECEPCION]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[PERSONA] ([IdPersona])
GO
ALTER TABLE [dbo].[RECEPCION]  WITH CHECK ADD FOREIGN KEY([IdHabitacion])
REFERENCES [dbo].[HABITACION] ([IdHabitacion])
GO
ALTER TABLE [dbo].[VENTA]  WITH CHECK ADD FOREIGN KEY([IdRecepcion])
REFERENCES [dbo].[RECEPCION] ([IdRecepcion])
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarCategoria]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR CATEGORIA
create procedure [dbo].[sp_ModificarCategoria](
@IdCategoria int,
@Descripcion varchar(60),
@Estado bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion =@Descripcion and IdCategoria != @IdCategoria)
		
		update CATEGORIA set 
		Descripcion = @Descripcion,
		Estado = @Estado
		where IdCategoria = @IdCategoria
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarHabitacion]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR HABITACION
create procedure [dbo].[sp_ModificarHabitacion](
@IdHabitacion int,
@Numero varchar(50),
@Detalle varchar(100),
@Precio decimal(10,2),
@IdPiso varchar(50),
@IdCategoria varchar(50),
@Estado bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM HABITACION WHERE Numero =@Numero and IdHabitacion != @IdHabitacion)
		
		update HABITACION set 
		Numero = @Numero,
		Detalle = @Detalle,
		Precio = @Precio,
		IdPiso = @IdPiso,
		IdCategoria = @IdCategoria,
		Estado = @Estado
		where IdHabitacion = @IdHabitacion
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarPersona]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR PERSONA
create procedure [dbo].[sp_ModificarPersona](
@IdPersona int,
@TipoDocumento varchar(50),
@Documento varchar(50),
@Nombre varchar(50),
@Apellido varchar(50),
@Correo varchar(50),
@Clave varchar(50),
@IdTipoPersona int,
@Estado bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM persona WHERE Documento =@Documento and IdPersona != @IdPersona)
		
		update PERSONA set
		TipoDocumento = @TipoDocumento,
		Documento = @Documento,
		Nombre = @Nombre,
		Apellido = @Apellido,
		Correo = @Correo,
		IdTipoPersona = @IdTipoPersona,
		Estado = @Estado
		where IdPersona = @IdPersona
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarPiso]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR PISOS
create procedure [dbo].[sp_ModificarPiso](
@IdPiso int,
@Descripcion varchar(60),
@Estado bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PISO WHERE Descripcion =@Descripcion and IdPiso != @IdPiso)
		
		update PISO set 
		Descripcion = @Descripcion,
		Estado = @Estado
		where IdPiso = @IdPiso
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarProducto]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA MODIFICAR PRODUCTO
create procedure [dbo].[sp_ModificarProducto](
@IdProducto int,
@Nombre varchar(50),
@Detalle varchar(50),
@Precio varchar(50),
@Cantidad varchar(50),
@Estado bit,
@Resultado bit output
)
as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Nombre =@Nombre and IdProducto != @IdProducto)
		
		update PRODUCTO set 
		Nombre = @Nombre,
		Detalle = @Detalle,
		Precio = @Precio,
		Cantidad = @Cantidad,
		Estado = @Estado
		where IdProducto = @IdProducto
	ELSE
		SET @Resultado = 0

end

GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarCategoria]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDIMIENTO PARA GUARDAR CATEGORIA
CREATE PROC [dbo].[sp_RegistrarCategoria](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM CATEGORIA WHERE Descripcion = @Descripcion)

		insert into CATEGORIA(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarHabitacion]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--PROCEDIMIENTO PARA GUARDAR HABITACION
create PROC [dbo].[sp_RegistrarHabitacion](
@Numero varchar(50),
@Detalle varchar(100),
@Precio decimal(10,2),
@IdPiso varchar(50),
@IdCategoria varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM HABITACION WHERE Numero = @Numero)

		insert into HABITACION(Numero,Detalle,Precio,IdPiso,IdCategoria,IdEstadoHabitacion) values (
		@Numero,@Detalle,@Precio,@IdPiso,@IdCategoria,1
		)
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarPersona]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA GUARDAR PERSONA
create PROC [dbo].[sp_RegistrarPersona](
@TipoDocumento varchar(50),
@Documento varchar(50),
@Nombre varchar(50),
@Apellido varchar(50),
@Correo varchar(50),
@Clave varchar(50),
@IdTipoPersona int,
@Resultado bit output
)as
begin
	SET @Resultado = 1
	DECLARE @IDPERSONA INT 
	IF NOT EXISTS (SELECT * FROM persona WHERE Documento = @Documento)
	begin
		insert into persona(TipoDocumento, Documento,Nombre,Apellido,Correo,Clave,IdTipoPersona) values (
		@TipoDocumento,@Documento,@Nombre,@Apellido,@Correo,@Clave,@IdTipoPersona)
	end
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarPiso]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA GUARDAR PISOS
CREATE PROC [dbo].[sp_RegistrarPiso](
@Descripcion varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PISO WHERE Descripcion = @Descripcion)

		insert into PISO(Descripcion) values (
		@Descripcion
		)
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarProducto]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--PROCEDIMIENTO PARA GUARDAR PRODUCTO
CREATE PROC [dbo].[sp_RegistrarProducto](
@Nombre varchar(50),
@Detalle varchar(50),
@Precio varchar(50),
@Cantidad varchar(50),
@Resultado bit output
)as
begin
	SET @Resultado = 1
	IF NOT EXISTS (SELECT * FROM PRODUCTO WHERE Nombre = @Nombre)

		insert into PRODUCTO(Nombre,Detalle,Precio,Cantidad) values (
		@Nombre,@Detalle,@Precio,@Cantidad
		)
	ELSE
		SET @Resultado = 0
	
end


GO
/****** Object:  StoredProcedure [dbo].[sp_registrarRecepcion]    Script Date: 18/04/2022 09:48:48 JC ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_registrarRecepcion](
@IdCliente int,
@TipoDocumento varchar(50),
@Documento varchar(50),
@Nombre varchar(50),
@Apellido varchar(50),
@Correo varchar(50),
@IdHabitacion int,
@FechaSalida datetime,
@PrecioInicial decimal(10,2),
@Adelanto decimal(10,2),
@PrecioRestante decimal(10,2),
@Observacion varchar(500),
@Resultado bit output
)
as
begin
	set @Resultado = 1
	begin try
		begin transaction
		if(not exists(select * from persona where IdPersona =@IdCliente ))
		begin
			insert into PERSONA(TipoDocumento,Documento,Nombre,Apellido,Correo,IdTipoPersona) values(
			@TipoDocumento,@Documento,@Nombre,@Apellido,@Correo,3)
			set @IdCliente = SCOPE_IDENTITY()  
		end

		update HABITACION set IdEstadoHabitacion = 2 where IdHabitacion = @IdHabitacion

		insert into RECEPCION(IdCliente,IdHabitacion,FechaSalida,PrecioInicial,Adelanto,PrecioRestante,Observacion,Estado) values
		(@IdCliente,@IdHabitacion,@FechaSalida,@PrecioInicial,@Adelanto,@PrecioRestante,@Observacion,1)

		commit transaction
	end try
	begin catch
		rollback
		set @Resultado = 0
	end catch

end



GO
USE [master]
GO
ALTER DATABASE [DB_HOTEL] SET  READ_WRITE 
GO
