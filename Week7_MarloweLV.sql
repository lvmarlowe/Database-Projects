USE [master]
GO
/****** Object:  Database [XYZTruckingDatabase]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE DATABASE [XYZTruckingDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XYZTruckingDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\XYZTruckingDatabase.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'XYZTruckingDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\XYZTruckingDatabase_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [XYZTruckingDatabase] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XYZTruckingDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XYZTruckingDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XYZTruckingDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XYZTruckingDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [XYZTruckingDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XYZTruckingDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [XYZTruckingDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [XYZTruckingDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XYZTruckingDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XYZTruckingDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XYZTruckingDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [XYZTruckingDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
USE [XYZTruckingDatabase]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[DriverID] [int] IDENTITY(1,1) NOT NULL,
	[DriverEmployeeNumber] [int] NOT NULL,
	[DriverFirstName] [nvarchar](50) NOT NULL,
	[DriverLastName] [nvarchar](70) NOT NULL,
	[DriverDOB] [datetime] NOT NULL,
	[DriverHireDate] [datetime] NULL,
	[DriverHasCommercialLicense] [bit] NOT NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HaulLineItem]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HaulLineItem](
	[HaulLineItemID] [int] IDENTITY(1,1) NOT NULL,
	[LUItem_ItemID] [int] NOT NULL,
	[ItemQuantity] [int] NOT NULL,
	[HaulRecord_HaulRecordID] [int] NOT NULL,
 CONSTRAINT [PK_HaulItem] PRIMARY KEY CLUSTERED 
(
	[HaulLineItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HaulRecord]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HaulRecord](
	[HaulRecordID] [int] IDENTITY(1,1) NOT NULL,
	[Truck_TruckID] [int] NOT NULL,
	[Driver_DriverID] [int] NOT NULL,
	[HaulRecordNumber] [nvarchar](10) NOT NULL,
	[HaulRecordClient] [nvarchar](50) NOT NULL,
	[LUCargoType_CargoTypeID] [int] NOT NULL,
	[HaulRecordStartDate] [datetime] NOT NULL,
	[HaulRecordDeliveryDate] [datetime] NOT NULL,
	[HaulRecordNotes] [nvarchar](500) NULL,
	[HaulRecordMileage] [int] NOT NULL,
 CONSTRAINT [PK_Haul] PRIMARY KEY CLUSTERED 
(
	[HaulRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LUCargoType]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LUCargoType](
	[CargoTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CargoTypeAbbreviation] [nvarchar](3) NOT NULL,
	[CargoTypeDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LUCargoType] PRIMARY KEY CLUSTERED 
(
	[CargoTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LUItem]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LUItem](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemNumber] [int] NOT NULL,
	[ItemMake] [nvarchar](25) NOT NULL,
	[ItemModel] [nvarchar](30) NOT NULL,
	[ItemDescription] [nvarchar](50) NOT NULL,
	[ItemWeightPerUnitLbs] [int] NOT NULL,
 CONSTRAINT [PK_LUItem] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LUMaintenanceCode]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LUMaintenanceCode](
	[MaintenanceCodeID] [int] IDENTITY(1,1) NOT NULL,
	[MaintenanceCodeAbbreviation] [nvarchar](3) NOT NULL,
	[MaintenanceCodeDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LUMaintenanceCode] PRIMARY KEY CLUSTERED 
(
	[MaintenanceCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LUMaintenanceType]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LUMaintenanceType](
	[MaintenanceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[MaintenanceTypeAbbreviation] [nvarchar](3) NOT NULL,
	[MaintenanceTypeDescription] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_LUMaintenanceType] PRIMARY KEY CLUSTERED 
(
	[MaintenanceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LUTrailerType]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LUTrailerType](
	[TrailerTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TrailerTypeAbbreviation] [nvarchar](3) NOT NULL,
	[TrailerTypeDescription] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_LUTrailerType] PRIMARY KEY CLUSTERED 
(
	[TrailerTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LUTruckBodyType]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LUTruckBodyType](
	[TruckBodyTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TruckBodyTypeAbbreviation] [nvarchar](3) NOT NULL,
	[TruckBodyTypeDescription] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_LUTruckBodyType] PRIMARY KEY CLUSTERED 
(
	[TruckBodyTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LUTruckType]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LUTruckType](
	[TruckTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TruckTypeAbbreviation] [nvarchar](3) NOT NULL,
	[TruckTypeDescription] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_LUTruckType] PRIMARY KEY CLUSTERED 
(
	[TruckTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Maintenance]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maintenance](
	[MaintenanceID] [int] IDENTITY(1,1) NOT NULL,
	[MaintenanceTicketNumber] [nvarchar](10) NOT NULL,
	[Truck_TruckID] [int] NOT NULL,
	[LUMaintenanceType_MaintenanceTypeID] [int] NOT NULL,
	[MaintenanceStartDate] [datetime] NOT NULL,
	[MaintenanceEndDate] [datetime] NOT NULL,
	[LUMaintenanceCode_MaintenanceCodeID] [int] NOT NULL,
 CONSTRAINT [PK_Maintenance] PRIMARY KEY CLUSTERED 
(
	[MaintenanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trailer]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trailer](
	[TrailerID] [int] IDENTITY(1,1) NOT NULL,
	[TrailerNumber] [nvarchar](10) NOT NULL,
	[TrailerDescription] [nvarchar](100) NOT NULL,
	[LUTrailerType_TrailerTypeID] [int] NOT NULL,
	[TrailerCapacityLbs] [int] NOT NULL,
	[TrailerMileage] [int] NOT NULL,
 CONSTRAINT [PK_Trailers] PRIMARY KEY CLUSTERED 
(
	[TrailerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Truck]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Truck](
	[TruckID] [int] IDENTITY(1,1) NOT NULL,
	[TruckNumber] [nvarchar](10) NOT NULL,
	[TruckLicenceNumber] [int] NULL,
	[TruckMake] [nvarchar](30) NULL,
	[TruckModel] [nvarchar](30) NULL,
	[LUTruckType_TruckTypeID] [int] NOT NULL,
	[LUTruckBodyType_TruckBodyTypeID] [int] NOT NULL,
	[TruckEngineType] [nvarchar](50) NULL,
	[TruckFuelType] [nvarchar](50) NULL,
	[TruckMileage] [int] NOT NULL,
	[Trailer_TrailerID] [int] NULL,
 CONSTRAINT [PK_Trucks] PRIMARY KEY CLUSTERED 
(
	[TruckID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Driver] ON 

INSERT [dbo].[Driver] ([DriverID], [DriverEmployeeNumber], [DriverFirstName], [DriverLastName], [DriverDOB], [DriverHireDate], [DriverHasCommercialLicense]) VALUES (4, 105874, N'LV', N'Marlowe', CAST(N'1982-01-22 00:00:00.000' AS DateTime), CAST(N'2020-12-28 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Driver] ([DriverID], [DriverEmployeeNumber], [DriverFirstName], [DriverLastName], [DriverDOB], [DriverHireDate], [DriverHasCommercialLicense]) VALUES (5, 112882, N'Jake', N'Eaton', CAST(N'1986-07-15 00:00:00.000' AS DateTime), CAST(N'2021-11-15 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Driver] ([DriverID], [DriverEmployeeNumber], [DriverFirstName], [DriverLastName], [DriverDOB], [DriverHireDate], [DriverHasCommercialLicense]) VALUES (6, 112883, N'Figment', N'Marlowe', CAST(N'2017-07-13 00:00:00.000' AS DateTime), CAST(N'2021-11-16 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Driver] ([DriverID], [DriverEmployeeNumber], [DriverFirstName], [DriverLastName], [DriverDOB], [DriverHireDate], [DriverHasCommercialLicense]) VALUES (7, 94436, N'Pigeon', N'Marlowe', CAST(N'2017-02-02 00:00:00.000' AS DateTime), CAST(N'2017-02-03 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Driver] ([DriverID], [DriverEmployeeNumber], [DriverFirstName], [DriverLastName], [DriverDOB], [DriverHireDate], [DriverHasCommercialLicense]) VALUES (8, 54839, N'Moist', N'von Lipwig', CAST(N'1840-01-18 00:00:00.000' AS DateTime), CAST(N'2015-04-28 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Driver] ([DriverID], [DriverEmployeeNumber], [DriverFirstName], [DriverLastName], [DriverDOB], [DriverHireDate], [DriverHasCommercialLicense]) VALUES (9, 28131, N'Tolliver', N'Groat', CAST(N'1953-05-30 00:00:00.000' AS DateTime), CAST(N'2013-03-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Driver] ([DriverID], [DriverEmployeeNumber], [DriverFirstName], [DriverLastName], [DriverDOB], [DriverHireDate], [DriverHasCommercialLicense]) VALUES (10, 34125, N'Mister', N'Slant', CAST(N'1976-05-25 00:00:00.000' AS DateTime), CAST(N'2014-09-25 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Driver] ([DriverID], [DriverEmployeeNumber], [DriverFirstName], [DriverLastName], [DriverDOB], [DriverHireDate], [DriverHasCommercialLicense]) VALUES (11, 44875, N'Missus', N'Cake', CAST(N'1999-06-17 00:00:00.000' AS DateTime), CAST(N'2014-11-28 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Driver] ([DriverID], [DriverEmployeeNumber], [DriverFirstName], [DriverLastName], [DriverDOB], [DriverHireDate], [DriverHasCommercialLicense]) VALUES (15, 14588, N'Lindsey', N'Lane', CAST(N'2001-08-30 00:00:00.000' AS DateTime), CAST(N'2021-11-25 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Driver] OFF
SET IDENTITY_INSERT [dbo].[HaulLineItem] ON 

INSERT [dbo].[HaulLineItem] ([HaulLineItemID], [LUItem_ItemID], [ItemQuantity], [HaulRecord_HaulRecordID]) VALUES (1, 10, 87, 2)
INSERT [dbo].[HaulLineItem] ([HaulLineItemID], [LUItem_ItemID], [ItemQuantity], [HaulRecord_HaulRecordID]) VALUES (2, 11, 20, 3)
INSERT [dbo].[HaulLineItem] ([HaulLineItemID], [LUItem_ItemID], [ItemQuantity], [HaulRecord_HaulRecordID]) VALUES (3, 9, 980, 4)
INSERT [dbo].[HaulLineItem] ([HaulLineItemID], [LUItem_ItemID], [ItemQuantity], [HaulRecord_HaulRecordID]) VALUES (4, 10, 1, 4)
INSERT [dbo].[HaulLineItem] ([HaulLineItemID], [LUItem_ItemID], [ItemQuantity], [HaulRecord_HaulRecordID]) VALUES (5, 13, 700, 5)
INSERT [dbo].[HaulLineItem] ([HaulLineItemID], [LUItem_ItemID], [ItemQuantity], [HaulRecord_HaulRecordID]) VALUES (7, 8, 7100, 7)
INSERT [dbo].[HaulLineItem] ([HaulLineItemID], [LUItem_ItemID], [ItemQuantity], [HaulRecord_HaulRecordID]) VALUES (8, 9, 600, 8)
INSERT [dbo].[HaulLineItem] ([HaulLineItemID], [LUItem_ItemID], [ItemQuantity], [HaulRecord_HaulRecordID]) VALUES (9, 2, 5050, 9)
INSERT [dbo].[HaulLineItem] ([HaulLineItemID], [LUItem_ItemID], [ItemQuantity], [HaulRecord_HaulRecordID]) VALUES (11, 5, 423, 10)
INSERT [dbo].[HaulLineItem] ([HaulLineItemID], [LUItem_ItemID], [ItemQuantity], [HaulRecord_HaulRecordID]) VALUES (12, 6, 8700, 12)
INSERT [dbo].[HaulLineItem] ([HaulLineItemID], [LUItem_ItemID], [ItemQuantity], [HaulRecord_HaulRecordID]) VALUES (14, 16, 3200, 2)
INSERT [dbo].[HaulLineItem] ([HaulLineItemID], [LUItem_ItemID], [ItemQuantity], [HaulRecord_HaulRecordID]) VALUES (15, 14, 870, 6)
INSERT [dbo].[HaulLineItem] ([HaulLineItemID], [LUItem_ItemID], [ItemQuantity], [HaulRecord_HaulRecordID]) VALUES (16, 23, 600, 4)
INSERT [dbo].[HaulLineItem] ([HaulLineItemID], [LUItem_ItemID], [ItemQuantity], [HaulRecord_HaulRecordID]) VALUES (17, 32, 5400, 5)
SET IDENTITY_INSERT [dbo].[HaulLineItem] OFF
SET IDENTITY_INSERT [dbo].[HaulRecord] ON 

INSERT [dbo].[HaulRecord] ([HaulRecordID], [Truck_TruckID], [Driver_DriverID], [HaulRecordNumber], [HaulRecordClient], [LUCargoType_CargoTypeID], [HaulRecordStartDate], [HaulRecordDeliveryDate], [HaulRecordNotes], [HaulRecordMileage]) VALUES (2, 1, 4, N'H0001     ', N'Eden Botanicals', 5, CAST(N'2021-01-02 00:00:00.000' AS DateTime), CAST(N'2021-01-06 00:00:00.000' AS DateTime), NULL, 1587)
INSERT [dbo].[HaulRecord] ([HaulRecordID], [Truck_TruckID], [Driver_DriverID], [HaulRecordNumber], [HaulRecordClient], [LUCargoType_CargoTypeID], [HaulRecordStartDate], [HaulRecordDeliveryDate], [HaulRecordNotes], [HaulRecordMileage]) VALUES (3, 4, 9, N'H0002     ', N'Hermitage', 6, CAST(N'2021-01-01 00:00:00.000' AS DateTime), CAST(N'2021-01-01 00:00:00.000' AS DateTime), NULL, 324)
INSERT [dbo].[HaulRecord] ([HaulRecordID], [Truck_TruckID], [Driver_DriverID], [HaulRecordNumber], [HaulRecordClient], [LUCargoType_CargoTypeID], [HaulRecordStartDate], [HaulRecordDeliveryDate], [HaulRecordNotes], [HaulRecordMileage]) VALUES (4, 1, 6, N'H0003     ', N'Apocalypse Apothecary', 4, CAST(N'2021-01-05 00:00:00.000' AS DateTime), CAST(N'2021-01-13 00:00:00.000' AS DateTime), NULL, 3488)
INSERT [dbo].[HaulRecord] ([HaulRecordID], [Truck_TruckID], [Driver_DriverID], [HaulRecordNumber], [HaulRecordClient], [LUCargoType_CargoTypeID], [HaulRecordStartDate], [HaulRecordDeliveryDate], [HaulRecordNotes], [HaulRecordMileage]) VALUES (5, 13, 9, N'H0004     ', N'LIQUIDE', 3, CAST(N'2021-01-08 00:00:00.000' AS DateTime), CAST(N'2021-01-10 00:00:00.000' AS DateTime), NULL, 897)
INSERT [dbo].[HaulRecord] ([HaulRecordID], [Truck_TruckID], [Driver_DriverID], [HaulRecordNumber], [HaulRecordClient], [LUCargoType_CargoTypeID], [HaulRecordStartDate], [HaulRecordDeliveryDate], [HaulRecordNotes], [HaulRecordMileage]) VALUES (6, 9, 4, N'H0005     ', N'Appliance Center', 6, CAST(N'2021-01-09 00:00:00.000' AS DateTime), CAST(N'2021-01-12 00:00:00.000' AS DateTime), NULL, 2444)
INSERT [dbo].[HaulRecord] ([HaulRecordID], [Truck_TruckID], [Driver_DriverID], [HaulRecordNumber], [HaulRecordClient], [LUCargoType_CargoTypeID], [HaulRecordStartDate], [HaulRecordDeliveryDate], [HaulRecordNotes], [HaulRecordMileage]) VALUES (7, 14, 9, N'H0006     ', N'Car Boys', 6, CAST(N'2021-01-09 00:00:00.000' AS DateTime), CAST(N'2021-01-10 00:00:00.000' AS DateTime), NULL, 759)
INSERT [dbo].[HaulRecord] ([HaulRecordID], [Truck_TruckID], [Driver_DriverID], [HaulRecordNumber], [HaulRecordClient], [LUCargoType_CargoTypeID], [HaulRecordStartDate], [HaulRecordDeliveryDate], [HaulRecordNotes], [HaulRecordMileage]) VALUES (8, 10, 5, N'H0007     ', N'Swanhilda Lane Photography', 6, CAST(N'2021-01-15 00:00:00.000' AS DateTime), CAST(N'2021-01-17 00:00:00.000' AS DateTime), NULL, 1254)
INSERT [dbo].[HaulRecord] ([HaulRecordID], [Truck_TruckID], [Driver_DriverID], [HaulRecordNumber], [HaulRecordClient], [LUCargoType_CargoTypeID], [HaulRecordStartDate], [HaulRecordDeliveryDate], [HaulRecordNotes], [HaulRecordMileage]) VALUES (9, 1, 7, N'H0008     ', N'Macy''s', 6, CAST(N'2021-01-17 00:00:00.000' AS DateTime), CAST(N'2021-01-17 00:00:00.000' AS DateTime), NULL, 235)
INSERT [dbo].[HaulRecord] ([HaulRecordID], [Truck_TruckID], [Driver_DriverID], [HaulRecordNumber], [HaulRecordClient], [LUCargoType_CargoTypeID], [HaulRecordStartDate], [HaulRecordDeliveryDate], [HaulRecordNotes], [HaulRecordMileage]) VALUES (10, 12, 4, N'H0009     ', N'365 Purified', 6, CAST(N'2021-01-19 00:00:00.000' AS DateTime), CAST(N'2021-01-24 00:00:00.000' AS DateTime), NULL, 2745)
INSERT [dbo].[HaulRecord] ([HaulRecordID], [Truck_TruckID], [Driver_DriverID], [HaulRecordNumber], [HaulRecordClient], [LUCargoType_CargoTypeID], [HaulRecordStartDate], [HaulRecordDeliveryDate], [HaulRecordNotes], [HaulRecordMileage]) VALUES (12, 11, 6, N'H0010     ', N'Why Me Productions', 6, CAST(N'2021-01-24 00:00:00.000' AS DateTime), CAST(N'2021-01-26 00:00:00.000' AS DateTime), NULL, 1974)
SET IDENTITY_INSERT [dbo].[HaulRecord] OFF
SET IDENTITY_INSERT [dbo].[LUCargoType] ON 

INSERT [dbo].[LUCargoType] ([CargoTypeID], [CargoTypeAbbreviation], [CargoTypeDescription]) VALUES (3, N'HAZ', N'Hazardous')
INSERT [dbo].[LUCargoType] ([CargoTypeID], [CargoTypeAbbreviation], [CargoTypeDescription]) VALUES (4, N'LIQ', N'Liquid')
INSERT [dbo].[LUCargoType] ([CargoTypeID], [CargoTypeAbbreviation], [CargoTypeDescription]) VALUES (5, N'REF', N'Refrigerated')
INSERT [dbo].[LUCargoType] ([CargoTypeID], [CargoTypeAbbreviation], [CargoTypeDescription]) VALUES (6, N'STA', N'Standard')
INSERT [dbo].[LUCargoType] ([CargoTypeID], [CargoTypeAbbreviation], [CargoTypeDescription]) VALUES (7, N'OTH', N'Other')
SET IDENTITY_INSERT [dbo].[LUCargoType] OFF
SET IDENTITY_INSERT [dbo].[LUItem] ON 

INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (2, 10001, N'Apple', N'iPhone 3G', N'Cell Phone', 4)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (4, 10002, N'Apple', N'iPhone 3GS', N'Cell Phone', 4)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (5, 10003, N'Apple', N'iPhone 4', N'Cell Phone', 3)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (6, 10004, N'Apple', N'iPhone 4S', N'Cell Phone', 3)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (7, 10005, N'Apple', N'iPhone 5', N'Cell Phone', 3)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (8, 10006, N'Apple', N'iPhone 5C', N'Cell Phone', 3)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (9, 10007, N'Apple', N'iPhone 5S', N'Cell Phone', 3)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (10, 10008, N'Apple', N'iPhone 6', N'Cell Phone', 3)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (11, 10009, N'Apple', N'iPhone 6 Plus', N'Cell Phone', 3)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (12, 10010, N'Apple', N'iPhone 6S', N'Cell Phone', 2)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (13, 10011, N'Apple', N'iPhone 6S Plus', N'Cell Phone', 3)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (14, 20001, N'Whirlpool', N' 2LA5700XMW0', N'Washing Machine', 125)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (16, 30001, N'Applegate', N'Sunday Bacon', N'Bacon', 1)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (19, 30002, N'Applegate', N'Monday Bacon', N'Bacon', 1)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (20, 30003, N'Applegate', N'Thursday Bacon', N'Bacon', 1)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (23, 40001, N'Homicider', N'Hard Arsenic', N'Poison Spritzer', 40)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (25, 40002, N'Homicider', N'Hard Anthrax', N'Poison Spritzer', 40)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (26, 40003, N'Homicider', N'Hard Ricin', N'Poison Spritzer', 40)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (27, 50001, N'Stinky''s', N'Raw Pork', N'Cat Food', 5)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (28, 50002, N'Stinky''s', N'Raw Beef', N'Cat Food', 5)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (29, 50003, N'Stinky''s ', N'Raw Wombat', N'Cat Food', 5)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (30, 60001, N'Dukes of Hazard', N'Grape Ethanol', N'Alcohol', 80)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (31, 60002, N'Dukes of Hazard', N'Corn Ethanol', N'Alcohol', 80)
INSERT [dbo].[LUItem] ([ItemID], [ItemNumber], [ItemMake], [ItemModel], [ItemDescription], [ItemWeightPerUnitLbs]) VALUES (32, 60003, N'Dukes of Hazard', N'Puppy Ethanol', N'Alcohol', 80)
SET IDENTITY_INSERT [dbo].[LUItem] OFF
SET IDENTITY_INSERT [dbo].[LUMaintenanceCode] ON 

INSERT [dbo].[LUMaintenanceCode] ([MaintenanceCodeID], [MaintenanceCodeAbbreviation], [MaintenanceCodeDescription]) VALUES (1, N'R', N'Routine')
INSERT [dbo].[LUMaintenanceCode] ([MaintenanceCodeID], [MaintenanceCodeAbbreviation], [MaintenanceCodeDescription]) VALUES (2, N'U', N'Unscheduled')
SET IDENTITY_INSERT [dbo].[LUMaintenanceCode] OFF
SET IDENTITY_INSERT [dbo].[LUMaintenanceType] ON 

INSERT [dbo].[LUMaintenanceType] ([MaintenanceTypeID], [MaintenanceTypeAbbreviation], [MaintenanceTypeDescription]) VALUES (1, N'ENG', N'Engine')
INSERT [dbo].[LUMaintenanceType] ([MaintenanceTypeID], [MaintenanceTypeAbbreviation], [MaintenanceTypeDescription]) VALUES (2, N'TRA', N'Transmission')
INSERT [dbo].[LUMaintenanceType] ([MaintenanceTypeID], [MaintenanceTypeAbbreviation], [MaintenanceTypeDescription]) VALUES (3, N'TIR', N'Tires')
INSERT [dbo].[LUMaintenanceType] ([MaintenanceTypeID], [MaintenanceTypeAbbreviation], [MaintenanceTypeDescription]) VALUES (4, N'BOD', N'Body')
INSERT [dbo].[LUMaintenanceType] ([MaintenanceTypeID], [MaintenanceTypeAbbreviation], [MaintenanceTypeDescription]) VALUES (5, N'ELE', N'Electrical')
INSERT [dbo].[LUMaintenanceType] ([MaintenanceTypeID], [MaintenanceTypeAbbreviation], [MaintenanceTypeDescription]) VALUES (6, N'HYD', N'Hydraulic')
INSERT [dbo].[LUMaintenanceType] ([MaintenanceTypeID], [MaintenanceTypeAbbreviation], [MaintenanceTypeDescription]) VALUES (7, N'PNE', N'Pneumatic')
SET IDENTITY_INSERT [dbo].[LUMaintenanceType] OFF
SET IDENTITY_INSERT [dbo].[LUTrailerType] ON 

INSERT [dbo].[LUTrailerType] ([TrailerTypeID], [TrailerTypeAbbreviation], [TrailerTypeDescription]) VALUES (1, N'TAN', N'Tanker')
INSERT [dbo].[LUTrailerType] ([TrailerTypeID], [TrailerTypeAbbreviation], [TrailerTypeDescription]) VALUES (2, N'FLA', N'Flat Bed')
INSERT [dbo].[LUTrailerType] ([TrailerTypeID], [TrailerTypeAbbreviation], [TrailerTypeDescription]) VALUES (3, N'BOX', N'Box')
INSERT [dbo].[LUTrailerType] ([TrailerTypeID], [TrailerTypeAbbreviation], [TrailerTypeDescription]) VALUES (4, N'REF', N'Refrigerated')
SET IDENTITY_INSERT [dbo].[LUTrailerType] OFF
SET IDENTITY_INSERT [dbo].[LUTruckBodyType] ON 

INSERT [dbo].[LUTruckBodyType] ([TruckBodyTypeID], [TruckBodyTypeAbbreviation], [TruckBodyTypeDescription]) VALUES (1, N'TRA', N'Tractor-Trailer')
INSERT [dbo].[LUTruckBodyType] ([TruckBodyTypeID], [TruckBodyTypeAbbreviation], [TruckBodyTypeDescription]) VALUES (2, N'SIN', N'Single Unit')
SET IDENTITY_INSERT [dbo].[LUTruckBodyType] OFF
SET IDENTITY_INSERT [dbo].[LUTruckType] ON 

INSERT [dbo].[LUTruckType] ([TruckTypeID], [TruckTypeAbbreviation], [TruckTypeDescription]) VALUES (1, N'LON', N'Long Haul')
INSERT [dbo].[LUTruckType] ([TruckTypeID], [TruckTypeAbbreviation], [TruckTypeDescription]) VALUES (2, N'SHO', N'Short Haul')
SET IDENTITY_INSERT [dbo].[LUTruckType] OFF
SET IDENTITY_INSERT [dbo].[Maintenance] ON 

INSERT [dbo].[Maintenance] ([MaintenanceID], [MaintenanceTicketNumber], [Truck_TruckID], [LUMaintenanceType_MaintenanceTypeID], [MaintenanceStartDate], [MaintenanceEndDate], [LUMaintenanceCode_MaintenanceCodeID]) VALUES (1, N'M0001     ', 1, 7, CAST(N'2021-01-05 00:00:00.000' AS DateTime), CAST(N'2021-01-06 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Maintenance] ([MaintenanceID], [MaintenanceTicketNumber], [Truck_TruckID], [LUMaintenanceType_MaintenanceTypeID], [MaintenanceStartDate], [MaintenanceEndDate], [LUMaintenanceCode_MaintenanceCodeID]) VALUES (6, N'M0002     ', 4, 2, CAST(N'2021-01-23 00:00:00.000' AS DateTime), CAST(N'2021-05-25 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Maintenance] ([MaintenanceID], [MaintenanceTicketNumber], [Truck_TruckID], [LUMaintenanceType_MaintenanceTypeID], [MaintenanceStartDate], [MaintenanceEndDate], [LUMaintenanceCode_MaintenanceCodeID]) VALUES (8, N'M0003     ', 14, 3, CAST(N'2021-01-23 00:00:00.000' AS DateTime), CAST(N'2021-01-26 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Maintenance] ([MaintenanceID], [MaintenanceTicketNumber], [Truck_TruckID], [LUMaintenanceType_MaintenanceTypeID], [MaintenanceStartDate], [MaintenanceEndDate], [LUMaintenanceCode_MaintenanceCodeID]) VALUES (9, N'M0004     ', 15, 6, CAST(N'2021-01-27 00:00:00.000' AS DateTime), CAST(N'2021-01-29 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Maintenance] ([MaintenanceID], [MaintenanceTicketNumber], [Truck_TruckID], [LUMaintenanceType_MaintenanceTypeID], [MaintenanceStartDate], [MaintenanceEndDate], [LUMaintenanceCode_MaintenanceCodeID]) VALUES (11, N'M0005     ', 14, 3, CAST(N'2021-01-30 00:00:00.000' AS DateTime), CAST(N'2021-01-30 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Maintenance] ([MaintenanceID], [MaintenanceTicketNumber], [Truck_TruckID], [LUMaintenanceType_MaintenanceTypeID], [MaintenanceStartDate], [MaintenanceEndDate], [LUMaintenanceCode_MaintenanceCodeID]) VALUES (12, N'M0006     ', 14, 3, CAST(N'2021-02-02 00:00:00.000' AS DateTime), CAST(N'2021-02-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Maintenance] ([MaintenanceID], [MaintenanceTicketNumber], [Truck_TruckID], [LUMaintenanceType_MaintenanceTypeID], [MaintenanceStartDate], [MaintenanceEndDate], [LUMaintenanceCode_MaintenanceCodeID]) VALUES (16, N'M0007     ', 6, 2, CAST(N'2021-02-02 00:00:00.000' AS DateTime), CAST(N'2021-02-04 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Maintenance] ([MaintenanceID], [MaintenanceTicketNumber], [Truck_TruckID], [LUMaintenanceType_MaintenanceTypeID], [MaintenanceStartDate], [MaintenanceEndDate], [LUMaintenanceCode_MaintenanceCodeID]) VALUES (17, N'M0008     ', 5, 2, CAST(N'2021-02-03 00:00:00.000' AS DateTime), CAST(N'2021-02-03 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Maintenance] ([MaintenanceID], [MaintenanceTicketNumber], [Truck_TruckID], [LUMaintenanceType_MaintenanceTypeID], [MaintenanceStartDate], [MaintenanceEndDate], [LUMaintenanceCode_MaintenanceCodeID]) VALUES (18, N'M0009     ', 7, 1, CAST(N'2021-02-05 00:00:00.000' AS DateTime), CAST(N'2021-02-17 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Maintenance] ([MaintenanceID], [MaintenanceTicketNumber], [Truck_TruckID], [LUMaintenanceType_MaintenanceTypeID], [MaintenanceStartDate], [MaintenanceEndDate], [LUMaintenanceCode_MaintenanceCodeID]) VALUES (20, N'M0010     ', 9, 4, CAST(N'2021-02-06 00:00:00.000' AS DateTime), CAST(N'2021-02-09 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Maintenance] ([MaintenanceID], [MaintenanceTicketNumber], [Truck_TruckID], [LUMaintenanceType_MaintenanceTypeID], [MaintenanceStartDate], [MaintenanceEndDate], [LUMaintenanceCode_MaintenanceCodeID]) VALUES (22, N'M0011     ', 1, 1, CAST(N'2021-03-29 00:00:00.000' AS DateTime), CAST(N'2021-04-01 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Maintenance] OFF
SET IDENTITY_INSERT [dbo].[Trailer] ON 

INSERT [dbo].[Trailer] ([TrailerID], [TrailerNumber], [TrailerDescription], [LUTrailerType_TrailerTypeID], [TrailerCapacityLbs], [TrailerMileage]) VALUES (2, N'T0500     ', N'Great Dane Everest', 4, 12000, 13048)
INSERT [dbo].[Trailer] ([TrailerID], [TrailerNumber], [TrailerDescription], [LUTrailerType_TrailerTypeID], [TrailerCapacityLbs], [TrailerMileage]) VALUES (3, N'T0501     ', N'Great Dane Alpine', 4, 18000, 5926)
INSERT [dbo].[Trailer] ([TrailerID], [TrailerNumber], [TrailerDescription], [LUTrailerType_TrailerTypeID], [TrailerCapacityLbs], [TrailerMileage]) VALUES (4, N'T0502     ', N'Great Dane Johnson ', 4, 23000, 48251)
INSERT [dbo].[Trailer] ([TrailerID], [TrailerNumber], [TrailerDescription], [LUTrailerType_TrailerTypeID], [TrailerCapacityLbs], [TrailerMileage]) VALUES (5, N'T0503     ', N'Great Dane Champion', 3, 34000, 8074)
INSERT [dbo].[Trailer] ([TrailerID], [TrailerNumber], [TrailerDescription], [LUTrailerType_TrailerTypeID], [TrailerCapacityLbs], [TrailerMileage]) VALUES (6, N'T0504     ', N'Great Dane Sahara', 3, 27000, 48521)
INSERT [dbo].[Trailer] ([TrailerID], [TrailerNumber], [TrailerDescription], [LUTrailerType_TrailerTypeID], [TrailerCapacityLbs], [TrailerMileage]) VALUES (7, N'T0505     ', N'Great Dane Freedom', 2, 26000, 8754)
INSERT [dbo].[Trailer] ([TrailerID], [TrailerNumber], [TrailerDescription], [LUTrailerType_TrailerTypeID], [TrailerCapacityLbs], [TrailerMileage]) VALUES (8, N'T0506     ', N'Great Dane Freedom', 2, 26000, 9875)
INSERT [dbo].[Trailer] ([TrailerID], [TrailerNumber], [TrailerDescription], [LUTrailerType_TrailerTypeID], [TrailerCapacityLbs], [TrailerMileage]) VALUES (9, N'T0507     ', N'Great Dane Freedom', 2, 26000, 14857)
INSERT [dbo].[Trailer] ([TrailerID], [TrailerNumber], [TrailerDescription], [LUTrailerType_TrailerTypeID], [TrailerCapacityLbs], [TrailerMileage]) VALUES (11, N'T0508     ', N'Great Dane Argosy', 1, 30000, 18754)
INSERT [dbo].[Trailer] ([TrailerID], [TrailerNumber], [TrailerDescription], [LUTrailerType_TrailerTypeID], [TrailerCapacityLbs], [TrailerMileage]) VALUES (12, N'T0509     ', N'Great Dane Argosy', 1, 30000, 19875)
SET IDENTITY_INSERT [dbo].[Trailer] OFF
SET IDENTITY_INSERT [dbo].[Truck] ON 

INSERT [dbo].[Truck] ([TruckID], [TruckNumber], [TruckLicenceNumber], [TruckMake], [TruckModel], [LUTruckType_TruckTypeID], [LUTruckBodyType_TruckBodyTypeID], [TruckEngineType], [TruckFuelType], [TruckMileage], [Trailer_TrailerID]) VALUES (1, N'T0253     ', 862123986, N'Freightliner', N'Cascadia Natural Gas', 1, 1, N'Cummins Westport ISX12 G', N'Natural Gas', 23842, 2)
INSERT [dbo].[Truck] ([TruckID], [TruckNumber], [TruckLicenceNumber], [TruckMake], [TruckModel], [LUTruckType_TruckTypeID], [LUTruckBodyType_TruckBodyTypeID], [TruckEngineType], [TruckFuelType], [TruckMileage], [Trailer_TrailerID]) VALUES (4, N'T0153     ', 865483657, N'Freightliner', N'eCascadia', 2, 2, N'Single Motor', N'Electric', 48356, NULL)
INSERT [dbo].[Truck] ([TruckID], [TruckNumber], [TruckLicenceNumber], [TruckMake], [TruckModel], [LUTruckType_TruckTypeID], [LUTruckBodyType_TruckBodyTypeID], [TruckEngineType], [TruckFuelType], [TruckMileage], [Trailer_TrailerID]) VALUES (5, N'T0208     ', 865842651, N'Freightliner', N'eCascadia', 2, 2, N'Dual Motor', N'Electric', 12004, NULL)
INSERT [dbo].[Truck] ([TruckID], [TruckNumber], [TruckLicenceNumber], [TruckMake], [TruckModel], [LUTruckType_TruckTypeID], [LUTruckBodyType_TruckBodyTypeID], [TruckEngineType], [TruckFuelType], [TruckMileage], [Trailer_TrailerID]) VALUES (6, N'T0198     ', 861542685, N'Freightliner', N'Cascadia Natural Gas', 1, 1, N'Cummins Westport ISX12 G', N'Natural Gas', 18754, 3)
INSERT [dbo].[Truck] ([TruckID], [TruckNumber], [TruckLicenceNumber], [TruckMake], [TruckModel], [LUTruckType_TruckTypeID], [LUTruckBodyType_TruckBodyTypeID], [TruckEngineType], [TruckFuelType], [TruckMileage], [Trailer_TrailerID]) VALUES (7, N'T0302     ', 867845128, N'Freightliner', N'Cascadia Natural Gas', 1, 1, N'Cummins Westport ISX12 G', N'Natural Gas', 7845, 4)
INSERT [dbo].[Truck] ([TruckID], [TruckNumber], [TruckLicenceNumber], [TruckMake], [TruckModel], [LUTruckType_TruckTypeID], [LUTruckBodyType_TruckBodyTypeID], [TruckEngineType], [TruckFuelType], [TruckMileage], [Trailer_TrailerID]) VALUES (9, N'T0102     ', 862154786, N'Freightliner', N'Cascadia Natural Gas', 1, 1, N'Cummins Westport ISX12 G', N'Natural Gas', 87451, 5)
INSERT [dbo].[Truck] ([TruckID], [TruckNumber], [TruckLicenceNumber], [TruckMake], [TruckModel], [LUTruckType_TruckTypeID], [LUTruckBodyType_TruckBodyTypeID], [TruckEngineType], [TruckFuelType], [TruckMileage], [Trailer_TrailerID]) VALUES (10, N'T0100     ', 864578569, N'Freightliner', N'eCascadia', 2, 2, N'Dual Motor', N'Electric', 14562, NULL)
INSERT [dbo].[Truck] ([TruckID], [TruckNumber], [TruckLicenceNumber], [TruckMake], [TruckModel], [LUTruckType_TruckTypeID], [LUTruckBodyType_TruckBodyTypeID], [TruckEngineType], [TruckFuelType], [TruckMileage], [Trailer_TrailerID]) VALUES (11, N'T0101     ', 865874512, N'Freightliner', N'eCascadia', 2, 2, N'Single Motor', N'Electric', 13258, NULL)
INSERT [dbo].[Truck] ([TruckID], [TruckNumber], [TruckLicenceNumber], [TruckMake], [TruckModel], [LUTruckType_TruckTypeID], [LUTruckBodyType_TruckBodyTypeID], [TruckEngineType], [TruckFuelType], [TruckMileage], [Trailer_TrailerID]) VALUES (12, N'T0103     ', 867888541, N'Freightliner', N'Cascadia Natural Gas', 1, 1, N'Cummins Westport ISX12 G', N'Natural Gas', 17985, 6)
INSERT [dbo].[Truck] ([TruckID], [TruckNumber], [TruckLicenceNumber], [TruckMake], [TruckModel], [LUTruckType_TruckTypeID], [LUTruckBodyType_TruckBodyTypeID], [TruckEngineType], [TruckFuelType], [TruckMileage], [Trailer_TrailerID]) VALUES (13, N'T0104     ', 867444852, N'Freightliner', N'Cascadia Natural Gas', 1, 1, N'Cummins Westport ISX12 G', N'Natural Gas', 6584, 11)
INSERT [dbo].[Truck] ([TruckID], [TruckNumber], [TruckLicenceNumber], [TruckMake], [TruckModel], [LUTruckType_TruckTypeID], [LUTruckBodyType_TruckBodyTypeID], [TruckEngineType], [TruckFuelType], [TruckMileage], [Trailer_TrailerID]) VALUES (14, N'T0105     ', 866547712, N'Freightliner', N'eCascadia', 2, 2, N'Dual Motor', N'Electric', 8745, NULL)
INSERT [dbo].[Truck] ([TruckID], [TruckNumber], [TruckLicenceNumber], [TruckMake], [TruckModel], [LUTruckType_TruckTypeID], [LUTruckBodyType_TruckBodyTypeID], [TruckEngineType], [TruckFuelType], [TruckMileage], [Trailer_TrailerID]) VALUES (15, N'T0106     ', 864552140, N'Freightliner', N'eCascadia', 2, 2, N'Dual Motor', N'Electric', 9384, NULL)
SET IDENTITY_INSERT [dbo].[Truck] OFF
/****** Object:  Index [IX_Driver]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Driver] ON [dbo].[Driver]
(
	[DriverEmployeeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HaulRecord]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_HaulRecord] ON [dbo].[HaulRecord]
(
	[HaulRecordNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LUCargoType]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LUCargoType] ON [dbo].[LUCargoType]
(
	[CargoTypeAbbreviation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LUCargoType_1]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LUCargoType_1] ON [dbo].[LUCargoType]
(
	[CargoTypeDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LUItem]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LUItem] ON [dbo].[LUItem]
(
	[ItemNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LUMaintenanceCode]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LUMaintenanceCode] ON [dbo].[LUMaintenanceCode]
(
	[MaintenanceCodeAbbreviation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LUMaintenanceCode_1]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LUMaintenanceCode_1] ON [dbo].[LUMaintenanceCode]
(
	[MaintenanceCodeDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LUMaintenanceType]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LUMaintenanceType] ON [dbo].[LUMaintenanceType]
(
	[MaintenanceTypeAbbreviation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LUMaintenanceType_1]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LUMaintenanceType_1] ON [dbo].[LUMaintenanceType]
(
	[MaintenanceTypeDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LUTrailerType]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LUTrailerType] ON [dbo].[LUTrailerType]
(
	[TrailerTypeAbbreviation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LUTrailerType_1]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LUTrailerType_1] ON [dbo].[LUTrailerType]
(
	[TrailerTypeDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LUTruckBodyType]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LUTruckBodyType] ON [dbo].[LUTruckBodyType]
(
	[TruckBodyTypeAbbreviation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LUTruckBodyType_1]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LUTruckBodyType_1] ON [dbo].[LUTruckBodyType]
(
	[TruckBodyTypeDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LUTruckType]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LUTruckType] ON [dbo].[LUTruckType]
(
	[TruckTypeAbbreviation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_LUTruckType_1]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LUTruckType_1] ON [dbo].[LUTruckType]
(
	[TruckTypeDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Maintenance]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Maintenance] ON [dbo].[Maintenance]
(
	[MaintenanceTicketNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Trailer]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Trailer] ON [dbo].[Trailer]
(
	[TrailerNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Truck]    Script Date: 12/17/2021 2:42:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Truck] ON [dbo].[Truck]
(
	[TruckNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HaulLineItem]  WITH CHECK ADD  CONSTRAINT [FK_HaulLineItem_HaulRecord] FOREIGN KEY([HaulRecord_HaulRecordID])
REFERENCES [dbo].[HaulRecord] ([HaulRecordID])
GO
ALTER TABLE [dbo].[HaulLineItem] CHECK CONSTRAINT [FK_HaulLineItem_HaulRecord]
GO
ALTER TABLE [dbo].[HaulLineItem]  WITH CHECK ADD  CONSTRAINT [FK_HaulLineItem_LUItem] FOREIGN KEY([LUItem_ItemID])
REFERENCES [dbo].[LUItem] ([ItemID])
GO
ALTER TABLE [dbo].[HaulLineItem] CHECK CONSTRAINT [FK_HaulLineItem_LUItem]
GO
ALTER TABLE [dbo].[HaulRecord]  WITH CHECK ADD  CONSTRAINT [FK_Haul_Truck] FOREIGN KEY([Truck_TruckID])
REFERENCES [dbo].[Truck] ([TruckID])
GO
ALTER TABLE [dbo].[HaulRecord] CHECK CONSTRAINT [FK_Haul_Truck]
GO
ALTER TABLE [dbo].[HaulRecord]  WITH CHECK ADD  CONSTRAINT [FK_HaulRecord_Driver] FOREIGN KEY([Driver_DriverID])
REFERENCES [dbo].[Driver] ([DriverID])
GO
ALTER TABLE [dbo].[HaulRecord] CHECK CONSTRAINT [FK_HaulRecord_Driver]
GO
ALTER TABLE [dbo].[HaulRecord]  WITH CHECK ADD  CONSTRAINT [FK_HaulRecord_LUCargoType] FOREIGN KEY([LUCargoType_CargoTypeID])
REFERENCES [dbo].[LUCargoType] ([CargoTypeID])
GO
ALTER TABLE [dbo].[HaulRecord] CHECK CONSTRAINT [FK_HaulRecord_LUCargoType]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_LUMaintenanceCode] FOREIGN KEY([LUMaintenanceCode_MaintenanceCodeID])
REFERENCES [dbo].[LUMaintenanceCode] ([MaintenanceCodeID])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_Maintenance_LUMaintenanceCode]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_LUMaintenanceType] FOREIGN KEY([LUMaintenanceType_MaintenanceTypeID])
REFERENCES [dbo].[LUMaintenanceType] ([MaintenanceTypeID])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_Maintenance_LUMaintenanceType]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [FK_Maintenance_Truck] FOREIGN KEY([Truck_TruckID])
REFERENCES [dbo].[Truck] ([TruckID])
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [FK_Maintenance_Truck]
GO
ALTER TABLE [dbo].[Trailer]  WITH CHECK ADD  CONSTRAINT [FK_Trailer_LUTrailerType] FOREIGN KEY([LUTrailerType_TrailerTypeID])
REFERENCES [dbo].[LUTrailerType] ([TrailerTypeID])
GO
ALTER TABLE [dbo].[Trailer] CHECK CONSTRAINT [FK_Trailer_LUTrailerType]
GO
ALTER TABLE [dbo].[Truck]  WITH CHECK ADD  CONSTRAINT [FK_Truck_LUTruckBodyType] FOREIGN KEY([LUTruckBodyType_TruckBodyTypeID])
REFERENCES [dbo].[LUTruckBodyType] ([TruckBodyTypeID])
GO
ALTER TABLE [dbo].[Truck] CHECK CONSTRAINT [FK_Truck_LUTruckBodyType]
GO
ALTER TABLE [dbo].[Truck]  WITH CHECK ADD  CONSTRAINT [FK_Truck_LUTruckType] FOREIGN KEY([LUTruckType_TruckTypeID])
REFERENCES [dbo].[LUTruckType] ([TruckTypeID])
GO
ALTER TABLE [dbo].[Truck] CHECK CONSTRAINT [FK_Truck_LUTruckType]
GO
ALTER TABLE [dbo].[Truck]  WITH CHECK ADD  CONSTRAINT [FK_Truck_Trailer] FOREIGN KEY([Trailer_TrailerID])
REFERENCES [dbo].[Trailer] ([TrailerID])
GO
ALTER TABLE [dbo].[Truck] CHECK CONSTRAINT [FK_Truck_Trailer]
GO
ALTER TABLE [dbo].[HaulRecord]  WITH CHECK ADD  CONSTRAINT [CK_HaulRecord] CHECK  (([HaulRecordDeliveryDate]>=[HaulRecordStartDate]))
GO
ALTER TABLE [dbo].[HaulRecord] CHECK CONSTRAINT [CK_HaulRecord]
GO
ALTER TABLE [dbo].[Maintenance]  WITH CHECK ADD  CONSTRAINT [CK_Maintenance] CHECK  (([MaintenanceEndDate]>=[MaintenanceStartDate]))
GO
ALTER TABLE [dbo].[Maintenance] CHECK CONSTRAINT [CK_Maintenance]
GO
ALTER TABLE [dbo].[Truck]  WITH CHECK ADD  CONSTRAINT [CK_Truck] CHECK  (([LUTruckBodyType_TruckBodyTypeID]<>'1' OR [Trailer_TrailerID] IS NOT NULL))
GO
ALTER TABLE [dbo].[Truck] CHECK CONSTRAINT [CK_Truck]
GO
/****** Object:  StoredProcedure [dbo].[DeleteDriverByEmployeeNumber]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteDriverByEmployeeNumber]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.Driver
Description: This stored procedure deletes a driver record using the driver's employee ID number.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteDriverByEmployeeNumber]

	(@DriverEmployeeNumber int) /* The variable is the driver's employee ID number. */

