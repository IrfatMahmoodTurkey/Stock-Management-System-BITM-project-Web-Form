USE [master]
GO
/****** Object:  Database [StockManagementSystemDb]    Script Date: 16/08/2018 00:51:30 ******/
CREATE DATABASE [StockManagementSystemDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockManagementSystemDb', FILENAME = N'G:\Microsoft SQL server\MSSQL12.MSSQLSERVER\MSSQL\DATA\StockManagementSystemDb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockManagementSystemDb_log', FILENAME = N'G:\Microsoft SQL server\MSSQL12.MSSQLSERVER\MSSQL\DATA\StockManagementSystemDb_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockManagementSystemDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagementSystemDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagementSystemDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagementSystemDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockManagementSystemDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockManagementSystemDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockManagementSystemDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockManagementSystemDb] SET  MULTI_USER 
GO
ALTER DATABASE [StockManagementSystemDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockManagementSystemDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockManagementSystemDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockManagementSystemDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [StockManagementSystemDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [StockManagementSystemDb]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 16/08/2018 00:51:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 16/08/2018 00:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items]    Script Date: 16/08/2018 00:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[CompanyId] [int] NULL,
	[ItemName] [varchar](50) NULL,
	[ReorderLevel] [int] NULL,
	[AvailableQuantity] [int] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockIn]    Script Date: 16/08/2018 00:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockIn](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[ItemId] [int] NULL,
	[StockInQuantity] [int] NULL,
 CONSTRAINT [PK_StockIn] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockOut]    Script Date: 16/08/2018 00:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockOut](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[ItemId] [int] NULL,
	[Date] [varchar](50) NULL,
	[StockOutQuantity] [int] NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_StockOut] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAuthentication]    Script Date: 16/08/2018 00:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAuthentication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_UserAuthentication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (11, N'Biscuit')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (8, N'Cosmetics')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (9, N'Electronics')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (10, N'Kitchen Items')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (7, N'Stationary')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (12, N'Toy')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (13, N'Vehicals')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [CompanyName]) VALUES (12, N'Nokia')
