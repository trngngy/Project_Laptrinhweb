USE [master]
GO
/****** Object:  Database [Perfume_Website]    Script Date: 12/9/2024 12:18:29 PM ******/
CREATE DATABASE [Perfume_Website]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Perfume_Website', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Perfume_Website.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Perfume_Website_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Perfume_Website_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Perfume_Website] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Perfume_Website].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Perfume_Website] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Perfume_Website] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Perfume_Website] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Perfume_Website] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Perfume_Website] SET ARITHABORT OFF 
GO
ALTER DATABASE [Perfume_Website] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Perfume_Website] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Perfume_Website] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Perfume_Website] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Perfume_Website] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Perfume_Website] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Perfume_Website] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Perfume_Website] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Perfume_Website] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Perfume_Website] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Perfume_Website] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Perfume_Website] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Perfume_Website] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Perfume_Website] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Perfume_Website] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Perfume_Website] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Perfume_Website] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Perfume_Website] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Perfume_Website] SET  MULTI_USER 
GO
ALTER DATABASE [Perfume_Website] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Perfume_Website] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Perfume_Website] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Perfume_Website] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Perfume_Website] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Perfume_Website] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Perfume_Website] SET QUERY_STORE = ON
GO
ALTER DATABASE [Perfume_Website] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Perfume_Website]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/9/2024 12:18:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/9/2024 12:18:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
	[UnitPrice] [money] NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/9/2024 12:18:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[TotalMoney] [money] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/9/2024 12:18:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](100) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[QuantitySold] [int] NULL,
	[StarRating] [smallint] NULL,
	[Discontinued] [bit] NULL,
	[image] [nvarchar](max) NULL,
	[describe] [nvarchar](max) NULL,
	[releaseDate] [date] NULL,
	[Discount] [float] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 12/9/2024 12:18:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Phone] [nvarchar](24) NULL,
	[HomePage] [ntext] NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/9/2024 12:18:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Image] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[BirthDay] [date] NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](11) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wallets]    Script Date: 12/9/2024 12:18:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallets](
	[WalletID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Balance] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Wallets] PRIMARY KEY CLUSTERED 
(
	[WalletID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetail]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_ProductDetail]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Supplier]
GO
ALTER TABLE [dbo].[Wallets]  WITH CHECK ADD  CONSTRAINT [FK_Wallets_Users] FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[Wallets] CHECK CONSTRAINT [FK_Wallets_Users]
GO
USE [master]
GO
ALTER DATABASE [Perfume_Website] SET  READ_WRITE 
GO