AS
BEGIN

DELETE FROM dbo.Driver /* Delete a record from the Driver table by entering the driver's employee ID number. */
	WHERE DriverEmployeeNumber = @DriverEmployeeNumber

END


GO
/****** Object:  StoredProcedure [dbo].[DeleteDriverByID]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteDriverByID]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.Driver
Description: This stored procedure deletes a driver record using the driver's automatically generated identity.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteDriverByID]

	(@DriverID int) /* The variable is the driver's automatically generated identity. */

AS
BEGIN

DELETE FROM dbo.Driver /* Delete a record from the Driver table by entering the driver's automatically generated identity. */
	WHERE DriverID = @DriverID

END


GO
/****** Object:  StoredProcedure [dbo].[DeleteDriverByInfo]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteDriverByInfo]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.Driver
Description: This stored procedure deletes a driver record using the driver's first name, last name, and date of birth.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteDriverByInfo]

	(@DriverFirstName nvarchar(50), /* The variables are the driver's first name, last name, and date of birth */
	@DriverLastName nvarchar(70),
	@DriverDOB datetime)

AS
BEGIN

DELETE FROM dbo.Driver /* Delete a record from the Driver table by entering the driver's first name, last name, and date of birth */
	WHERE DriverFirstName = @DriverFirstName
	AND DriverLastName = DriverLastName
	AND DriverDOB = @DriverDOB