INSERT [dbo].[Company] ([Id], [CompanyName]) VALUES (9, N'Nova')
INSERT [dbo].[Company] ([Id], [CompanyName]) VALUES (10, N'Pran')
INSERT [dbo].[Company] ([Id], [CompanyName]) VALUES (7, N'RFL')
INSERT [dbo].[Company] ([Id], [CompanyName]) VALUES (11, N'Symphony')
INSERT [dbo].[Company] ([Id], [CompanyName]) VALUES (13, N'Toyota')
INSERT [dbo].[Company] ([Id], [CompanyName]) VALUES (6, N'Unilever')
INSERT [dbo].[Company] ([Id], [CompanyName]) VALUES (8, N'Walton')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (1, 9, 8, N'Mobile Phone', 10, 25)
INSERT [dbo].[Items] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (2, 9, 8, N'Freeze', 10, 0)
INSERT [dbo].[Items] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (3, 7, 7, N'Note book', 25, 0)
INSERT [dbo].[Items] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (4, 9, 9, N'Freeze', 15, 10)
INSERT [dbo].[Items] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (5, 11, 10, N'Toast', 10, 60)
INSERT [dbo].[Items] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (6, 9, 11, N'Mobile Phone', 10, 5)
INSERT [dbo].[Items] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (7, 12, 6, N'Car', 5, 0)
INSERT [dbo].[Items] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (8, 9, 8, N'TV', 10, 0)
INSERT [dbo].[Items] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (9, 8, 6, N'Perfume', 12, 0)
INSERT [dbo].[Items] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (10, 9, 12, N'Smart Phones', 10, 35)
INSERT [dbo].[Items] ([Id], [CategoryId], [CompanyId], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (11, 13, 13, N'Car', 5, 45)
SET IDENTITY_INSERT [dbo].[Items] OFF
SET IDENTITY_INSERT [dbo].[StockIn] ON 

INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (1, 8, 1, 15)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (2, 8, 1, 15)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (3, 9, 4, 50)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (4, 8, 1, 50)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (5, 8, 2, 12)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (6, 8, 1, 5)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (7, 8, 2, 3)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (8, 8, 1, 80)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (9, 9, 4, 30)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (10, 10, 5, 15)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (11, 10, 5, 20)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (12, 11, 6, 20)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (13, 11, 6, 20)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (14, 12, 10, 50)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (15, 12, 10, 10)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (16, 13, 11, 15)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (17, 13, 11, 15)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (20, 13, 11, 15)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (21, 13, 11, 5)
INSERT [dbo].[StockIn] ([Id], [CompanyId], [ItemId], [StockInQuantity]) VALUES (22, 10, 5, 50)
SET IDENTITY_INSERT [dbo].[StockIn] OFF
SET IDENTITY_INSERT [dbo].[StockOut] ON 

INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (1, 8, 1, N'2018/08/02', 15, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (2, 9, 4, N'2018/08/02', 10, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (3, 8, 2, N'2018/08/02', 5, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (4, 8, 2, N'2018/08/02', 2, N'Damage')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (5, 8, 1, N'2018/08/02', 5, N'Damage')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (6, 8, 1, N'2018/08/03', 5, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (7, 8, 1, N'2018/08/03', 60, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (8, 9, 4, N'2018/08/03', 40, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (9, 8, 2, N'2018/08/03', 8, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (11, 8, 1, N'2018/08/03', 10, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (12, 8, 1, N'2018/08/03', 10, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (13, 8, 1, N'2018/08/03', 5, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (14, 8, 1, N'2018/08/03', 15, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (15, 8, 1, N'2018/08/06', 10, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (16, 11, 6, N'2018/08/06', 5, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (17, 12, 10, N'2018/08/15', 10, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (18, 12, 10, N'2018/08/15', 10, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (19, 11, 6, N'2018/08/15', 5, N'Damage')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (20, 10, 5, N'2018/08/15', 10, N'Lost')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (21, 9, 4, N'2018/08/15', 10, N'Lost')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (22, 12, 10, N'2018/08/15', 15, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (23, 10, 5, N'2018/08/15', 13, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (24, 8, 1, N'2018/08/15', 5, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (25, 10, 5, N'2018/08/15', 2, N'Lost')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (26, 9, 4, N'2018/08/15', 2, N'Lost')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (27, 11, 6, N'2018/08/15', 5, N'Damage')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (28, 9, 4, N'2018/08/15', 8, N'Sold')
INSERT [dbo].[StockOut] ([Id], [CompanyId], [ItemId], [Date], [StockOutQuantity], [Type]) VALUES (29, 13, 11, N'2018/08/15', 5, N'Sold')
SET IDENTITY_INSERT [dbo].[StockOut] OFF
SET IDENTITY_INSERT [dbo].[UserAuthentication] ON 

INSERT [dbo].[UserAuthentication] ([Id], [UserId], [Password], [Type]) VALUES (1, N'212757', N'12345', N'LoggedOut')
INSERT [dbo].[UserAuthentication] ([Id], [UserId], [Password], [Type]) VALUES (2, N'212758', N'12345', N'LoggedOut')
INSERT [dbo].[UserAuthentication] ([Id], [UserId], [Password], [Type]) VALUES (3, N'212759', N'12345', N'LoggedOut')
SET IDENTITY_INSERT [dbo].[UserAuthentication] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Category]    Script Date: 16/08/2018 00:51:31 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [IX_Category] UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Company]    Script Date: 16/08/2018 00:51:31 ******/
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [IX_Company] UNIQUE NONCLUSTERED 
(
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Items]    Script Date: 16/08/2018 00:51:31 ******/
ALTER TABLE [dbo].[Items] ADD  CONSTRAINT [IX_Items] UNIQUE NONCLUSTERED 
(
	[CategoryId] ASC,
	[CompanyId] ASC,
	[ItemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserAuthentication]    Script Date: 16/08/2018 00:51:31 ******/
ALTER TABLE [dbo].[UserAuthentication] ADD  CONSTRAINT [IX_UserAuthentication] UNIQUE NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Category]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Company]
GO
ALTER TABLE [dbo].[StockIn]  WITH CHECK ADD  CONSTRAINT [FK_StockIn_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([Id])
GO
ALTER TABLE [dbo].[StockIn] CHECK CONSTRAINT [FK_StockIn_Items]
GO
ALTER TABLE [dbo].[StockOut]  WITH CHECK ADD  CONSTRAINT [FK_StockOut_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([Id])
GO
ALTER TABLE [dbo].[StockOut] CHECK CONSTRAINT [FK_StockOut_Items]
GO
USE [master]
GO
ALTER DATABASE [StockManagementSystemDb] SET  READ_WRITE 
GO
