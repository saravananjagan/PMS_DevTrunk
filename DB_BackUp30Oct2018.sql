USE [master]
GO
/****** Object:  Database [saravananjagan_PMS]    Script Date: 10/30/2018 10:32:20 PM ******/
CREATE DATABASE [saravananjagan_PMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'saravananjagan_PMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQL2016\MSSQL\DATA\saravananjagan_PMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'saravananjagan_PMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQL2016\MSSQL\DATA\saravananjagan_PMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [saravananjagan_PMS] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [saravananjagan_PMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [saravananjagan_PMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [saravananjagan_PMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [saravananjagan_PMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [saravananjagan_PMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [saravananjagan_PMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET RECOVERY FULL 
GO
ALTER DATABASE [saravananjagan_PMS] SET  MULTI_USER 
GO
ALTER DATABASE [saravananjagan_PMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [saravananjagan_PMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [saravananjagan_PMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [saravananjagan_PMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [saravananjagan_PMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [saravananjagan_PMS] SET QUERY_STORE = OFF
GO
USE [saravananjagan_PMS]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [saravananjagan_PMS]
GO
/****** Object:  Schema [Pms]    Script Date: 10/30/2018 10:32:24 PM ******/
CREATE SCHEMA [Pms]
GO
/****** Object:  Table [Pms].[Class]    Script Date: 10/30/2018 10:32:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pms].[Class](
	[ClassId] [uniqueidentifier] NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[Section] [varchar](50) NULL,
	[StaffId] [uniqueidentifier] NOT NULL,
	[NumberOfStudents] [int] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Pms].[Customer]    Script Date: 10/30/2018 10:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pms].[Customer](
	[CustomerId] [uniqueidentifier] NOT NULL,
	[CustomerName] [varchar](max) NOT NULL,
	[CustomerTypeId] [uniqueidentifier] NOT NULL,
	[MembershipTypeId] [uniqueidentifier] NOT NULL,
	[CustomerEmailId] [varchar](256) NULL,
	[CustomerContactNumber] [varchar](100) NULL,
	[CustomerAddress] [varchar](max) NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Pms].[CustomerType]    Script Date: 10/30/2018 10:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pms].[CustomerType](
	[CustomerTypeId] [uniqueidentifier] NOT NULL,
	[CustomerType] [varchar](50) NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Pms].[Designation]    Script Date: 10/30/2018 10:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pms].[Designation](
	[DesignationId] [uniqueidentifier] NOT NULL,
	[DesignationName] [varchar](50) NOT NULL,
	[DesignationEffectiveFrom] [datetime] NOT NULL,
	[DesignationEffectiveTo] [datetime] NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DesignationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Pms].[ExaminationSchedule]    Script Date: 10/30/2018 10:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pms].[ExaminationSchedule](
	[ExaminationScheduleId] [uniqueidentifier] NOT NULL,
	[ExaminationTypeId] [uniqueidentifier] NOT NULL,
	[SubjectId] [uniqueidentifier] NOT NULL,
	[ClassId] [uniqueidentifier] NOT NULL,
	[HallId] [uniqueidentifier] NOT NULL,
	[InvigilatorId] [uniqueidentifier] NOT NULL,
	[HandlingStaffId] [uniqueidentifier] NOT NULL,
	[ExaminationDate] [date] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ExaminationScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Pms].[ExaminationType]    Script Date: 10/30/2018 10:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pms].[ExaminationType](
	[ExaminationTypeId] [uniqueidentifier] NOT NULL,
	[ExaminationType] [varchar](50) NOT NULL,
	[duration] [time](7) NOT NULL,
	[totalmarks] [int] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ExaminationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Pms].[MembershipType]    Script Date: 10/30/2018 10:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pms].[MembershipType](
	[MembershipTypeId] [uniqueidentifier] NOT NULL,
	[MembershipType] [varchar](50) NOT NULL,
	[MembershipLiscence] [uniqueidentifier] NULL,
	[MembershipValidFromDate] [datetime] NOT NULL,
	[MembershipValidToDate] [datetime] NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MembershipTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Pms].[ModuleDetails]    Script Date: 10/30/2018 10:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pms].[ModuleDetails](
	[ModuleId] [uniqueidentifier] NOT NULL,
	[ModuleName] [varchar](max) NOT NULL,
	[ModuleDescription] [varchar](max) NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Pms].[ModuleMapping]    Script Date: 10/30/2018 10:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pms].[ModuleMapping](
	[ModuleMappingId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[ModuleId] [uniqueidentifier] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ModuleMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Pms].[QuestionType]    Script Date: 10/30/2018 10:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pms].[QuestionType](
	[QuestionTypeId] [uniqueidentifier] NOT NULL,
	[QuestionType] [varchar](200) NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Pms].[Staff]    Script Date: 10/30/2018 10:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pms].[Staff](
	[StaffId] [uniqueidentifier] NOT NULL,
	[StaffFisrtName] [varchar](50) NOT NULL,
	[StaffMiddleName] [varchar](50) NOT NULL,
	[StaffLastName] [varchar](50) NOT NULL,
	[StaffEmployeeNumber] [varchar](50) NOT NULL,
	[DesignationId] [uniqueidentifier] NOT NULL,
	[StaffEmailId] [varchar](250) NOT NULL,
	[StaffContactNumber] [varchar](50) NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Pms].[Subject]    Script Date: 10/30/2018 10:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pms].[Subject](
	[SubjectId] [uniqueidentifier] NOT NULL,
	[SubjectName] [varchar](50) NOT NULL,
	[ClassId] [uniqueidentifier] NOT NULL,
	[StaffId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedBy] [uniqueidentifier] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [Pms].[ExaminationType] ADD  CONSTRAINT [AddedOn_ExaminationType]  DEFAULT (getdate()) FOR [AddedOn]
GO
ALTER TABLE [Pms].[Class]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [Pms].[Customer] ([CustomerId])
GO
ALTER TABLE [Pms].[Class]  WITH CHECK ADD FOREIGN KEY([StaffId])
REFERENCES [Pms].[Staff] ([StaffId])
GO
ALTER TABLE [Pms].[Customer]  WITH CHECK ADD FOREIGN KEY([CustomerTypeId])
REFERENCES [Pms].[CustomerType] ([CustomerTypeId])
GO
ALTER TABLE [Pms].[Customer]  WITH CHECK ADD FOREIGN KEY([MembershipTypeId])
REFERENCES [Pms].[MembershipType] ([MembershipTypeId])
GO
ALTER TABLE [Pms].[Designation]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [Pms].[Customer] ([CustomerId])
GO
ALTER TABLE [Pms].[ExaminationSchedule]  WITH CHECK ADD FOREIGN KEY([ClassId])
REFERENCES [Pms].[Class] ([ClassId])
GO
ALTER TABLE [Pms].[ExaminationSchedule]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [Pms].[Customer] ([CustomerId])
GO
ALTER TABLE [Pms].[ExaminationSchedule]  WITH CHECK ADD FOREIGN KEY([ExaminationTypeId])
REFERENCES [Pms].[ExaminationType] ([ExaminationTypeId])
GO
ALTER TABLE [Pms].[ExaminationSchedule]  WITH CHECK ADD FOREIGN KEY([HallId])
REFERENCES [Pms].[Class] ([ClassId])
GO
ALTER TABLE [Pms].[ExaminationSchedule]  WITH CHECK ADD FOREIGN KEY([HandlingStaffId])
REFERENCES [Pms].[Staff] ([StaffId])
GO
ALTER TABLE [Pms].[ExaminationSchedule]  WITH CHECK ADD FOREIGN KEY([InvigilatorId])
REFERENCES [Pms].[Staff] ([StaffId])
GO
ALTER TABLE [Pms].[ExaminationSchedule]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [Pms].[Subject] ([SubjectId])
GO
ALTER TABLE [Pms].[ExaminationType]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [Pms].[Customer] ([CustomerId])
GO
ALTER TABLE [Pms].[ModuleMapping]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [Pms].[Customer] ([CustomerId])
GO
ALTER TABLE [Pms].[ModuleMapping]  WITH CHECK ADD FOREIGN KEY([ModuleId])
REFERENCES [Pms].[ModuleDetails] ([ModuleId])
GO
ALTER TABLE [Pms].[QuestionType]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [Pms].[Customer] ([CustomerId])
GO
ALTER TABLE [Pms].[Staff]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [Pms].[Customer] ([CustomerId])
GO
ALTER TABLE [Pms].[Subject]  WITH CHECK ADD FOREIGN KEY([ClassId])
REFERENCES [Pms].[Class] ([ClassId])
GO
ALTER TABLE [Pms].[Subject]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [Pms].[Customer] ([CustomerId])
GO
ALTER TABLE [Pms].[Subject]  WITH CHECK ADD FOREIGN KEY([StaffId])
REFERENCES [Pms].[Staff] ([StaffId])
GO
/****** Object:  StoredProcedure [dbo].[USP_CreateScripts]    Script Date: 10/30/2018 10:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--schema - Pms
/******************************
** Name: USP_CreateScripts
** Desc: This SP will create tables
** Auth: Saravanan C.
** Date: 13/09/2018
**************************
** Change History
**************************
** PR   Date         Author      Description 
** --   --------     -------     ------------------------------------
** 1    13/09/2018   Saravanan   Created the SP with category table create script
*******************************/

--Exec USP_CreateScripts
CREATE proc [dbo].[USP_CreateScripts]
as
begin
--MasterTables section
begin 
	if not exists (select object_id from sys.objects where name ='MembershipType')
	begin
	begin try
		Create table Pms.MembershipType(
			MembershipTypeId uniqueidentifier PRIMARY KEY,
			MembershipType varchar(50) not null,
			MembershipLiscence uniqueidentifier,
			MembershipValidFromDate datetime not null,
			MembershipValidToDate datetime,
			AddedOn datetime not null,
			AddedBy uniqueidentifier not null,
			UpdatedOn datetime,
			UpdatedBy uniqueidentifier,
			Status bit not null
		)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end

	if not exists (select object_id from sys.objects where name ='CustomerType')
	begin
	begin try
		Create table Pms.CustomerType(
			CustomerTypeId uniqueidentifier PRIMARY KEY,
			CustomerType varchar(50) not null,
			AddedOn datetime not null,
			AddedBy uniqueidentifier not null,
			UpdatedOn datetime,
			UpdatedBy uniqueidentifier,
			Status bit not null
		)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end

	if not exists (select object_id from sys.objects where name ='ModuleDetails')
	begin
	begin try
		Create table Pms.ModuleDetails(
			ModuleId uniqueidentifier not null PRIMARY KEY,
			ModuleName varchar(max) not null,
			ModuleDescription varchar(max),
			AddedOn datetime not null,
			AddedBy uniqueidentifier not null,
			UpdatedOn datetime,
			UpdatedBy uniqueidentifier,
			Status bit not null
		)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end

end
--Customer Related Tables
begin	
	if not exists (select object_id from sys.objects where name ='Customer')
	begin
	begin try
		Create table Pms.Customer(
			CustomerId uniqueidentifier not null PRIMARY KEY,
			CustomerName varchar(max) not null,
			CustomerTypeId uniqueidentifier not null,
			MembershipTypeId uniqueidentifier not null,
			CustomerEmailId varchar(256),
			CustomerContactNumber varchar(100),
			CustomerAddress varchar(max),
			AddedOn datetime not null,
			AddedBy uniqueidentifier not null,
			UpdatedOn datetime,
			UpdatedBy uniqueidentifier,
			Status bit not null,
			FOREIGN KEY (CustomerTypeId) REFERENCES Pms.CustomerType(CustomerTypeId),
			FOREIGN KEY (MembershipTypeId) REFERENCES Pms.MembershipType(MembershipTypeId)
		)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end

	if not exists (select object_id from sys.objects where name ='ModuleMapping')
	begin
	begin try
		Create table Pms.ModuleMapping(
			ModuleMappingId uniqueidentifier not null PRIMARY KEY,
			CustomerId uniqueidentifier not null,
			ModuleId uniqueidentifier not null,
			AddedOn datetime not null,
			AddedBy uniqueidentifier not null,
			UpdatedOn datetime,
			UpdatedBy uniqueidentifier,
			Status bit not null,
			FOREIGN KEY (CustomerId) REFERENCES Pms.Customer(CustomerId),
			FOREIGN KEY (ModuleId) REFERENCES Pms.ModuleDetails(ModuleId)
		)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end
end
--Examination module Related tables
begin	
	if not exists (select object_id from sys.objects where name ='Designation')
	begin
	begin try
		Create table Pms.Designation(
			DesignationId uniqueidentifier not null PRIMARY KEY,
			DesignationName varchar(50) not null,
			DesignationEffectiveFrom datetime not null,
			DesignationEffectiveTo datetime null,
			CustomerId uniqueidentifier not null,			
			AddedOn datetime not null,
			AddedBy uniqueidentifier not null,
			UpdatedOn datetime,
			UpdatedBy uniqueidentifier,
			Status bit not null,
			FOREIGN KEY (CustomerId) REFERENCES Pms.Customer(CustomerId),			
		)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end

	if not exists (select object_id from sys.objects where name ='Staff')
	begin
	begin try
		Create table Pms.Staff(
			StaffId uniqueidentifier not null PRIMARY KEY,
			StaffFisrtName varchar(50) not null,
			StaffMiddleName varchar(50) not null,	
			StaffLastName varchar(50) not null,	
			StaffEmployeeNumber varchar(50) not null,	
			DesignationId  uniqueidentifier not null,	
			StaffEmailId  varchar(250) not null,
			StaffContactNumber varchar(50),
			CustomerId uniqueidentifier not null,
			AddedOn datetime not null,
			AddedBy uniqueidentifier not null,
			UpdatedOn datetime,
			UpdatedBy uniqueidentifier,
			Status bit not null,
			FOREIGN KEY (CustomerId) REFERENCES Pms.Customer(CustomerId),			
		)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end

	if not exists (select object_id from sys.objects where name ='Class')
	begin
	begin try
		Create table Pms.Class(
			ClassId uniqueidentifier not null PRIMARY KEY,
			ClassName varchar(50) not null,
			Section varchar(50),	
			StaffId uniqueidentifier not null,	
			NumberOfStudents int not null,	
			CustomerId uniqueidentifier not null,
			AddedOn datetime not null,
			AddedBy uniqueidentifier not null,
			UpdatedOn datetime,
			UpdatedBy uniqueidentifier,
			Status bit not null,
			FOREIGN KEY (StaffId) REFERENCES Pms.Staff(StaffId),
			FOREIGN KEY (CustomerId) REFERENCES Pms.Customer(CustomerId),			
		)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end

	if not exists (select object_id from sys.objects where name ='ExaminationType')
	begin
	begin try
		Create table Pms.ExaminationType(
			ExaminationTypeId uniqueidentifier not null PRIMARY KEY,
			ExaminationType varchar(50) not null,
			duration time not null,	
			totalmarks int not null,			
			CustomerId uniqueidentifier not null,
			AddedOn datetime not null,
			AddedBy uniqueidentifier not null,
			UpdatedOn datetime,
			UpdatedBy uniqueidentifier,
			Status bit not null,
			FOREIGN KEY (CustomerId) REFERENCES Pms.Customer(CustomerId),			
		)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end

	if not exists (select object_id from sys.objects where name ='Subject')
	begin
	begin try
		Create table Pms.[Subject](
			SubjectId uniqueidentifier not null PRIMARY KEY,
			SubjectName varchar(50) not null,
			ClassId uniqueidentifier not null,
			StaffId uniqueidentifier not null,				
			CustomerId uniqueidentifier not null,
			AddedOn datetime not null,
			AddedBy uniqueidentifier not null,
			UpdatedOn datetime,
			UpdatedBy uniqueidentifier,
			Status bit not null,
			FOREIGN KEY (ClassId) REFERENCES Pms.Class(ClassId),
			FOREIGN KEY (StaffId) REFERENCES Pms.Staff(StaffId),
			FOREIGN KEY (CustomerId) REFERENCES Pms.Customer(CustomerId),			
		)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end

	if not exists (select object_id from sys.objects where name ='ExaminationSchedule')
	begin
	begin try
		Create table Pms.ExaminationSchedule(
			ExaminationScheduleId uniqueidentifier not null PRIMARY KEY,
			ExaminationTypeId uniqueidentifier not null,
			SubjectId uniqueidentifier not null,
			ClassId uniqueidentifier not null,
			HallId uniqueidentifier not null, --FK Class
			InvigilatorId uniqueidentifier not null,
			HandlingStaffId uniqueidentifier not null,				
			ExaminationDate date not null,
			StartTime time not null,
			EndTime time not null,
			CustomerId uniqueidentifier not null,
			AddedOn datetime not null,
			AddedBy uniqueidentifier not null,
			UpdatedOn datetime,
			UpdatedBy uniqueidentifier,
			Status bit not null,
			FOREIGN KEY (ExaminationTypeId) REFERENCES Pms.ExaminationType(ExaminationTypeId),
			FOREIGN KEY (SubjectId) REFERENCES Pms.[Subject](SubjectId),
			FOREIGN KEY (ClassId) REFERENCES Pms.Class(ClassId),
			FOREIGN KEY (HallId) REFERENCES Pms.Class(ClassId),			
			FOREIGN KEY (InvigilatorId) REFERENCES Pms.Staff(StaffId),
			FOREIGN KEY (HandlingStaffId) REFERENCES Pms.Staff(StaffId),
			FOREIGN KEY (CustomerId) REFERENCES Pms.Customer(CustomerId),
		)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end
	if not exists (select object_id from sys.objects where name ='QuestionType')
	begin
	begin try
		Create table Pms.QuestionType(
			QuestionTypeId uniqueidentifier not null PRIMARY KEY,
			QuestionType varchar(200) not null,
			CustomerId uniqueidentifier not null,
			AddedOn datetime not null,
			AddedBy uniqueidentifier not null,
			UpdatedOn datetime,
			UpdatedBy uniqueidentifier,
			Status bit not null,
			FOREIGN KEY (CustomerId) REFERENCES Pms.Customer(CustomerId)
		)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end
end
end



GO
/****** Object:  StoredProcedure [dbo].[USP_SeedDataInsertScripts]    Script Date: 10/30/2018 10:32:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--schema - Pms
/******************************
** Name: USP_SeedDataInsertSctipts
** Desc: This SP will insert seed data
** Auth: Saravanan C.
** Date: 13/09/2018
**************************
** Change History
**************************
** PR   Date         Author      Description 
** --   --------     -------     ------------------------------------
** 1    13/09/2018   Saravanan   Created the SP with insert script for seed data
*******************************/
--adminUserId --325253DD-D714-439E-9D3D-DE5785F96DA7
--Exec USP_SeedDataInsertScripts
CREATE proc [dbo].[USP_SeedDataInsertScripts]
as 
begin
	/************************/
    --seed data for MasterTable
	/************************/
	begin
	/************************/
    --seed data for MembershipType
	/************************/
	begin
	if(exists(select object_id from sys.objects where name like '%MembershipType%') and not exists(select MembershipTypeId from Pms.MembershipType where MembershipTypeId='8CC558F9-B4D7-41D1-B52C-DA2823659598'))
	begin
	begin try
		INSERT INTO [Pms].[MembershipType]
		           ([MembershipTypeId]
		           ,[MembershipType]
		           ,[MembershipLiscence]
		           ,[MembershipValidFromDate]
		           ,[MembershipValidToDate]
		           ,[AddedOn]
		           ,[AddedBy]
		           ,[UpdatedOn]
		           ,[UpdatedBy]
		           ,[Status])
		     VALUES
		           ('8CC558F9-B4D7-41D1-B52C-DA2823659598',
				   'DbMaster',
				   null,
				   getdate(),
				   null,
				   getdate(),
				   '325253DD-D714-439E-9D3D-DE5785F96DA7',
				   null,
				   null,
				   1)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end
	else
	begin
		print('Record already Exists with this seed data OR MembershipType Table object doesn''t exists.')
	end
	end
	
	/************************/
    --seed data for CustomerType
	/************************/
	begin
	if(exists(select object_id from sys.objects where name like '%CustomerType%') and not exists(select CustomerTypeId from Pms.CustomerType where CustomerTypeId='DAE549F9-748C-4DB2-AC9A-FAED660C8F14'))
	begin
	begin try
		INSERT INTO [Pms].[CustomerType]
		       ([CustomerTypeId]
		       ,[CustomerType]
		       ,[AddedOn]
		       ,[AddedBy]
		       ,[UpdatedOn]
		       ,[UpdatedBy]
		       ,[Status])
		 VALUES
		       ('DAE549F9-748C-4DB2-AC9A-FAED660C8F14'
		       ,'DbMaster'
		       ,getdate()
		       ,'325253DD-D714-439E-9D3D-DE5785F96DA7'
		       ,null
		       ,null
		       ,1)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end
	else
	begin
		print('Record already Exists with this seed data OR CustomerType Table object doesn''t exists.')
	end
	end
	/************************/
    --seed data for ModuleDetails
	/************************/
	begin
	if(exists(select object_id from sys.objects where name like '%ModuleDetails%') and not exists(select ModuleId from Pms.ModuleDetails where ModuleId='7BFBE6C6-B4CD-4ED6-BD11-9C36931C9CF7'))
	begin
	begin try
		INSERT INTO [Pms].[ModuleDetails]
		           ([ModuleId]
		           ,[ModuleName]
		           ,[ModuleDescription]
		           ,[AddedOn]
		           ,[AddedBy]
		           ,[UpdatedOn]
		           ,[UpdatedBy]
		           ,[Status])
		     VALUES
		           ('7BFBE6C6-B4CD-4ED6-BD11-9C36931C9CF7'
		           ,'Examination'
		           ,'Examination Related Features'
		           ,GETDATE()
		           ,'325253DD-D714-439E-9D3D-DE5785F96DA7'
		           ,null
		           ,null
		           ,1)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end
	else
	begin
		print('Record already Exists with this seed data OR ModuleDetails Table object doesn''t exists.')
	end
	end
	end
	/************************/
    --seed data for Customer
	/************************/
	begin
	if(exists(select object_id from sys.objects where name = 'Customer') and not exists(select CustomerId from Pms.Customer where CustomerId='31FC079D-9B8F-4449-9D8E-C0CC0D813C5B'))
	begin
	begin try	
		INSERT INTO [Pms].[Customer]
		           ([CustomerId]
		           ,[CustomerName]
		           ,[CustomerTypeId]
		           ,[MembershipTypeId]
		           ,[CustomerEmailId]
		           ,[CustomerContactNumber]
		           ,[CustomerAddress]
		           ,[AddedOn]
		           ,[AddedBy]
		           ,[UpdatedOn]
		           ,[UpdatedBy]
		           ,[Status])
		     VALUES
		           ('F3A0C98F-2E41-47B9-9308-2169CA3728B1'
		           ,'DbMaster'
		           ,'DAE549F9-748C-4DB2-AC9A-FAED660C8F14'
		           ,'8CC558F9-B4D7-41D1-B52C-DA2823659598'
		           ,null
		           ,null
		           ,null
		           ,getdate()
		           ,'325253DD-D714-439E-9D3D-DE5785F96DA7'
		           ,null
		           ,null
		           ,1)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end
	else
	begin
		print('Record already Exists with this seed data OR Customer Table object doesn''t exists.')
	end
	end
	/************************/
    --seed data for Module Mapping
	/************************/
	begin 
	if(exists(select object_id from sys.objects where name like '%ModuleMapping%') and not exists(select ModuleMappingId from Pms.ModuleMapping where ModuleMappingId='F9072A5D-A67B-43ED-A1B2-D776DFC60A3B'))
	begin
	begin try
		INSERT INTO [Pms].[ModuleMapping]
		           ([ModuleMappingId]
		           ,[CustomerId]
		           ,[ModuleId]
		           ,[AddedOn]
		           ,[AddedBy]
		           ,[UpdatedOn]
		           ,[UpdatedBy]
		           ,[Status])
		     VALUES
		           ('F9072A5D-A67B-43ED-A1B2-D776DFC60A3B'
		           ,'F3A0C98F-2E41-47B9-9308-2169CA3728B1'
		           ,'7BFBE6C6-B4CD-4ED6-BD11-9C36931C9CF7'
		           ,getdate()
		           ,'325253DD-D714-439E-9D3D-DE5785F96DA7'
		           ,null
		           ,null
		           ,1)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end
	else
	begin
		print('Record already Exists with this seed data OR ModuleMapping Table object doesn''t exists.')
	end
	end
	if(exists(select object_id from sys.objects where name like '%QuestionType%') and not exists(select QuestionTypeId from Pms.QuestionType where QuestionTypeId='DD0EBD1E-DE86-4A1F-AF2B-A0FA38DE2B9A'))
	begin
	begin try
		INSERT INTO [Pms].[QuestionType]
					(
					QuestionTypeId
					,QuestionType
					,CustomerId
					,AddedOn
					,AddedBy
					,UpdatedOn
					,UpdatedBy
					,Status
					)		           		           		        		           
		     VALUES
		           ('DD0EBD1E-DE86-4A1F-AF2B-A0FA38DE2B9A'
		           ,'MCQ/Objective'
		           ,'F3A0C98F-2E41-47B9-9308-2169CA3728B1'
		           ,getdate()
		           ,'325253DD-D714-439E-9D3D-DE5785F96DA7'
		           ,null
		           ,null
		           ,1)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end
	else
	begin
		print('Record already Exists with this seed data OR ModuleMapping Table object doesn''t exists.')
	end
	if(exists(select object_id from sys.objects where name like '%QuestionType%') and not exists(select QuestionTypeId from Pms.QuestionType where QuestionTypeId='51B4C5BF-5FB9-4E70-A431-899AAB6F324C'))
	begin
	begin try
		INSERT INTO [Pms].[QuestionType]
					(
					QuestionTypeId
					,QuestionType
					,CustomerId
					,AddedOn
					,AddedBy
					,UpdatedOn
					,UpdatedBy
					,Status
					)		           		           		        		           
		     VALUES
		           ('51B4C5BF-5FB9-4E70-A431-899AAB6F324C'
		           ,'Fill Ups/Objective'
		           ,'F3A0C98F-2E41-47B9-9308-2169CA3728B1'
		           ,getdate()
		           ,'325253DD-D714-439E-9D3D-DE5785F96DA7'
		           ,null
		           ,null
		           ,1)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end
	else
	begin
		print('Record already Exists with this seed data OR ModuleMapping Table object doesn''t exists.')
	end
	if(exists(select object_id from sys.objects where name like '%QuestionType%') and not exists(select QuestionTypeId from Pms.QuestionType where QuestionTypeId='942FD703-3F39-4B7C-AEAC-2B327C095247'))
	begin
	begin try
		INSERT INTO [Pms].[QuestionType]
					(
					QuestionTypeId
					,QuestionType
					,CustomerId
					,AddedOn
					,AddedBy
					,UpdatedOn
					,UpdatedBy
					,Status
					)		           		           		        		           
		     VALUES
		           ('942FD703-3F39-4B7C-AEAC-2B327C095247'
		           ,'Q&A/Subjective'
		           ,'F3A0C98F-2E41-47B9-9308-2169CA3728B1'
		           ,getdate()
		           ,'325253DD-D714-439E-9D3D-DE5785F96DA7'
		           ,null
		           ,null
		           ,1)
	end try
	begin catch
		print('In '+Error_procedure()+' procedure, Line number '+cast(Error_state() as varchar)+' '+Error_Message())
	end catch
	end
	else
	begin
		print('Record already Exists with this seed data OR ModuleMapping Table object doesn''t exists.')
	end
	end



GO
USE [master]
GO
ALTER DATABASE [saravananjagan_PMS] SET  READ_WRITE 
GO