END


GO
/****** Object:  StoredProcedure [dbo].[DeleteHaulLineItemByID]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteHaulLineItemByID]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.HaulLineItem
Description: This stored procedure deletes a record from the haul line item table using the line item's automatically generated identity.
********************************************************/


CREATE PROCEDURE [dbo].[DeleteHaulLineItemByID]

	(@HaulLineItemID int) /* The variable is the line item's automatically generated identity. */

AS
BEGIN

DELETE FROM dbo.HaulLineItem /* Delete a line item from the haul line item by entering its automatically generated identity. */
	WHERE HaulLineItemID = @HaulLineItemID

END




GO
/****** Object:  StoredProcedure [dbo].[DeleteHaulLineItemByInfo]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteHaulLineItemByInfo]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.HaulLineItem
Description: This stored procedure deletes a record from the haul line item table using the automatically generated identities of the item and haul record.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteHaulLineItemByInfo]

	(@HaulRecord_HaulRecordID int, /* The variables are the automatically generated identities of the item and haul record. */
	@LUItem_ItemID int)

AS
BEGIN

DELETE FROM dbo.HaulLineItem /* Delete a record from the haul line item table by entering the automatically generated identities of the item and haul record. */
	WHERE	LUItem_ItemID = @LUItem_ItemID
			AND HaulRecord_HaulRecordID = @HaulRecord_HaulRecordID

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteHaulRecordByID]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteHaulRecordByID]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.HaulRecord
Description: This stored procedure deletes a record from the haul record table using the haul record's automatically generated identity.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteHaulRecordByID]

	(@HaulRecordID int) /* The variable is the haul record's automatically generated identity. */

