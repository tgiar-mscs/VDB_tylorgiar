USE [master]
GO
/****** Object:  Database [MyProject]    Script Date: 9/21/2021 12:27:43 PM ******/
CREATE DATABASE [MyProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MyProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyProject] SET RECOVERY FULL 
GO
ALTER DATABASE [MyProject] SET  MULTI_USER 
GO
ALTER DATABASE [MyProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyProject', N'ON'
GO
ALTER DATABASE [MyProject] SET QUERY_STORE = OFF
GO
USE [MyProject]
GO
/****** Object:  Table [dbo].[DogBreed]    Script Date: 9/21/2021 12:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DogBreed](
	[BreedID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nchar](50) NOT NULL,
 CONSTRAINT [PK_DogBreed] PRIMARY KEY CLUSTERED 
(
	[BreedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RescueDogs]    Script Date: 9/21/2021 12:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RescueDogs](
	[DogID] [int] IDENTITY(1000,1) NOT NULL,
	[DogName] [nchar](20) NOT NULL,
	[DogGender] [nchar](10) NOT NULL,
	[BreedID] [int] NOT NULL,
 CONSTRAINT [PK_RescueDogs] PRIMARY KEY CLUSTERED 
(
	[DogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShelterCost]    Script Date: 9/21/2021 12:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShelterCost](
	[CostID] [int] IDENTITY(100,1) NOT NULL,
	[TypeofService] [nchar](50) NOT NULL,
	[Amount] [smallmoney] NOT NULL,
 CONSTRAINT [PK_ShelterCost] PRIMARY KEY CLUSTERED 
(
	[CostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShelterFunds]    Script Date: 9/21/2021 12:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShelterFunds](
	[FundsID] [int] IDENTITY(100,1) NOT NULL,
	[Donations] [smallmoney] NULL,
	[AdoptionFees] [smallmoney] NULL,
	[Fundraisers] [smallmoney] NULL,
 CONSTRAINT [PK_ShelterFunds] PRIMARY KEY CLUSTERED 
(
	[FundsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShelterRecords]    Script Date: 9/21/2021 12:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShelterRecords](
	[RecordsID] [int] IDENTITY(1000,1) NOT NULL,
	[DateRescued] [smalldatetime] NOT NULL,
	[AdoptionDate] [smalldatetime] NULL,
	[DogID] [int] NOT NULL,
 CONSTRAINT [PK_ShelterRecords] PRIMARY KEY CLUSTERED 
(
	[RecordsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShelterRevenue]    Script Date: 9/21/2021 12:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShelterRevenue](
	[RevenueID] [int] IDENTITY(100,1) NOT NULL,
	[CostID] [int] NULL,
	[DogID] [int] NULL,
	[FundsID] [int] NULL,
 CONSTRAINT [PK_ShelterRevenue] PRIMARY KEY CLUSTERED 
(
	[RevenueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DogBreed] ON 

INSERT [dbo].[DogBreed] ([BreedID], [Type]) VALUES (1, N'Bull Dog                                          ')
INSERT [dbo].[DogBreed] ([BreedID], [Type]) VALUES (2, N'Pug                                               ')
INSERT [dbo].[DogBreed] ([BreedID], [Type]) VALUES (3, N'Yorkie                                            ')
SET IDENTITY_INSERT [dbo].[DogBreed] OFF
GO
SET IDENTITY_INSERT [dbo].[RescueDogs] ON 

INSERT [dbo].[RescueDogs] ([DogID], [DogName], [DogGender], [BreedID]) VALUES (1000, N'Daisy               ', N'Female    ', 1)
INSERT [dbo].[RescueDogs] ([DogID], [DogName], [DogGender], [BreedID]) VALUES (1001, N'Dodger              ', N'Male      ', 3)
INSERT [dbo].[RescueDogs] ([DogID], [DogName], [DogGender], [BreedID]) VALUES (1002, N'Badger              ', N'Male      ', 2)
SET IDENTITY_INSERT [dbo].[RescueDogs] OFF
GO
SET IDENTITY_INSERT [dbo].[ShelterCost] ON 

INSERT [dbo].[ShelterCost] ([CostID], [TypeofService], [Amount]) VALUES (101, N'Vaccines                                          ', 100.0000)
INSERT [dbo].[ShelterCost] ([CostID], [TypeofService], [Amount]) VALUES (102, N'Insert Chip                                       ', 150.0000)
INSERT [dbo].[ShelterCost] ([CostID], [TypeofService], [Amount]) VALUES (103, N'Food                                              ', 50.0000)
SET IDENTITY_INSERT [dbo].[ShelterCost] OFF
GO
SET IDENTITY_INSERT [dbo].[ShelterFunds] ON 

INSERT [dbo].[ShelterFunds] ([FundsID], [Donations], [AdoptionFees], [Fundraisers]) VALUES (100, 100.0000, NULL, NULL)
INSERT [dbo].[ShelterFunds] ([FundsID], [Donations], [AdoptionFees], [Fundraisers]) VALUES (101, NULL, 350.0000, NULL)
INSERT [dbo].[ShelterFunds] ([FundsID], [Donations], [AdoptionFees], [Fundraisers]) VALUES (102, NULL, NULL, 200.0000)
SET IDENTITY_INSERT [dbo].[ShelterFunds] OFF
GO
SET IDENTITY_INSERT [dbo].[ShelterRecords] ON 

INSERT [dbo].[ShelterRecords] ([RecordsID], [DateRescued], [AdoptionDate], [DogID]) VALUES (1000, CAST(N'2000-10-21T00:00:00' AS SmallDateTime), CAST(N'2000-12-19T00:00:00' AS SmallDateTime), 1000)
INSERT [dbo].[ShelterRecords] ([RecordsID], [DateRescued], [AdoptionDate], [DogID]) VALUES (1001, CAST(N'2001-05-04T00:00:00' AS SmallDateTime), CAST(N'2001-10-10T00:00:00' AS SmallDateTime), 1001)
INSERT [dbo].[ShelterRecords] ([RecordsID], [DateRescued], [AdoptionDate], [DogID]) VALUES (1004, CAST(N'2021-03-27T00:00:00' AS SmallDateTime), NULL, 1002)
SET IDENTITY_INSERT [dbo].[ShelterRecords] OFF
GO
SET IDENTITY_INSERT [dbo].[ShelterRevenue] ON 

INSERT [dbo].[ShelterRevenue] ([RevenueID], [CostID], [DogID], [FundsID]) VALUES (100, 101, 1000, NULL)
INSERT [dbo].[ShelterRevenue] ([RevenueID], [CostID], [DogID], [FundsID]) VALUES (101, 102, 1002, NULL)
INSERT [dbo].[ShelterRevenue] ([RevenueID], [CostID], [DogID], [FundsID]) VALUES (103, NULL, NULL, 100)
SET IDENTITY_INSERT [dbo].[ShelterRevenue] OFF
GO
USE [master]
GO
ALTER DATABASE [MyProject] SET  READ_WRITE 
GO
