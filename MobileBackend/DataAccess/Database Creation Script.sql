USE [master]
GO
/****** Object:  Database [PointMobileDB]    Script Date: 4/6/2017 10:53:19 ******/
CREATE DATABASE [PointMobileDB]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PointMobileDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PointMobileDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PointMobileDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PointMobileDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PointMobileDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PointMobileDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PointMobileDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PointMobileDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PointMobileDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PointMobileDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PointMobileDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PointMobileDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PointMobileDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PointMobileDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PointMobileDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PointMobileDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PointMobileDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PointMobileDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PointMobileDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PointMobileDB] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [PointMobileDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PointMobileDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PointMobileDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PointMobileDB] SET RECOVERY FULL 
GO
ALTER DATABASE [PointMobileDB] SET  MULTI_USER 
GO
ALTER DATABASE [PointMobileDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PointMobileDB] SET DB_CHAINING OFF 
GO
USE [PointMobileDB]
GO
/****** Object:  Table [dbo].[Contractors]    Script Date: 4/6/2017 10:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contractors](
	[Id_Contractor] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](200) NULL,
	[ContactPerson] [nvarchar](200) NULL,
	[PhoneNumber] [nvarchar](100) NULL,
	[EmailAddress] [nvarchar](100) NULL,
	[VatId] [nvarchar](50) NULL,
	[HourlyRate] [float] NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Contractor] PRIMARY KEY CLUSTERED 
(
	[Id_Contractor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/6/2017 10:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id_Customer] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](200) NULL,
	[ContactPerson] [nvarchar](200) NULL,
	[PhoneNumber] [nvarchar](100) NULL,
	[EmailAddress] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id_Customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/6/2017 10:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[Id_Employee] [int] IDENTITY(1,1) NOT NULL,
	[Id_Contractor] [int] NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](100) NULL,
	[EmailAddress] [nvarchar](100) NULL,
	[EmployeeReferences] [nvarchar](2000) NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
	[Active] [bit] NULL,
	[EmployeePicture] [varbinary](max) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id_Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Timesheets]    Script Date: 4/6/2017 10:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timesheets](
	[Id_Timesheet] [int] IDENTITY(1,1) NOT NULL,
	[Id_Customer] [int] NULL,
	[Id_Contractor] [int] NULL,
	[Id_Employee] [int] NULL,
	[Id_WorkAssignment] [int] NULL,
	[StartTime] [datetime] NULL,
	[StopTime] [datetime] NULL,
	[Comments] [nvarchar](2000) NULL,
	[WorkComplete] [bit] NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Timesheets] PRIMARY KEY CLUSTERED 
(
	[Id_Timesheet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[WorkAssignments]    Script Date: 4/6/2017 10:53:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkAssignments](
	[Id_WorkAssignment] [int] IDENTITY(1,1) NOT NULL,
	[Id_Customer] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](2000) NULL,
	[Deadline] [datetime] NULL,
	[InProgress] [bit] NULL,
	[InProgressAt] [datetime] NULL,
	[Completed] [bit] NULL,
	[CompletedAt] [datetime] NULL,
	[CreatedAt] [datetime] NULL,
	[LastModifiedAt] [datetime] NULL,
	[DeletedAt] [datetime] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_WorkAssignments] PRIMARY KEY CLUSTERED 
(
	[Id_WorkAssignment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Contractors] FOREIGN KEY([Id_Contractor])
REFERENCES [dbo].[Contractors] ([Id_Contractor])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Contractors]
GO
ALTER TABLE [dbo].[Timesheets]  WITH CHECK ADD  CONSTRAINT [FK_Timesheets_Contractors] FOREIGN KEY([Id_Contractor])
REFERENCES [dbo].[Contractors] ([Id_Contractor])
GO
ALTER TABLE [dbo].[Timesheets] CHECK CONSTRAINT [FK_Timesheets_Contractors]
GO
ALTER TABLE [dbo].[Timesheets]  WITH CHECK ADD  CONSTRAINT [FK_Timesheets_Customers] FOREIGN KEY([Id_Customer])
REFERENCES [dbo].[Customers] ([Id_Customer])
GO
ALTER TABLE [dbo].[Timesheets] CHECK CONSTRAINT [FK_Timesheets_Customers]
GO
ALTER TABLE [dbo].[Timesheets]  WITH CHECK ADD  CONSTRAINT [FK_Timesheets_Employees] FOREIGN KEY([Id_Employee])
REFERENCES [dbo].[Employees] ([Id_Employee])
GO
ALTER TABLE [dbo].[Timesheets] CHECK CONSTRAINT [FK_Timesheets_Employees]
GO
ALTER TABLE [dbo].[Timesheets]  WITH CHECK ADD  CONSTRAINT [FK_Timesheets_WorkAssignments] FOREIGN KEY([Id_WorkAssignment])
REFERENCES [dbo].[WorkAssignments] ([Id_WorkAssignment])
GO
ALTER TABLE [dbo].[Timesheets] CHECK CONSTRAINT [FK_Timesheets_WorkAssignments]
GO
ALTER TABLE [dbo].[WorkAssignments]  WITH CHECK ADD  CONSTRAINT [FK_WorkAssignments_Customers] FOREIGN KEY([Id_Customer])
REFERENCES [dbo].[Customers] ([Id_Customer])
GO
ALTER TABLE [dbo].[WorkAssignments] CHECK CONSTRAINT [FK_WorkAssignments_Customers]
GO
USE [master]
GO
ALTER DATABASE [PointMobileDB] SET  READ_WRITE 
GO