AS
BEGIN

DELETE FROM dbo.HaulRecord /* Delete a record from the haul record table by entering the haul record's automatically generated identity. */
	WHERE HaulRecordID = @HaulRecordID

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteHaulRecordByInfo]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteHaulRecordByInfo]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.HaulRecord
Description: This stored procedure deletes a record from the haul record table using the truck's automatically generated identity, client name, and delivery date.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteHaulRecordByInfo]

	(@Truck_TruckID int, /* The variables are the truck's automatically generated identity, client name, and delivery date. */
	@HaulRecordClient nvarchar(50),
	@HaulRecordDeliveryDate datetime)

AS
BEGIN

DELETE FROM dbo.HaulRecord /* Delete a record from the haul record table by entering the truck's automatically generated identity, client name, and delivery date. */
	WHERE Truck_TruckID = @Truck_TruckID
	AND HaulRecordClient = @HaulRecordClient
	AND HaulRecordDeliveryDate = @HaulRecordDeliveryDate

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteHaulRecordByNumber]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteHaulRecordByNumber]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.HaulRecord
Description: This stored procedure deletes a record from the haul record table using the haul record number.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteHaulRecordByNumber]

	(@HaulRecordNumber nchar(10)) /* The variable is the haul record number. */

AS
BEGIN

