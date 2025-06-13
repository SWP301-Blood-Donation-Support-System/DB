USE [master]
GO
/****** Object:  Database [BloodDonationDB]    Script Date: 6/10/2025 2:39:19 PM ******/
CREATE DATABASE [BloodDonationDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BloodDonationDB', FILENAME = N'D:\Database\BloodDonationDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BloodDonationDB_log', FILENAME = N'D:\Database\BloodDonationDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BloodDonationDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BloodDonationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BloodDonationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BloodDonationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BloodDonationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BloodDonationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BloodDonationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BloodDonationDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BloodDonationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BloodDonationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BloodDonationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BloodDonationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BloodDonationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BloodDonationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BloodDonationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BloodDonationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BloodDonationDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BloodDonationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BloodDonationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BloodDonationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BloodDonationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BloodDonationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BloodDonationDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BloodDonationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BloodDonationDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BloodDonationDB] SET  MULTI_USER 
GO
ALTER DATABASE [BloodDonationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BloodDonationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BloodDonationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BloodDonationDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BloodDonationDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BloodDonationDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BloodDonationDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [BloodDonationDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BloodDonationDB]
GO
/****** Object:  Table [dbo].[AppointmentStatus]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentStatus](
	[AppointmentStatusID] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentStatusName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorUserID] [int] NOT NULL,
	[ArticleCategoryID] [int] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Picture] [nvarchar](255) NULL,
	[ArticleStatus] [int] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Article__9C6270C80D28A1AF] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleCategory]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleCategory](
	[ArticleCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticleCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleStatus]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleStatus](
	[ArticleStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticleStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodComponent]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodComponent](
	[ComponentID] [int] IDENTITY(1,1) NOT NULL,
	[ComponentName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ComponentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodRequest]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodRequest](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[RequestingStaffID] [int] NOT NULL,
	[BloodTypeID] [int] NOT NULL,
	[BloodComponentID] [int] NULL,
	[Quantity] [decimal](6, 2) NOT NULL,
	[RequestDateTime] [datetime2](7) NULL,
	[RequiredDateTime] [datetime2](7) NULL,
	[RequestStatusID] [int] NULL,
	[UrgencyID] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodRequestStatus]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodRequestStatus](
	[BloodRequestStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BloodRequestStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodTestResult]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodTestResult](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[ResultName] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodType]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodType](
	[BloodTypeID] [int] IDENTITY(1,1) NOT NULL,
	[BloodTypeName] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BloodTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodUnit]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodUnit](
	[BloodUnitID] [int] IDENTITY(1,1) NOT NULL,
	[DonationRecordID] [int] NOT NULL,
	[BloodTypeID] [int] NOT NULL,
	[ComponentID] [int] NULL,
	[CollectedDateTime] [datetime2](7) NULL,
	[ExpiryDateTime] [datetime2](7) NULL,
	[Volume] [decimal](6, 2) NULL,
	[BloodUnitStatusID] [int] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[BloodUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodUnitStatus]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodUnitStatus](
	[BloodUnitStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BloodUnitStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonationAppointment]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonationAppointment](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[DonorID] [int] NOT NULL,
	[ScheduledDateTime] [datetime2](7) NOT NULL,
	[TimeSlotID] [int] NULL,
	[DonationTypeID] [int] NULL,
	[QRCode] [nvarchar](255) NULL,
	[AppointmentStatusID] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonationAvailability]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonationAvailability](
	[AvailabilityID] [int] IDENTITY(1,1) NOT NULL,
	[AvailabilityName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AvailabilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonationRecord]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonationRecord](
	[DonationRecordID] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentID] [int] NOT NULL,
	[DonorID] [int] NOT NULL,
	[ProcessingStaffID] [int] NULL,
	[DonationDateTime] [datetime2](7) NOT NULL,
	[DonorWeight] [decimal](5, 2) NULL,
	[BloodTemperature] [decimal](4, 2) NULL,
	[BloodPressure] [nvarchar](20) NULL,
	[DonationTypeID] [int] NULL,
	[VolumeExtracted] [decimal](6, 2) NULL,
	[Note] [nvarchar](max) NULL,
	[BloodTestResult] [int] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Donation__26D61356D0EE92FB] PRIMARY KEY CLUSTERED 
(
	[DonationRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonationType]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonationType](
	[DonationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DonationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[GenderName] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[RecipientID] [int] NOT NULL,
	[NotificationTypeID] [int] NOT NULL,
	[Subject] [nvarchar](200) NULL,
	[Message] [nvarchar](max) NULL,
	[SentDateTime] [datetime2](7) NULL,
	[IsRead] [bit] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationType]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationType](
	[NotificationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Occupation]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occupation](
	[OccupationID] [int] IDENTITY(1,1) NOT NULL,
	[OccupationName] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OccupationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[SlotID] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urgency]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urgency](
	[UrgencyID] [int] IDENTITY(1,1) NOT NULL,
	[UrgencyName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UrgencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/10/2025 2:39:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[FullName] [nvarchar](100) NULL,
	[RoleID] [int] NOT NULL,
	[StaffCode] [nvarchar](50) NULL,
	[NationalID] [nvarchar](20) NULL,
	[Address] [nvarchar](255) NULL,
	[GenderID] [int] NULL,
	[OccupationID] [int] NULL,
	[BloodTypeID] [int] NULL,
	[LastDonationDate] [datetime2](7) NULL,
	[NextEligibleDonationDate] [datetime2](7) NULL,
	[DonationCount] [int] NULL,
	[DonationAvailability] [int] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UpdatedBy] [int] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AppointmentStatus] ON 

INSERT [dbo].[AppointmentStatus] ([AppointmentStatusID], [AppointmentStatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (1, N'Scheduled', N'Appointment is scheduled', CAST(N'2025-06-10T14:26:56.5100000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[AppointmentStatus] ([AppointmentStatusID], [AppointmentStatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (2, N'Confirmed', N'Appointment is confirmed', CAST(N'2025-06-10T14:26:56.5100000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[AppointmentStatus] ([AppointmentStatusID], [AppointmentStatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (3, N'Completed', N'Appointment is completed', CAST(N'2025-06-10T14:26:56.5100000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[AppointmentStatus] ([AppointmentStatusID], [AppointmentStatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (4, N'Cancelled', N'Appointment is cancelled', CAST(N'2025-06-10T14:26:56.5100000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[AppointmentStatus] ([AppointmentStatusID], [AppointmentStatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (5, N'No Show', N'Donor did not show up', CAST(N'2025-06-10T14:26:56.5100000' AS DateTime2), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[AppointmentStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[ArticleCategory] ON 

INSERT [dbo].[ArticleCategory] ([ArticleCategoryID], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (1, N'Health Tips', N'Articles about health and wellness', CAST(N'2025-06-10T14:26:56.5000000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[ArticleCategory] ([ArticleCategoryID], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (2, N'Blood Donation', N'Information about blood donation process', CAST(N'2025-06-10T14:26:56.5000000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[ArticleCategory] ([ArticleCategoryID], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (3, N'Medical News', N'Latest medical news and updates', CAST(N'2025-06-10T14:26:56.5000000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[ArticleCategory] ([ArticleCategoryID], [CategoryName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (4, N'Research', N'Medical research articles', CAST(N'2025-06-10T14:26:56.5000000' AS DateTime2), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[ArticleCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ArticleStatus] ON 

INSERT [dbo].[ArticleStatus] ([ArticleStatusID], [StatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (1, N'Draft', N'Article is in draft status', CAST(N'2025-06-10T14:26:56.5033333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[ArticleStatus] ([ArticleStatusID], [StatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (2, N'Published', N'Article is published and visible', CAST(N'2025-06-10T14:26:56.5033333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[ArticleStatus] ([ArticleStatusID], [StatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (3, N'Archived', N'Article is archived', CAST(N'2025-06-10T14:26:56.5033333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[ArticleStatus] ([ArticleStatusID], [StatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (4, N'Under Review', N'Article is under review', CAST(N'2025-06-10T14:26:56.5033333' AS DateTime2), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[ArticleStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[BloodComponent] ON 

INSERT [dbo].[BloodComponent] ([ComponentID], [ComponentName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (1, N'Whole Blood', N'Complete blood with all components', CAST(N'2025-06-10T14:26:56.4900000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodComponent] ([ComponentID], [ComponentName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (2, N'Red Blood Cells', N'Packed red blood cells', CAST(N'2025-06-10T14:26:56.4900000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodComponent] ([ComponentID], [ComponentName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (3, N'Plasma', N'Blood plasma component', CAST(N'2025-06-10T14:26:56.4900000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodComponent] ([ComponentID], [ComponentName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (4, N'Platelets', N'Platelet concentrate', CAST(N'2025-06-10T14:26:56.4900000' AS DateTime2), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[BloodComponent] OFF
GO
SET IDENTITY_INSERT [dbo].[BloodRequestStatus] ON 

INSERT [dbo].[BloodRequestStatus] ([BloodRequestStatusID], [StatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (1, N'Pending', N'Request is pending', CAST(N'2025-06-10T14:26:56.5166667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodRequestStatus] ([BloodRequestStatusID], [StatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (2, N'Approved', N'Request is approved', CAST(N'2025-06-10T14:26:56.5166667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodRequestStatus] ([BloodRequestStatusID], [StatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (3, N'Fulfilled', N'Request is fulfilled', CAST(N'2025-06-10T14:26:56.5166667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodRequestStatus] ([BloodRequestStatusID], [StatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (4, N'Rejected', N'Request is rejected', CAST(N'2025-06-10T14:26:56.5166667' AS DateTime2), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[BloodRequestStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[BloodType] ON 

INSERT [dbo].[BloodType] ([BloodTypeID], [BloodTypeName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (1, N'A+', N'Blood type A positive', CAST(N'2025-06-10T14:26:56.4866667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodType] ([BloodTypeID], [BloodTypeName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (2, N'A-', N'Blood type A negative', CAST(N'2025-06-10T14:26:56.4866667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodType] ([BloodTypeID], [BloodTypeName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (3, N'B+', N'Blood type B positive', CAST(N'2025-06-10T14:26:56.4866667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodType] ([BloodTypeID], [BloodTypeName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (4, N'B-', N'Blood type B negative', CAST(N'2025-06-10T14:26:56.4866667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodType] ([BloodTypeID], [BloodTypeName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (5, N'AB+', N'Blood type AB positive', CAST(N'2025-06-10T14:26:56.4866667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodType] ([BloodTypeID], [BloodTypeName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (6, N'AB-', N'Blood type AB negative', CAST(N'2025-06-10T14:26:56.4866667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodType] ([BloodTypeID], [BloodTypeName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (7, N'O+', N'Blood type O positive', CAST(N'2025-06-10T14:26:56.4866667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodType] ([BloodTypeID], [BloodTypeName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (8, N'O-', N'Blood type O negative', CAST(N'2025-06-10T14:26:56.4866667' AS DateTime2), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[BloodType] OFF
GO
SET IDENTITY_INSERT [dbo].[BloodUnitStatus] ON 

INSERT [dbo].[BloodUnitStatus] ([BloodUnitStatusID], [StatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (1, N'Available', N'Blood unit is available for use', CAST(N'2025-06-10T14:26:56.5200000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodUnitStatus] ([BloodUnitStatusID], [StatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (2, N'Reserved', N'Blood unit is reserved', CAST(N'2025-06-10T14:26:56.5200000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodUnitStatus] ([BloodUnitStatusID], [StatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (3, N'Used', N'Blood unit has been used', CAST(N'2025-06-10T14:26:56.5200000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodUnitStatus] ([BloodUnitStatusID], [StatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (4, N'Expired', N'Blood unit has expired', CAST(N'2025-06-10T14:26:56.5200000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[BloodUnitStatus] ([BloodUnitStatusID], [StatusName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (5, N'Contaminated', N'Blood unit is contaminated', CAST(N'2025-06-10T14:26:56.5200000' AS DateTime2), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[BloodUnitStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[DonationAvailability] ON 

INSERT [dbo].[DonationAvailability] ([AvailabilityID], [AvailabilityName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (1, N'Available', N'Donor is available for donation', CAST(N'2025-06-10T14:26:56.4800000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[DonationAvailability] ([AvailabilityID], [AvailabilityName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (2, N'Not Available', N'Donor is not available', CAST(N'2025-06-10T14:26:56.4800000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[DonationAvailability] ([AvailabilityID], [AvailabilityName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (3, N'Temporarily Unavailable', N'Donor is temporarily unavailable', CAST(N'2025-06-10T14:26:56.4800000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[DonationAvailability] ([AvailabilityID], [AvailabilityName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (4, N'Medical Hold', N'Donor on medical hold', CAST(N'2025-06-10T14:26:56.4800000' AS DateTime2), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[DonationAvailability] OFF
GO
SET IDENTITY_INSERT [dbo].[DonationType] ON 

INSERT [dbo].[DonationType] ([DonationTypeID], [TypeName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (1, N'Whole Blood', N'Standard whole blood donation', CAST(N'2025-06-10T14:26:56.4800000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[DonationType] ([DonationTypeID], [TypeName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (2, N'Plasma', N'Plasma donation only', CAST(N'2025-06-10T14:26:56.4800000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[DonationType] ([DonationTypeID], [TypeName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (3, N'Platelets', N'Platelet donation only', CAST(N'2025-06-10T14:26:56.4800000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[DonationType] ([DonationTypeID], [TypeName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (4, N'Double Red Cells', N'Double red cell donation', CAST(N'2025-06-10T14:26:56.4800000' AS DateTime2), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[DonationType] OFF
GO
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([GenderID], [GenderName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (1, N'Male', CAST(N'2025-06-10T14:26:56.4666667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Gender] ([GenderID], [GenderName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (2, N'Female', CAST(N'2025-06-10T14:26:56.4666667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Gender] ([GenderID], [GenderName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (3, N'Other', CAST(N'2025-06-10T14:26:56.4666667' AS DateTime2), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Gender] OFF
GO
SET IDENTITY_INSERT [dbo].[NotificationType] ON 

INSERT [dbo].[NotificationType] ([NotificationTypeID], [TypeName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (1, N'Appointment Reminder', N'Reminder for upcoming donation appointment', CAST(N'2025-06-10T14:26:56.4933333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[NotificationType] ([NotificationTypeID], [TypeName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (2, N'Blood Request', N'Notification about blood request', CAST(N'2025-06-10T14:26:56.4933333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[NotificationType] ([NotificationTypeID], [TypeName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (3, N'System Alert', N'General system notifications', CAST(N'2025-06-10T14:26:56.4933333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[NotificationType] ([NotificationTypeID], [TypeName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (4, N'Article Update', N'Notification about new articles', CAST(N'2025-06-10T14:26:56.4933333' AS DateTime2), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[NotificationType] OFF
GO
SET IDENTITY_INSERT [dbo].[Occupation] ON 

INSERT [dbo].[Occupation] ([OccupationID], [OccupationName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (1, N'Student', CAST(N'2025-06-10T14:26:56.4733333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Occupation] ([OccupationID], [OccupationName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (2, N'Teacher', CAST(N'2025-06-10T14:26:56.4733333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Occupation] ([OccupationID], [OccupationName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (3, N'Engineer', CAST(N'2025-06-10T14:26:56.4733333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Occupation] ([OccupationID], [OccupationName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (4, N'Doctor', CAST(N'2025-06-10T14:26:56.4733333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Occupation] ([OccupationID], [OccupationName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (5, N'Nurse', CAST(N'2025-06-10T14:26:56.4733333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Occupation] ([OccupationID], [OccupationName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (6, N'Business', CAST(N'2025-06-10T14:26:56.4733333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Occupation] ([OccupationID], [OccupationName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (7, N'Government', CAST(N'2025-06-10T14:26:56.4733333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Occupation] ([OccupationID], [OccupationName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (8, N'Retired', CAST(N'2025-06-10T14:26:56.4733333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Occupation] ([OccupationID], [OccupationName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (9, N'Unemployed', CAST(N'2025-06-10T14:26:56.4733333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Occupation] ([OccupationID], [OccupationName], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (10, N'Other', CAST(N'2025-06-10T14:26:56.4733333' AS DateTime2), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Occupation] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (1, N'Admin', N'System Administrator', CAST(N'2025-06-10T14:26:56.4700000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (2, N'Staff', N'Medical Staff', CAST(N'2025-06-10T14:26:56.4700000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (3, N'Donor', N'Blood Donor', CAST(N'2025-06-10T14:26:56.4700000' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (4, N'Doctor', N'Medical Doctor', CAST(N'2025-06-10T14:26:56.4700000' AS DateTime2), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[TimeSlot] ON 

INSERT [dbo].[TimeSlot] ([SlotID], [StartTime], [EndTime], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (1, CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), CAST(N'2025-06-10T14:26:56.5066667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[TimeSlot] ([SlotID], [StartTime], [EndTime], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (2, CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'2025-06-10T14:26:56.5066667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[TimeSlot] ([SlotID], [StartTime], [EndTime], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (3, CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), CAST(N'2025-06-10T14:26:56.5066667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[TimeSlot] ([SlotID], [StartTime], [EndTime], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (4, CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'2025-06-10T14:26:56.5066667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[TimeSlot] ([SlotID], [StartTime], [EndTime], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (5, CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), CAST(N'2025-06-10T14:26:56.5066667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[TimeSlot] ([SlotID], [StartTime], [EndTime], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (6, CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), CAST(N'2025-06-10T14:26:56.5066667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[TimeSlot] ([SlotID], [StartTime], [EndTime], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (7, CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), CAST(N'2025-06-10T14:26:56.5066667' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[TimeSlot] ([SlotID], [StartTime], [EndTime], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (8, CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), CAST(N'2025-06-10T14:26:56.5066667' AS DateTime2), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[TimeSlot] OFF
GO
SET IDENTITY_INSERT [dbo].[Urgency] ON 

INSERT [dbo].[Urgency] ([UrgencyID], [UrgencyName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (1, N'Low', N'Non-urgent request', CAST(N'2025-06-10T14:26:56.5133333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Urgency] ([UrgencyID], [UrgencyName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (2, N'Medium', N'Moderately urgent', CAST(N'2025-06-10T14:26:56.5133333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Urgency] ([UrgencyID], [UrgencyName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (3, N'High', N'High priority', CAST(N'2025-06-10T14:26:56.5133333' AS DateTime2), NULL, NULL, NULL, 0)
INSERT [dbo].[Urgency] ([UrgencyID], [UrgencyName], [Description], [CreatedAt], [UpdatedAt], [CreatedBy], [UpdatedBy], [IsDeleted]) VALUES (4, N'Critical', N'Emergency - immediate attention required', CAST(N'2025-06-10T14:26:56.5133333' AS DateTime2), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Urgency] OFF
GO
/****** Object:  Index [IX_Article_AuthorUserID]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_Article_AuthorUserID] ON [dbo].[Article]
(
	[AuthorUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Article_CategoryID]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_Article_CategoryID] ON [dbo].[Article]
(
	[ArticleCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BloodRequest_BloodTypeID]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_BloodRequest_BloodTypeID] ON [dbo].[BloodRequest]
(
	[BloodTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BloodRequest_RequestingStaffID]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_BloodRequest_RequestingStaffID] ON [dbo].[BloodRequest]
(
	[RequestingStaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__BloodTyp__3323606B1C9D5E80]    Script Date: 6/10/2025 2:39:20 PM ******/
ALTER TABLE [dbo].[BloodType] ADD UNIQUE NONCLUSTERED 
(
	[BloodTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BloodUnit_BloodTypeID]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_BloodUnit_BloodTypeID] ON [dbo].[BloodUnit]
(
	[BloodTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BloodUnit_DonationRecordID]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_BloodUnit_DonationRecordID] ON [dbo].[BloodUnit]
(
	[DonationRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BloodUnit_ExpiryDateTime]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_BloodUnit_ExpiryDateTime] ON [dbo].[BloodUnit]
(
	[ExpiryDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DonationAppointment_DonorID]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_DonationAppointment_DonorID] ON [dbo].[DonationAppointment]
(
	[DonorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DonationAppointment_ScheduledDateTime]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_DonationAppointment_ScheduledDateTime] ON [dbo].[DonationAppointment]
(
	[ScheduledDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_DonationRecord_AppointmentID]    Script Date: 6/10/2025 2:39:20 PM ******/
ALTER TABLE [dbo].[DonationRecord] ADD  CONSTRAINT [UQ_DonationRecord_AppointmentID] UNIQUE NONCLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DonationRecord_AppointmentID]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_DonationRecord_AppointmentID] ON [dbo].[DonationRecord]
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DonationRecord_DonorID]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_DonationRecord_DonorID] ON [dbo].[DonationRecord]
(
	[DonorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Notification_IsRead]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_Notification_IsRead] ON [dbo].[Notification]