DELETE FROM dbo.HaulRecord /* Delete a record from the haul record table by entering the haul record number. */
	WHERE HaulRecordNumber = @HaulRecordNumber

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteLUCargoTypeByID]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteLUCargoTypeByID]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUCargoType
Description: This stored procedure deletes a record from the cargo type lookup table using the cargo type's automatically generated identity.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteLUCargoTypeByID]

	(@CargoTypeID int) /* The variable is the cargo type's automatically generated identity. */

AS
BEGIN

DELETE FROM dbo.LUCargoType /* Delete a record from the cargo type lookup table by entering the cargo type's automatically generated identity. */
	WHERE CargoTypeID = @CargoTypeID

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteLUCargoTypeByInfo]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteLUCargoTypeByInfo]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUCargoType
Description: This stored procedure deletes a record from the cargo type lookup table using the cargo type's description.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteLUCargoTypeByInfo]

	(@CargoTypeDescription nvarchar(50)) /* The variable is the cargo type's description. */

AS
BEGIN

DELETE FROM dbo.LUCargoType /* Deletes a record from the cargo type lookup table by entering the cargo type's description. */
	WHERE CargoTypeDescription = @CargoTypeDescription

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteLUItemByID]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteLUItemByID]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUItem
Description: This stored procedure deletes a record from the item lookup table using the item's automatically generated identity.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteLUItemByID]

	(@ItemID int) /* The variable is the item's automatically generated identity. */

AS
BEGIN

DELETE FROM dbo.LUItem /* Delete a record from the item lookup table by entering the item's automatically generated identity. */
	WHERE ItemID = @ItemID

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteLUItemByInfo]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteLUItemByInfo]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUItem
Description: This stored procedure deletes a record from the item lookup table using the item's make and model.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteLUItemByInfo]

	(@ItemMake nvarchar(25), /* The variables are the item's make and model. */
	@ItemModel nvarchar(30))

AS
BEGIN

DELETE FROM dbo.LUItem /* Delete a record from the item lookup table by entering the item's make and model. */
	WHERE ItemMake = @ItemMake
	AND ItemModel = @ItemModel

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteLUItemByNumber]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteLUItemByNumber]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUItem
Description: This stored procedure deletes a record from the item lookup table using the item number.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteLUItemByNumber]

	(@ItemNumber int) /* The variable is the item number. */

AS
BEGIN

DELETE FROM dbo.LUItem /* Delete a record from the item lookup table by entering the item number. */
	WHERE ItemNumber = @ItemNumber

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteLUMaintenanceCodeByID]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteLUMaintenanceCodeByID]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUMaintenanceCode
Description: This stored procedure deletes a record from the maintenance code lookup table using the maintenance code's automatically generated identity.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteLUMaintenanceCodeByID]

	(@MaintenanceCodeID int) /* The variable is the maintenance code's automatically generated identity. */

AS
BEGIN

DELETE FROM dbo.LUMaintenanceCode /* Delete a record from the maintenance code lookup table by entering the maintenance code's automatically generated identity. */
	WHERE MaintenanceCodeID = @MaintenanceCodeID

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteLUMaintenanceCodeByInfo]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteLUMaintenanceCodeByInfo]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUMaintenanceCode
Description: This stored procedure deletes a record from the maintenance code lookup table using the maintenance code's description.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteLUMaintenanceCodeByInfo]

	(@MaintenanceCodeDescription nvarchar(50)) /* The variable is the maintenance code's description. */

AS
BEGIN

DELETE FROM dbo.LUMaintenanceCode /* Delete a record from the maintenance code lookup table by entering the maintenance code's description. */
	WHERE MaintenanceCodeDescription = @MaintenanceCodeDescription

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteLUMaintenanceTypeByID]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteLUMaintenanceTypeByID]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUMaintenanceType
Description: This stored procedure deletes a record from the maintenance type lookup table using the maintenance type's automatically generated identity.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteLUMaintenanceTypeByID]

	(@MaintenanceTypeID int) /* The variable is the maintenance type's automatically generated identity. */

AS
BEGIN

DELETE FROM dbo.LUMaintenanceType /* Delete a record from the maintenance type lookup table by entering the maintenance type's automatically generated identity. */
	WHERE MaintenanceTypeID = @MaintenanceTypeID

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteLUMaintenanceTypeByInfo]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteLUMaintenanceTypeByInfo]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUMaintenanceType
Description: This stored procedure deletes a record from the maintenance type lookup table using the maintenance type's description.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteLUMaintenanceTypeByInfo]

	(@MaintenanceTypeDescription nvarchar(30)) /* The variable is the maintenance type's description. */

AS
BEGIN

DELETE FROM dbo.LUMaintenanceType /* Delete a record from the maintenance type lookup table by entering the maintenance type's description. */
	WHERE MaintenanceTypeDescription = @MaintenanceTypeDescription

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteLUTrailerTypeByID]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteLUTrailerTypeByID]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUTrailerType
Description: This stored procedure deletes a record from the trailer type lookup table using the trailer type's automatically generated identity.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteLUTrailerTypeByID]

	(@TrailerTypeID int) /* The variable is the trailer type's automatically generated identity. */

AS
BEGIN

DELETE FROM dbo.LUTrailerType /* Delete a record from the trailer type lookup table by entering the trailer type's automatically generated identity. */
	WHERE TrailerTypeID = @TrailerTypeID

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteLUTrailerTypeByInfo]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteLUTrailerTypeByInfo]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUTrailerType
Description: This stored procedure deletes a record from the trailer type lookup table using the trailer type's description.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteLUTrailerTypeByInfo]

	(@TrailerTypeDescription nvarchar(20)) /* The variable is the trailer type's description. */

AS
BEGIN

DELETE FROM dbo.LUTrailerType /* Delete a record from the trailer type lookup table by entering the trailer type's description. */
	WHERE TrailerTypeDescription = @TrailerTypeDescription

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteLUTruckBodyTypeByID]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteLUTruckBodyTypeByID]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUTruckBodyType
Description: This stored procedure deletes a record from the truck body type lookup table using the truck body type's automatically generated identity.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteLUTruckBodyTypeByID]

	(@TruckBodyTypeID int) /* The variable is the truck body type's automatically generated identity. */

AS
BEGIN

DELETE FROM dbo.LUTruckBodyType /* Delete a record from the truck body type lookup table by entering the truck body type's automatically generated identity. */
	WHERE TruckBodyTypeID = @TruckBodyTypeID

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteLUTruckBodyTypeByInfo]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteLUTruckBodyTypeByInfo]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUTruckBodyType
Description: This stored procedure deletes a record from the truck body type lookup table using the truck body type's description.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteLUTruckBodyTypeByInfo]

	(@TruckBodyTypeDescription nvarchar(25)) /* The variable is the truck body type's description. */

AS
BEGIN

DELETE FROM dbo.LUTruckBodyType /* Delete a record from the truck body type lookup table by entering the truck body type's description. */
	WHERE TruckBodyTypeDescription = @TruckBodyTypeDescription

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteLUTruckTypeByID]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteLUTruckTypeByID]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUTruckType
Description: This stored procedure deletes a record from the truck type lookup table using the truck type's automatically generated identity.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteLUTruckTypeByID]

	(@TruckTypeID int) /* The variable is the truck type's automatically generated identity. */

AS
BEGIN

DELETE FROM LUTruckType /* Delete deletes a record from the truck type lookup table by entering the truck type's automatically generated identity. */
	WHERE TruckTypeID = @TruckTypeID

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteLUTruckTypeByInfo]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteLUTruckTypeByInfo]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUTruckType
Description: This stored procedure deletes a record from the truck type lookup table using the truck type's description.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteLUTruckTypeByInfo]

	(@TruckTypeDescription nvarchar(20)) /* The variable is the truck type's description. */

AS
BEGIN

DELETE FROM LUTruckType /* Delete a record from the truck type lookup table by entering the truck type's description. */
	WHERE TruckTypeDescription = @TruckTypeDescription

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteMaintenanceByID]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteMaintenanceByID]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.Maintenance
Description: This stored procedure deletes a record from the maintenance table using the maintenance's automatically generated identity.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteMaintenanceByID]

	(@MaintenanceID int) /* The variable is the maintenance's automatically generated identity. */

AS
BEGIN

DELETE FROM dbo.Maintenance /* Delete a record from the maintenance table by entering the maintenance's automatically generated identity. */
	WHERE MaintenanceID = @MaintenanceID

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteMaintenanceByInfo]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteMaintenanceByInfo]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.Maintenance
Description: This stored procedure deletes a record from the maintenance table using the automatically generated identities of the truck and maintenance type
			 and the maintenance start date.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteMaintenanceByInfo]

	(@Truck_TruckID int,  /* The variables are the automatically generated identities of the truck and maintenance type and the maintenance start date. */
	@LUMaintenanceType_MaintenanceTypeID int,
	@MaintenanceStartDate datetime)
AS
BEGIN

DELETE FROM dbo.Maintenance /* Delete a record from the maintenance table by entering the automatically generated identities of the truck and maintenance type and the maintenance start date. */
	WHERE Truck_TruckID = @Truck_TruckID
	AND LUMaintenanceType_MaintenanceTypeID = @LUMaintenanceType_MaintenanceTypeID
	AND MaintenanceStartDate = @MaintenanceStartDate

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteMaintenanceByNumber]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteLUMaintenanceTypeByNumber]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUMaintenanceType
Description: This stored procedure deletes a record from the maintenance type lookup table using the maintenance ticket number.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteMaintenanceByNumber]

	(@MaintenanceTicketNumber nvarchar(10)) /* The variable is the maintenance ticket number. */

AS
BEGIN

DELETE FROM dbo.Maintenance /* Delete a record from the maintenance type lookup table by entering the maintenance ticket number. */
	WHERE MaintenanceTicketNumber = @MaintenanceTicketNumber

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteTrailerByID]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteTrailerByID]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.Trailer
Description: This stored procedure deletes a record from the trailer table using the trailer's automatically generated identity.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteTrailerByID]

	(@TrailerID int) /* The variable is the trailer's automatically generated identity. */

AS
BEGIN

DELETE FROM dbo.Trailer /* a record from the trailer table by entering the trailer's automatically generated identity. */
	WHERE TrailerID = @TrailerID

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteTrailerByNumber]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteTrailerByNumber]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.Trailer
Description: This stored procedure deletes a record from the trailer table using the trailer number.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteTrailerByNumber]

	(@TrailerNumber nvarchar(10)) /* The variable is the trailer number. */
AS
BEGIN

DELETE FROM dbo.Trailer /* Delete a record from the trailer table by entering the trailer number. */
	WHERE TrailerNumber = @TrailerNumber

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteTruckByID]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteTruckByID]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.Truck
Description: This stored procedure deletes a record from the truck table using the truck's automatically generated identity.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteTruckByID]

	(@TruckID int) /* The variable is the truck's automatically generated identity. */

AS
BEGIN

DELETE FROM dbo.Truck /* Delete a record from the truck table by entering the truck's automatically generated identity. */
	WHERE TruckID = @TruckID

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteTruckByLicense]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteTruckByLicense]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.Truck
Description: This stored procedure deletes a record from the truck table using the truck's license number.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteTruckByLicense]

	(@TruckLicenceNumber int) /* The variable is the truck's license number. */

AS
BEGIN

DELETE FROM dbo.Truck /* Delete a record from the truck table by entering the truck's license number. */
	WHERE TruckLicenceNumber = @TruckLicenceNumber

END



GO
/****** Object:  StoredProcedure [dbo].[DeleteTruckByNumber]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[DeleteTruckByNumber]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.Truck
Description: This stored procedure deletes a record from the truck table using the truck number.
********************************************************/

CREATE PROCEDURE [dbo].[DeleteTruckByNumber]

	(@TruckNumber nvarchar(10)) /* The variable is the truck number. */

AS
BEGIN

DELETE FROM dbo.Truck /* Delete a record from the truck table by entering the truck number. */
	WHERE TruckNumber = @TruckNumber

END



GO
/****** Object:  StoredProcedure [dbo].[InsertDriver]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[InsertDriver]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.Driver
Description: This stored procedure inserts a record into the driver table.
********************************************************/

CREATE PROCEDURE [dbo].[InsertDriver]

	(@DriverEmployeeNumber int,			-- The variables are the driver's employee number,
	@DriverFirstName nvarchar(50),		-- first name,
	@DriverLastName nvarchar(70),		-- last name,
	@DriverDOB datetime,				-- date of birth,
	@DriverHireDate datetime,			-- hire date,
	@DriverHasCommercialLicense bit)	-- and whether they have a commercial driver's license

AS
BEGIN

INSERT INTO dbo.Driver /* Insert a record into the driver table by entering values. */
		(DriverEmployeeNumber,
		DriverFirstName,
		DriverLastName,
		DriverDOB,
		DriverHireDate,
		DriverHasCommercialLicense)
	VALUES	(@DriverEmployeeNumber,
			@DriverFirstName,
			@DriverLastName,
			@DriverDOB,
			@DriverHireDate,
			@DriverHasCommercialLicense)

END

GO
/****** Object:  StoredProcedure [dbo].[InsertHaulLineItem]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[InsertHaulLineItem]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.HaulLineItem
Description: This stored procedure inserts a record into the haul line item table.
********************************************************/

CREATE PROCEDURE [dbo].[InsertHaulLineItem]

	(@LUItem_ItemID int,			-- The variables are the item's automatically generated identity (from the item lookup table),
	@ItemQuantity int,				-- the item quantity,
	@HaulRecord_HaulRecordID int)	-- and the haul record's automatically generated identity (from the haul record table).

AS
BEGIN

INSERT INTO dbo.HaulLineItem  /* Insert a record into the driver table by entering values. */
		(LUItem_ItemID,
		ItemQuantity,
		HaulRecord_HaulRecordID)
	VALUES	(@LUItem_ItemID,
			@ItemQuantity,
			@HaulRecord_HaulRecordID)

END

GO
/****** Object:  StoredProcedure [dbo].[InsertHaulRecord]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[InsertHaulRecord]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.HaulRecord
Description: This stored procedure inserts a record into the haul record table.
********************************************************/