(
	[IsRead] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Notification_RecipientID]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_Notification_RecipientID] ON [dbo].[Notification]
(
	[RecipientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__536C85E4E047C661]    Script Date: 6/10/2025 2:39:20 PM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_BloodTypeID]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_BloodTypeID] ON [dbo].[User]
(
	[BloodTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User_Email]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_Email] ON [dbo].[User]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_RoleID]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_RoleID] ON [dbo].[User]
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User_Username]    Script Date: 6/10/2025 2:39:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_Username] ON [dbo].[User]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AppointmentStatus] ADD  CONSTRAINT [DF_AppointmentStatus_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[AppointmentStatus] ADD  CONSTRAINT [DF_AppointmentStatus_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF__Article__Created__515009E6]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF__Article__Updated__52442E1F]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF__Article__IsDelet__53385258]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ArticleCategory] ADD  CONSTRAINT [DF_ArticleCategory_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ArticleCategory] ADD  CONSTRAINT [DF_ArticleCategory_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ArticleStatus] ADD  CONSTRAINT [DF_ArticleStatus_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ArticleStatus] ADD  CONSTRAINT [DF_ArticleStatus_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BloodComponent] ADD  CONSTRAINT [DF_BloodComponent_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[BloodComponent] ADD  CONSTRAINT [DF_BloodComponent_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BloodRequest] ADD  DEFAULT (getdate()) FOR [RequestDateTime]
GO
ALTER TABLE [dbo].[BloodRequest] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[BloodRequest] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[BloodRequest] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BloodRequestStatus] ADD  CONSTRAINT [DF_BloodRequestStatus_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[BloodRequestStatus] ADD  CONSTRAINT [DF_BloodRequestStatus_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BloodTestResult] ADD  CONSTRAINT [DF_BloodTestResult_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[BloodTestResult] ADD  CONSTRAINT [DF_BloodTestResult_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BloodType] ADD  CONSTRAINT [DF_BloodType_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[BloodType] ADD  CONSTRAINT [DF_BloodType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BloodUnit] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[BloodUnit] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[BloodUnit] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BloodUnitStatus] ADD  CONSTRAINT [DF_BloodUnitStatus_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[BloodUnitStatus] ADD  CONSTRAINT [DF_BloodUnitStatus_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[DonationAppointment] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[DonationAppointment] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[DonationAppointment] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[DonationAvailability] ADD  CONSTRAINT [DF_DonationAvailability_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[DonationAvailability] ADD  CONSTRAINT [DF_DonationAvailability_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[DonationRecord] ADD  CONSTRAINT [DF__DonationR__Creat__6462DE5A]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[DonationRecord] ADD  CONSTRAINT [DF__DonationR__Updat__65570293]  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[DonationRecord] ADD  CONSTRAINT [DF__DonationR__IsDel__664B26CC]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[DonationType] ADD  CONSTRAINT [DF_DonationType_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[DonationType] ADD  CONSTRAINT [DF_DonationType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Gender] ADD  CONSTRAINT [DF_Gender_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Gender] ADD  CONSTRAINT [DF_Gender_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Notification] ADD  DEFAULT (getdate()) FOR [SentDateTime]
GO
ALTER TABLE [dbo].[Notification] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Notification] ADD  CONSTRAINT [DF_Notification_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Notification] ADD  CONSTRAINT [DF_Notification_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[NotificationType] ADD  CONSTRAINT [DF_NotificationType_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[NotificationType] ADD  CONSTRAINT [DF_NotificationType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Occupation] ADD  CONSTRAINT [DF_Occupation_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Occupation] ADD  CONSTRAINT [DF_Occupation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TimeSlot] ADD  CONSTRAINT [DF_TimeSlot_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[TimeSlot] ADD  CONSTRAINT [DF_TimeSlot_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Urgency] ADD  CONSTRAINT [DF_Urgency_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Urgency] ADD  CONSTRAINT [DF_Urgency_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [DonationCount]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK__Article__Article__55209ACA] FOREIGN KEY([ArticleCategoryID])
REFERENCES [dbo].[ArticleCategory] ([ArticleCategoryID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK__Article__Article__55209ACA]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK__Article__AuthorU__542C7691] FOREIGN KEY([AuthorUserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK__Article__AuthorU__542C7691]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_ArticleStatus] FOREIGN KEY([ArticleStatus])
REFERENCES [dbo].[ArticleStatus] ([ArticleStatusID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_ArticleStatus]
GO
ALTER TABLE [dbo].[BloodRequest]  WITH CHECK ADD FOREIGN KEY([BloodTypeID])
REFERENCES [dbo].[BloodType] ([BloodTypeID])
GO
ALTER TABLE [dbo].[BloodRequest]  WITH CHECK ADD FOREIGN KEY([BloodComponentID])
REFERENCES [dbo].[BloodComponent] ([ComponentID])
GO
ALTER TABLE [dbo].[BloodRequest]  WITH CHECK ADD FOREIGN KEY([RequestingStaffID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[BloodRequest]  WITH CHECK ADD FOREIGN KEY([RequestStatusID])
REFERENCES [dbo].[BloodRequestStatus] ([BloodRequestStatusID])
GO
ALTER TABLE [dbo].[BloodRequest]  WITH CHECK ADD FOREIGN KEY([UrgencyID])
REFERENCES [dbo].[Urgency] ([UrgencyID])
GO
ALTER TABLE [dbo].[BloodUnit]  WITH CHECK ADD FOREIGN KEY([BloodTypeID])
REFERENCES [dbo].[BloodType] ([BloodTypeID])
GO
ALTER TABLE [dbo].[BloodUnit]  WITH CHECK ADD FOREIGN KEY([BloodUnitStatusID])
REFERENCES [dbo].[BloodUnitStatus] ([BloodUnitStatusID])
GO
ALTER TABLE [dbo].[BloodUnit]  WITH CHECK ADD FOREIGN KEY([ComponentID])
REFERENCES [dbo].[BloodComponent] ([ComponentID])
GO
ALTER TABLE [dbo].[BloodUnit]  WITH CHECK ADD  CONSTRAINT [FK__BloodUnit__Donat__01F34141] FOREIGN KEY([DonationRecordID])
REFERENCES [dbo].[DonationRecord] ([DonationRecordID])
GO
ALTER TABLE [dbo].[BloodUnit] CHECK CONSTRAINT [FK__BloodUnit__Donat__01F34141]
GO
ALTER TABLE [dbo].[DonationAppointment]  WITH CHECK ADD FOREIGN KEY([AppointmentStatusID])
REFERENCES [dbo].[AppointmentStatus] ([AppointmentStatusID])
GO
ALTER TABLE [dbo].[DonationAppointment]  WITH CHECK ADD FOREIGN KEY([DonationTypeID])
REFERENCES [dbo].[DonationType] ([DonationTypeID])
GO
ALTER TABLE [dbo].[DonationAppointment]  WITH CHECK ADD FOREIGN KEY([DonorID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[DonationAppointment]  WITH CHECK ADD FOREIGN KEY([TimeSlotID])
REFERENCES [dbo].[TimeSlot] ([SlotID])
GO
ALTER TABLE [dbo].[DonationRecord]  WITH CHECK ADD  CONSTRAINT [FK__DonationR__Appoi__673F4B05] FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[DonationAppointment] ([AppointmentID])
GO
ALTER TABLE [dbo].[DonationRecord] CHECK CONSTRAINT [FK__DonationR__Appoi__673F4B05]
GO
ALTER TABLE [dbo].[DonationRecord]  WITH CHECK ADD  CONSTRAINT [FK__DonationR__Donat__6A1BB7B0] FOREIGN KEY([DonationTypeID])
REFERENCES [dbo].[DonationType] ([DonationTypeID])
GO
ALTER TABLE [dbo].[DonationRecord] CHECK CONSTRAINT [FK__DonationR__Donat__6A1BB7B0]
GO
ALTER TABLE [dbo].[DonationRecord]  WITH CHECK ADD  CONSTRAINT [FK__DonationR__Donor__68336F3E] FOREIGN KEY([DonorID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[DonationRecord] CHECK CONSTRAINT [FK__DonationR__Donor__68336F3E]
GO
ALTER TABLE [dbo].[DonationRecord]  WITH CHECK ADD  CONSTRAINT [FK__DonationR__Proce__69279377] FOREIGN KEY([ProcessingStaffID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[DonationRecord] CHECK CONSTRAINT [FK__DonationR__Proce__69279377]
GO
ALTER TABLE [dbo].[DonationRecord]  WITH CHECK ADD  CONSTRAINT [FK_DonationRecord_BloodTestResult] FOREIGN KEY([BloodTestResult])
REFERENCES [dbo].[BloodTestResult] ([ResultID])
GO
ALTER TABLE [dbo].[DonationRecord] CHECK CONSTRAINT [FK_DonationRecord_BloodTestResult]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([NotificationTypeID])
REFERENCES [dbo].[NotificationType] ([NotificationTypeID])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([RecipientID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([BloodTypeID])
REFERENCES [dbo].[BloodType] ([BloodTypeID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([DonationAvailability])
REFERENCES [dbo].[DonationAvailability] ([AvailabilityID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([GenderID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([OccupationID])
REFERENCES [dbo].[Occupation] ([OccupationID])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [BloodDonationDB] SET  READ_WRITE 
GO