CREATE PROCEDURE [dbo].[InsertHaulRecord]

		(@Truck_TruckID int,				-- The variables are the truck's automatically generated identity (from the truck table),
		@Driver_DriverID int,				-- the driver's automatically generated identity (from the driver table),
		@HaulRecordNumber nchar(10),		-- the haul record number (format H####),
		@HaulRecordClient nvarchar(50),		-- the client name,
		@LUCargoType_CargoTypeID int,		-- the cargo type's automatically generated identity (from the cargo type lookup table),
		@HaulRecordStartDate datetime,		-- the date the haul begins,
		@HaulRecordDeliveryDate datetime,	-- the delivery date,
		@HaulRecordNotes nvarchar(500),		-- notes related to the haul (see related MaintenanceNotesTrigger in haul record table),
		@HaulRecordMileage int)				-- and total miles traveled during the haul.

AS
BEGIN

INSERT INTO dbo.HaulRecord   /* Insert a record into the haul record table by entering values. */
		(Truck_TruckID,
		Driver_DriverID,
		HaulRecordNumber,
		HaulRecordClient,
		LUCargoType_CargoTypeID,
		HaulRecordStartDate,
		HaulRecordDeliveryDate,
		HaulRecordNotes,
		HaulRecordMileage)
	VALUES	(@Truck_TruckID,
			@Driver_DriverID,
			@HaulRecordNumber,
			@HaulRecordClient,
			@LUCargoType_CargoTypeID,
			@HaulRecordStartDate,
			@HaulRecordDeliveryDate,
			@HaulRecordNotes,
			@HaulRecordMileage)

END

GO
/****** Object:  StoredProcedure [dbo].[InsertLUCargoType]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[InsertLUCargoType]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUCargoType
Description: This stored procedure inserts a record into the cargo type lookup table.
			 The cargo type describes any special handling required.
********************************************************/

CREATE PROCEDURE [dbo].[InsertLUCargoType]

	(@CargoTypeAbbreviation nvarchar(3),	-- The variables are the cargo type abbreviation
	@CargoTypeDescription nvarchar(50))		-- and the cargo type description.

AS
BEGIN

INSERT INTO dbo.LUCargoType /* Insert a record into the cargo type lookup table by entering values. */
		(CargoTypeAbbreviation,
		CargoTypeDescription)
	VALUES	(@CargoTypeAbbreviation,
			@CargoTypeDescription)

END

GO
/****** Object:  StoredProcedure [dbo].[InsertLUItem]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[InsertLUItem]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUItem
Description: This stored procedure inserts a record into the item lookup table.
********************************************************/

CREATE PROCEDURE [dbo].[InsertLUItem]

	(@ItemNumber int,				-- The variables are the item number,
	@ItemMake nvarchar(25),			-- item make,
	@ItemModel nvarchar(30),		-- item model,
	@ItemDescription nvarchar(50),	-- item description,
	@ItemWeightPerUnitLbs int)		-- and item weight rounded up to the nearest pound.
AS
BEGIN

INSERT INTO dbo.LUItem /* Insert a record into the item lookup table by entering values. */
	(ItemNumber,
	ItemMake,
	ItemModel,
	ItemDescription,
	ItemWeightPerUnitLbs)
	VALUES	(@ItemNumber,
			@ItemMake,
			@ItemModel,
			@ItemDescription,
			@ItemWeightPerUnitLbs)

END

GO
/****** Object:  StoredProcedure [dbo].[InsertLUMaintenanceCode]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[InsertLUMaintenanceCode]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUMaintenanceCode
Description: This stored procedure inserts a record into the maintenance code lookup table.
			 The maintenance code describes the timing of the maintenance.
********************************************************/

CREATE PROCEDURE [dbo].[InsertLUMaintenanceCode]

	(@MaintenanceCodeAbbreviation nvarchar(3),	-- The variables are the maintenance code abbreviation
	@MaintenanceCodeDescription nvarchar(50))	-- and the maintenance code description.

AS
BEGIN

INSERT INTO dbo.LUMaintenanceCode /* Insert a record into the maintence code lookup table by entering values. */
		(MaintenanceCodeAbbreviation,
		MaintenanceCodeDescription)
	VALUES	(@MaintenanceCodeAbbreviation,
			@MaintenanceCodeDescription)

END

GO
/****** Object:  StoredProcedure [dbo].[InsertLUMaintenanceType]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[InsertLUMaintenanceType]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUMaintenanceType
Description: This stored procedure inserts a record into the maintenance type lookup table.
			 The maintenance type describes what part of the truck had maintenance done.
********************************************************/

CREATE PROCEDURE [dbo].[InsertLUMaintenanceType]

	(@MaintenanceTypeAbbreviation nvarchar(3),	-- The variables are the maintenance type abbreviation
	@MaintenanceTypeDescription nvarchar(30))	-- and the maintenance type description.

AS
BEGIN

INSERT INTO dbo.LUMaintenanceType /* Insert a record into the maintence type lookup table by entering values. */
		(MaintenanceTypeAbbreviation,
		MaintenanceTypeDescription)
	VALUES (@MaintenanceTypeAbbreviation,
			@MaintenanceTypeDescription)

END

GO
/****** Object:  StoredProcedure [dbo].[InsertLUTrailerType]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[InsertLUTrailerType]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUTrailerType
Description: This stored procedure inserts a record into the trailer type lookup table.
			 The trailer type describes the style of trailer.
********************************************************/

CREATE PROCEDURE [dbo].[InsertLUTrailerType]

	(@TrailerTypeAbbreviation nvarchar(3),	-- The variables are the trailer type abbreviation
	@TrailerTypeDescription nvarchar(20))	-- and the trailer type description.

AS
BEGIN

INSERT INTO dbo.LUTrailerType /* Insert a record into the trailer type lookup table by entering values. */
		(TrailerTypeAbbreviation,
		TrailerTypeDescription)
	VALUES	(@TrailerTypeAbbreviation,
			@TrailerTypeDescription)

END

GO
/****** Object:  StoredProcedure [dbo].[InsertLUTruckBodyType]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[InsertLUTruckBodyType]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUTruckBodyType
Description: This stored procedure inserts a record into the truck body type lookup table.
			 The truck body type describes whether the truck needs a separate trailer.
********************************************************/

CREATE PROCEDURE [dbo].[InsertLUTruckBodyType]

	(@TruckBodyTypeAbbreviation nvarchar(3),	-- The variables are the truck body type abbreviation
	@TruckBodyTypeDescription nvarchar(25))		-- and the truck body type description.

AS
BEGIN

INSERT INTO dbo.LUTruckBodyType  /* Insert a record into the truck body type lookup table by entering values. */
		(TruckBodyTypeAbbreviation,
		TruckBodyTypeDescription)
	VALUES	(@TruckBodyTypeAbbreviation,
			@TruckBodyTypeDescription)

END

GO
/****** Object:  StoredProcedure [dbo].[InsertLUTruckType]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[InsertLUTruckType]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.LUTruckType
Description: This stored procedure inserts a record into the truck type lookup table.
			 The truck type describes the distance the truck is designed to travel.
********************************************************/

CREATE PROCEDURE [dbo].[InsertLUTruckType]

	(@TruckTypeAbbreviation nvarchar(3),	-- The variables are the truck type abbreviation
	@TruckTypeDescription nvarchar(20))		-- and the truck type description.

AS
BEGIN

INSERT INTO dbo.LUTruckType /* Insert a record into the truck type lookup table by entering values. */
		(TruckTypeAbbreviation,
		TruckTypeDescription)
	VALUES	(@TruckTypeAbbreviation,
			@TruckTypeDescription)

END

GO
/****** Object:  StoredProcedure [dbo].[InsertMaintenance]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[InsertMaintenance]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.Maintenance
Description: This stored procedure inserts a record into the maintenance table.
********************************************************/

CREATE PROCEDURE [dbo].[InsertMaintenance]

	(@MaintenanceTicketNumber nvarchar(10),		-- The variables are the maintenance ticket number (format is M####),
	@Truck_TruckID int,							-- the truck's automatically generated identity (from the truck table),
	@LUMaintenanceType_MaintenanceTypeID int,	-- the maintenance type's automatically generated identity (from the maintenance type lookup table),
	@MaintenanceStartDate datetime,				-- the date the maintenance began or is schedule to begin,
	@MaintenanceEndDate datetime,				-- the date the maintenance was complete or is expected to complete,
	@LUMaintenanceCode_MaintenanceCodeID int)	-- the maintenance code's automatically generated identity (from the mainentance code lookup table).

AS
BEGIN

INSERT INTO dbo.Maintenance /* Insert a record into the maintenance table by entering values. */
		(MaintenanceTicketNumber,
		Truck_TruckID,
		LUMaintenanceType_MaintenanceTypeID,
		MaintenanceStartDate,
		MaintenanceEndDate,
		LUMaintenanceCode_MaintenanceCodeID)
	VALUES	(@MaintenanceTicketNumber,
			@Truck_TruckID,
			@LUMaintenanceType_MaintenanceTypeID,
			@MaintenanceStartDate,
			@MaintenanceEndDate,
			@LUMaintenanceCode_MaintenanceCodeID)

END

GO
/****** Object:  StoredProcedure [dbo].[InsertTrailer]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[InsertTrailer]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.Trailer
Description: This stored procedure inserts a record into the trailer table.
********************************************************/

CREATE PROCEDURE [dbo].[InsertTrailer]

	(@TrailerNumber nvarchar(10),		-- The variables are the trailer number (format is T####),
	@TrailerDescription nvarchar(100),	-- the trailer description (make and model),
	@LUTrailerType_TrailerTypeID int,	-- the trailer type's automatically generate identity (from the trailer type lookup table),
	@TrailerCapacityLbs int,			-- the trailer's capacity in pounds,
	@TrailerMileage int)				-- and the trailer's current mileage (You will spend the rest of your life constantly updating this. Sorry.).

AS
BEGIN

INSERT INTO dbo.Trailer  /* Insert a record into the trailer table by entering values. */
		(TrailerNumber,
		TrailerDescription,
		LUTrailerType_TrailerTypeID,
		TrailerCapacityLbs,
		TrailerMileage)
	VALUES	(@TrailerNumber,
			@TrailerDescription,
			@LUTrailerType_TrailerTypeID,
			@TrailerCapacityLbs,
			@TrailerMileage)

END

GO
/****** Object:  StoredProcedure [dbo].[InsertTruck]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[InsertTruck]
Create Date: 12/11/2021
Author: LV Marlowe
Affected Tables: dbo.Truck
Description: This stored procedure inserts a record into the truck table.
********************************************************/

CREATE PROCEDURE [dbo].[InsertTruck]

	(@TruckNumber nvarchar(10),				-- The variables are the truck number (format is T####),
	@TruckLicenceNumber int,				-- the truck's license number,
	@TruckMake nvarchar(30),				-- the truck make,
	@TruckModel nvarchar(30),				-- the truck model,
	@LUTruckType_TruckTypeID int,			-- the truck type's automatically generated identity (from the truck type lookup table),
	@LUTruckBodyType_TruckBodyTypeID int,	-- the truck body type's automatically generated identity (from the truck body type lookup table),
	@TruckEngineType nvarchar(50),			-- the truck's engine type,
	@TruckFuelType nvarchar(50),			-- what type of fuel the truck uses,
	@TruckMileage int,						-- the truck's current mileage  (You will spend the rest of your life constantly updating this. Sorry.),
	@Trailer_TrailerID int)					-- the associated trailer's automatically generated identity (from the trailer table).

AS
BEGIN

INSERT INTO dbo.Truck /* Insert a record into the truck table by entering values. */
		(TruckNumber,
		TruckLicenceNumber,
		TruckMake,
		TruckModel,
		LUTruckType_TruckTypeID,
		LUTruckBodyType_TruckBodyTypeID,
		TruckEngineType,
		TruckFuelType,
		TruckMileage,
		Trailer_TrailerID)
	VALUES (@TruckNumber, @TruckLicenceNumber, @TruckMake, @TruckModel, @LUTruckType_TruckTypeID, @LUTruckBodyType_TruckBodyTypeID, @TruckEngineType, @TruckFuelType, @TruckMileage, @Trailer_TrailerID)

END

GO
/****** Object:  StoredProcedure [dbo].[ReportHaulRecord]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[ReportHaulRecord]
Create Date: 12/11/2021
Author: LV Marlowe
Included Tables: dbo.HaulRecord, dbo.Truck, dbo.LUTruckType
Description: This stored procedure accepts a truck number and date range.
			 It returns the haul record of the truck in chronological order but does not include detailed inventory.
********************************************************/

CREATE PROCEDURE [dbo].[ReportHaulRecord]

	(@TruckNumber nvarchar(10),		-- The variables are the truck number (from the truck table),
	@DeliveryDateStart datetime,	-- the earliest delivery date the report should pull,	
	@DeliveryDateEnd datetime)		-- and the latest delivery date the report should pull.

AS
BEGIN

SELECT	T.TruckNumber AS [Truck Number],					-- The report should return columns for truck number (from the truck table),
		T.TruckMake AS [Truck Make],						-- truck make (from the truck table),
		T.TruckModel AS [Truck Model],						-- truck model (from the truck table),
		LUTT.TruckTypeDescription AS [Truck Type],			-- truck type description (from the truck type lookup table),
		HR.HaulRecordNumber AS [Haul Number],				-- haul record number (from the haul record table),
		HR.HaulRecordClient AS [Client],					-- haul record client name (from the haul record table),					
		HR.HaulRecordStartDate AS [Haul Start Date],		-- date the haul started (from the haul record table),
		HR.HaulRecordDeliveryDate AS [Haul Delivery Date],	-- date the haul was delivered (from the haul record table),
		HR.HaulRecordNotes AS [Haul Notes],					-- haul notes (from the haul record table),
		HR.HaulRecordMileage AS [Haul Mileage]				-- total miles traveled during the haul (from the haul record table).

	FROM dbo.HaulRecord AS HR	-- Start with the haul record table, abbreviated as HR.

		LEFT OUTER JOIN dbo.Truck AS T			-- Left outer join the truck table, abbreviated as T
			ON HR.Truck_TruckID = T.TruckID		-- by matching up the truck's automatically generated identity from both tables.

		LEFT OUTER JOIN dbo.LUTruckType AS LUTT				-- Left outer join the truck type lookup table, abbreviated as LUTT
			ON LUTT.TruckTypeID = T.LUTruckType_TruckTypeID	-- by matching up the truck type's automatically generated identity from both tables.

	WHERE	T.TruckNumber = @TruckNumber													-- Only pull records where the truck number matched the one entered
			AND HR.HaulRecordDeliveryDate BETWEEN @DeliveryDateStart AND @DeliveryDateEnd	-- and the date the haul was delivered falls within the date range entered. 
	
	ORDER BY	HR.HaulRecordDeliveryDate,	-- Order the results chronologically by the date the haul was delivered
				HR.HaulRecordStartDate		-- then the date the haul started.
END
GO
/****** Object:  StoredProcedure [dbo].[ReportHaulRecordInventory]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[ReportHaulRecordInventory]
Create Date: 12/11/2021
Author: LV Marlowe
Included Tables: dbo.HaulRecord, dbo.Truck, dbo.LUTruckType, dbo.LUItem, dbo.HaulLineItem
Description: This stored procedure accepts a truck number and date range.
			 It returns the haul record of the truck in chronological order and a detailed inventory.
********************************************************/

CREATE PROCEDURE [dbo].[ReportHaulRecordInventory]

	(@TruckNumber nvarchar(10),		-- The variables are the truck number (from the truck table),
	@DeliveryDateStart datetime,	-- the earliest delivery date the report should pull,	
	@DeliveryDateEnd datetime)		-- and the latest delivery date the report should pull.

AS
BEGIN

SELECT	T.TruckNumber AS [Truck Number],					-- The report should return columns for truck number (from the truck table),
		T.TruckMake AS [Truck Make],						-- truck make (from the truck table),
		T.TruckModel AS [Truck Model],						-- truck model (from the truck table),
		LUTT.TruckTypeDescription AS [Truck Type],			-- truck type description (from the truck type lookup table),
		HR.HaulRecordNumber AS [Haul Number],				-- haul record number (from the haul record table),
		HR.HaulRecordClient AS [Client],					-- haul record client name (from the haul record table),					
		HR.HaulRecordStartDate AS [Haul Start Date],		-- date the haul started (from the haul record table),
		HR.HaulRecordDeliveryDate AS [Haul Delivery Date],	-- date the haul was delivered (from the haul record table),
		HR.HaulRecordNotes AS [Haul Notes],					-- haul notes (from the haul record table),
		HR.HaulRecordMileage AS [Haul Mileage],				-- total miles traveled during the haul (from the haul record table),
		LUI.ItemNumber,										-- item number (from the item lookup table),
		LUI.ItemMake,										-- item make (from the item lookup table),
		LUI.ItemModel,										-- item model (from the item lookup table),
		LUI.ItemDescription,								-- item description (from the item lookup table),
		LUI.ItemWeightPerUnitLbs,							-- item weight rounded up to the nearest pound (from the item lookup table),
		HLI.ItemQuantity									-- item quantity (from the haul line item table).
	
	FROM dbo.HaulRecord AS HR	-- Start with the haul record table, abbreviated as HR.

		LEFT OUTER JOIN dbo.Truck AS T			-- Left outer join the truck table, abbreviated as T
			ON HR.Truck_TruckID = T.TruckID		-- by matching up the truck's automatically generated identity from both tables.

		LEFT OUTER JOIN dbo.LUTruckType AS LUTT				-- Left outer join the truck type lookup table, abbreviated as LUTT
			ON LUTT.TruckTypeID = T.LUTruckType_TruckTypeID	-- by matching up the truck type's automatically generated identity from both tables.

		LEFT OUTER JOIN dbo.HaulLineItem AS HLI					-- Left outer join the haul line item table, abbreviated as HLI
			ON HLI.HaulRecord_HaulRecordID = HR.HaulRecordID	-- by matching up the haul record's automatically generated identity from both tables.

		LEFT OUTER JOIN dbo.LUItem AS LUI		-- Left outer join the item lookup table, abbreviated as LUI
			ON HLI.LUItem_ItemID = LUI.ItemID	-- by matching up the item's automatically generated identity from both tables.

	WHERE	T.TruckNumber = @TruckNumber													-- Only pull records where the truck number matched the one entered
			AND HR.HaulRecordDeliveryDate BETWEEN @DeliveryDateStart AND @DeliveryDateEnd	-- and the date the haul was delivered falls within the date range entered. 
	
	ORDER BY	HR.HaulRecordDeliveryDate,	-- Order the results chronologically by the date the haul was delivered
				HR.HaulRecordStartDate		-- then the date the haul started.
END
GO
/****** Object:  StoredProcedure [dbo].[ReportHaulShipmentWeight]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[ReportHaulShipmentWeight]
Create Date: 12/11/2021
Author: LV Marlowe
Included Tables: dbo.HaulRecord, dbo.LUItem, dbo.HaulLineItem
Description: This stored procedure accepts a haul record's automatically generated identity.
			 It returns the haul number, client name, haul delivery date, and total shipment weight in pounds.
********************************************************/

CREATE PROCEDURE [dbo].[ReportHaulShipmentWeight]

	(@HaulRecordID int) /* The variable is the haul record's automatically generated identity. */

AS
BEGIN

SELECT	HR.HaulRecordNumber AS [Haul Number],								-- The report should return columns for haul record number (from the haul record table),
		HR.HaulRecordClient AS [Client],									-- client name (from the haul record table)
		HR.HaulRecordDeliveryDate AS [Delivery Date],						-- date the haul was delivered (from the haul record table),
		SUM (LUI.ItemWeightPerUnitLbs * ItemQuantity) AS [Shipment Weight]	-- result of multiplying the weight of each item in pounds by the respective item quantity and adding them all together.

	FROM dbo.HaulRecord AS HR	-- Start with the haul record table, abbreviated as HR.

		LEFT OUTER JOIN dbo.HaulLineItem AS HLI					-- Left outer join the haul line item table, abbreviated as HLI
			ON HLI.HaulRecord_HaulRecordID = HR.HaulRecordID	-- by matching up the haul record's automatically generated identity from both tables.

		LEFT OUTER JOIN dbo.LUItem AS LUI		-- Left outer join the item lookup table, abbreviated as LUI
			ON HLI.LUItem_ItemID = LUI.ItemID	-- by matching up the item's automatically generated identity from both tables.

	WHERE	HaulRecordID = @HaulRecordID	-- Only pull records where the haul record's automatically generated identity matches the one entered.

	GROUP BY	HR.HaulRecordNumber,		-- There should be a total shipment weight related to every haul record number returned (from the haul record table),
				HR.HaulRecordClient,		-- client name returned (from the haul record table),
				HR.HaulRecordDeliveryDate	-- and haul delivery date returned (from the haul record table).
END

GO
/****** Object:  StoredProcedure [dbo].[ReportMaintenance]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
Procedure: [dbo].[ReportMaintenance]
Create Date: 12/11/2021
Author: LV Marlowe
Included Tables: dbo.Maintenance, dbo.Truck, dbo.LUTruckType, dbo.LUMaintenanceType, dbo.LUMaintenanceCode
Description: This stored procedure accepts a date range.
			 It returns a report of all maintenance performed within the date range, with the truck numbers and maintenance details.
			 The report is ordered by long haul, short haul, and maintenance date.
********************************************************/

CREATE PROCEDURE [dbo].[ReportMaintenance]

	(@StartDate datetime,	-- The variables are the date the maintenence started or is scheduled to start
	@EndDate datetime)		-- and the date the maintenence completed or is expected to complete.

AS
BEGIN

SELECT	T.TruckNumber AS [Truck Number],						-- The report should return columns for truck number (from the truck table),
		T.TruckMake AS [Truck Make],							-- truck make (from the truck table),
		T.TruckModel AS [Truck Model],							-- truck model (from the truck table),
		LUTT.TruckTypeDescription AS [Truck Type],				-- truck type description (from the truck type lookup table),
		M.MaintenanceTicketNumber AS [Maintenance Ticket],		-- maintenance ticket number (from the maintenence table),
		M.MaintenanceStartDate AS [Start Date],					-- date the maintenence started or is scheduled to start (from the maintenence table),
		M.MaintenanceEndDate AS [End Date],						-- date the maintenence completed or is expected to complete (from the maintenence table),
		LUMT.MaintenanceTypeDescription AS [Maintenance Type],	-- description of the maintenance type (from the maintenance type lookup table),
		LUMC.MaintenanceCodeDescription AS [Maintenance Code]	-- description of the maintenance code (from the maintenance code lookup table),

	FROM dbo.Maintenance AS M	-- Start with the maintenance table, abbreviated as M.

		LEFT OUTER JOIN dbo.Truck AS T			-- Left outer join the truck table, abbreviated as T
			ON M.Truck_TruckID = T.TruckID		-- by matching up the truck's automatically generated identity from both tables.

		LEFT OUTER JOIN dbo.LUTruckType AS LUTT				-- Left outer join the truck type lookup table, abbreviated as LUTT
			ON LUTT.TruckTypeID = T.LUTruckType_TruckTypeID	-- by matching up the truck type's automatically generated identity from both tables.

		LEFT OUTER JOIN dbo.LUMaintenanceType AS LUMT							-- Left outer join the maintenance type lookup table, abbreviated as LUMT
			ON M.LUMaintenanceType_MaintenanceTypeID = LUMT.MaintenanceTypeID	-- by matching up the maintenance type's automatically generated identity from both tables.

		LEFT OUTER JOIN dbo.LUMaintenanceCode AS LUMC							-- Left outer join the maintenance code lookup table, abbreviated as LUMC
			ON M.LUMaintenanceCode_MaintenanceCodeID = LUMC.MaintenanceCodeID	-- by matching up the maintenance code's automatically generated identity from both tables.


	WHERE	M.MaintenanceStartDate BETWEEN @StartDate AND @EndDate	-- Only pull records where the date the maintenance started or is scheduled to start falls within the date range entered.
	
	ORDER BY	LUTT.TruckTypeID,		-- Order the results by the truck type's automatically generated identity,
				M.MaintenanceStartDate,	-- then the date the maintenance started or is scheduled to start,
				M.MaintenanceEndDate	-- and then the date the maintenance completed or is expected to complete.
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateDriverHasCommercialLicense]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/********************************************************
Procedure: [dbo].[UpdateDriverHasCommercialLicense]
Create Date: 12/16/2021
Author: LV Marlowe
Affected Tables: dbo.Driver
Description: This stored procedure updates a driver's commercial driver's license status using the driver's automatically generated identity.
********************************************************/

CREATE PROCEDURE [dbo].[UpdateDriverHasCommercialLicense]

	(@DriverID int,						/* The variables are the driver's automatically generated identity */
	@DriverHasCommercialLicense bit)	/* and the commercial license status. */

AS
BEGIN

UPDATE dbo.Driver													/* Using the driver table, */
	SET DriverHasCommercialLicense = @DriverHasCommercialLicense	/* change the driver's commercial driver's license status (format is 1 for yes and 0 for no) */
		WHERE DriverID = @DriverID									/* for the driver with this automatically generated identity. */

END



GO
/****** Object:  StoredProcedure [dbo].[UpdateHaulRecordDates]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/********************************************************
Procedure: [dbo].[UpdateHaulRecordDates]
Create Date: 12/16/2021
Author: LV Marlowe
Affected Tables: dbo.HaulRecord
Description: This stored procedure updates the start and delivery dates using the haul record's automatically generated identity.
********************************************************/

CREATE PROCEDURE [dbo].[UpdateHaulRecordDates]

	(@HaulRecordID int,					/* The variables are the haul record's automatically generated identity, */
	@HaulRecordStartDate datetime,		/* haul start date, */
	@HaulRecordDeliveryDate datetime)	/* and delivery date. */

AS
BEGIN

UPDATE dbo.HaulRecord										/* Using the haul record table, */
	SET	HaulRecordStartDate = @HaulRecordStartDate,			/* change the haul start date */
		HaulRecordDeliveryDate = @HaulRecordDeliveryDate	/* and delivery date */	
		WHERE HaulRecordID = @HaulRecordID					/* for the haul record with this automatically generated identity. */

END




GO
/****** Object:  StoredProcedure [dbo].[UpdateTrailerMileage]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/********************************************************
Procedure: [dbo].[UpdateTrailerMileage]
Create Date: 12/16/2021
Author: LV Marlowe
Affected Tables: dbo.Trailer
Description: This stored procedure updates a trailer's mileage using the trailes's automatically generated identity.
			 Didn't I warn you that you'd be using this a lot?
********************************************************/

CREATE PROCEDURE [dbo].[UpdateTrailerMileage]

	(@TrailerID int,		/* The variables are the trailer's automatically generated identity */
	@TrailerMileage int)	/* and the trailer's mileage. */

AS
BEGIN

UPDATE dbo.Trailer							/* Using the trailer table, */
	SET TrailerMileage = @TrailerMileage	/* change the trailer's mileage */
		WHERE TrailerID = @TrailerID		/* for the trailer with this automatically generated identity. */

END




GO
/****** Object:  StoredProcedure [dbo].[UpdateTruckMileage]    Script Date: 12/17/2021 2:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/********************************************************
Procedure: [dbo].[UpdateTruckMileage]
Create Date: 12/16/2021
Author: LV Marlowe
Affected Tables: dbo.Truck
Description: This stored procedure updates a truck's mileage using the truck's automatically generated identity.
			 Didn't I warn you that you'd be using this a lot?
********************************************************/

CREATE PROCEDURE [dbo].[UpdateTruckMileage]

	(@TruckID int,		/* The variables are the truck's automatically generated identity */
	@TruckMileage int)	/* and the truck's mileage. */

AS
BEGIN

UPDATE dbo.Truck						/* Using the truck table, */
	SET TruckMileage = @TruckMileage	/* change the truck's mileage */
		WHERE TruckID = @TruckID		/* for the truck with this automatically generated identity. */

END





GO
USE [master]
GO
ALTER DATABASE [XYZTruckingDatabase] SET  READ_WRITE 
GO
