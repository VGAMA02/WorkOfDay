USE [master]
GO
/****** Object:  Database [WorkControl]    Script Date: 29/05/2023 12:37:05 p. m. ******/
CREATE DATABASE [WorkControl]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WorkControl', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER0\MSSQL\DATA\WorkControl.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WorkControl_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER0\MSSQL\DATA\WorkControl_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WorkControl] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WorkControl].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WorkControl] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WorkControl] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WorkControl] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WorkControl] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WorkControl] SET ARITHABORT OFF 
GO
ALTER DATABASE [WorkControl] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WorkControl] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WorkControl] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WorkControl] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WorkControl] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WorkControl] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WorkControl] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WorkControl] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WorkControl] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WorkControl] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WorkControl] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WorkControl] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WorkControl] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WorkControl] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WorkControl] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WorkControl] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WorkControl] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WorkControl] SET RECOVERY FULL 
GO
ALTER DATABASE [WorkControl] SET  MULTI_USER 
GO
ALTER DATABASE [WorkControl] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WorkControl] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WorkControl] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WorkControl] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WorkControl] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WorkControl', N'ON'
GO
ALTER DATABASE [WorkControl] SET QUERY_STORE = OFF
GO
USE [WorkControl]
GO
/****** Object:  Table [dbo].[AR_HistoryTask]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AR_HistoryTask](
	[PKComentary] [int] NOT NULL,
	[FKTask] [int] NOT NULL,
	[Comentary] [varchar](280) NOT NULL,
	[FKUser] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_AR_HistoryTask] PRIMARY KEY CLUSTERED 
(
	[PKComentary] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_Category]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_Category](
	[PKCategory] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Available] [bit] NOT NULL,
	[Description] [varchar](280) NOT NULL,
 CONSTRAINT [PK_CT_Category] PRIMARY KEY CLUSTERED 
(
	[PKCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_Roles]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_Roles](
	[PKRole] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_CT_Roles] PRIMARY KEY CLUSTERED 
(
	[PKRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_Status]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_Status](
	[PKStatus] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](280) NOT NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_CT_Status] PRIMARY KEY CLUSTERED 
(
	[PKStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_Tasks]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_Tasks](
	[PKTask] [int] IDENTITY(1,1) NOT NULL,
	[FKAssignedUser] [int] NOT NULL,
	[FKCategory] [int] NOT NULL,
	[FKLastUpdater] [int] NOT NULL,
	[FKCreatorUser] [int] NOT NULL,
	[FKStatus] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](280) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_CT_Tasks] PRIMARY KEY CLUSTERED 
(
	[PKTask] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SC_Users]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC_Users](
	[PKUser] [int] IDENTITY(1,1) NOT NULL,
	[FKRole] [int] NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Available] [bit] NOT NULL,
	[BirthDay] [datetime] NOT NULL,
 CONSTRAINT [PK_SC_Users] PRIMARY KEY CLUSTERED 
(
	[PKUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CT_Category] ON 
GO
INSERT [dbo].[CT_Category] ([PKCategory], [Name], [Available], [Description]) VALUES (3, N'Trabajo', 1, N'Tareas relacionadas con el ambito laboral')
GO
INSERT [dbo].[CT_Category] ([PKCategory], [Name], [Available], [Description]) VALUES (4, N'Escuela', 1, N'Tareas relacionadas con el ambito escolar')
GO
INSERT [dbo].[CT_Category] ([PKCategory], [Name], [Available], [Description]) VALUES (5, N'Hogar', 1, N'Tareas relacionadas con el ambito de la vida cotidiana')
GO
SET IDENTITY_INSERT [dbo].[CT_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[CT_Roles] ON 
GO
INSERT [dbo].[CT_Roles] ([PKRole], [Name], [Available]) VALUES (1, N'Admin', 1)
GO
INSERT [dbo].[CT_Roles] ([PKRole], [Name], [Available]) VALUES (3, N'employee', 1)
GO
SET IDENTITY_INSERT [dbo].[CT_Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[CT_Status] ON 
GO
INSERT [dbo].[CT_Status] ([PKStatus], [Name], [Description], [Available]) VALUES (1, N'On Hold', N'En espera de informacion o accion por parte de alguien diferente al solicitante', 1)
GO
INSERT [dbo].[CT_Status] ([PKStatus], [Name], [Description], [Available]) VALUES (3, N'Pending', N'Abierto, aún no resuelto, pero la organización está esperando información, aprobaciones, resultados, decisiones, documentos o resultados similares de una parte externa a la organización', 1)
GO
INSERT [dbo].[CT_Status] ([PKStatus], [Name], [Description], [Available]) VALUES (4, N'In procede', N'La tarea esta en realizacion', 1)
GO
INSERT [dbo].[CT_Status] ([PKStatus], [Name], [Description], [Available]) VALUES (5, N'Close', N'La tarea a sido finalizada', 1)
GO
SET IDENTITY_INSERT [dbo].[CT_Status] OFF
GO
SET IDENTITY_INSERT [dbo].[CT_Tasks] ON 
GO
INSERT [dbo].[CT_Tasks] ([PKTask], [FKAssignedUser], [FKCategory], [FKLastUpdater], [FKCreatorUser], [FKStatus], [Name], [Description], [StartDate], [EndDate], [LastUpdate], [Available]) VALUES (1, 1, 3, 1, 1, 1, N'Verificar tablas2', N'hay que verificar que las tablas funcionen2', CAST(N'2023-05-23T00:03:00.000' AS DateTime), CAST(N'2023-05-23T00:03:00.000' AS DateTime), CAST(N'2023-05-27T22:38:43.593' AS DateTime), 1)
GO
INSERT [dbo].[CT_Tasks] ([PKTask], [FKAssignedUser], [FKCategory], [FKLastUpdater], [FKCreatorUser], [FKStatus], [Name], [Description], [StartDate], [EndDate], [LastUpdate], [Available]) VALUES (4, 1, 3, 1, 1, 3, N'Crear el Update', N'Generar toda la plantilla en el front para que el actualizar una tarea funcione.', CAST(N'2023-05-26T22:19:31.000' AS DateTime), CAST(N'2023-05-26T22:19:31.000' AS DateTime), CAST(N'2023-05-27T22:40:20.857' AS DateTime), 1)
GO
INSERT [dbo].[CT_Tasks] ([PKTask], [FKAssignedUser], [FKCategory], [FKLastUpdater], [FKCreatorUser], [FKStatus], [Name], [Description], [StartDate], [EndDate], [LastUpdate], [Available]) VALUES (5, 1, 3, 1, 1, 3, N'Salas', N'probar sala', CAST(N'2023-04-14T00:00:00.000' AS DateTime), CAST(N'2023-04-14T00:00:00.000' AS DateTime), CAST(N'2023-04-14T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[CT_Tasks] ([PKTask], [FKAssignedUser], [FKCategory], [FKLastUpdater], [FKCreatorUser], [FKStatus], [Name], [Description], [StartDate], [EndDate], [LastUpdate], [Available]) VALUES (6, 1, 3, 1, 1, 3, N'Verificar el añadir tareas', N'algo falla con añadir y las fechas revisar eso', CAST(N'2023-05-25T17:19:00.000' AS DateTime), CAST(N'2023-05-26T19:19:00.000' AS DateTime), CAST(N'2023-05-26T17:19:52.000' AS DateTime), 1)
GO
INSERT [dbo].[CT_Tasks] ([PKTask], [FKAssignedUser], [FKCategory], [FKLastUpdater], [FKCreatorUser], [FKStatus], [Name], [Description], [StartDate], [EndDate], [LastUpdate], [Available]) VALUES (7, 2, 3, 1, 1, 5, N'Verificar filtros de tablas', N'Testear que los filtros funcionen', CAST(N'2023-05-22T16:20:00.000' AS DateTime), CAST(N'2023-05-29T16:20:00.000' AS DateTime), CAST(N'2023-05-28T16:21:05.000' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[CT_Tasks] OFF
GO
SET IDENTITY_INSERT [dbo].[SC_Users] ON 
GO
INSERT [dbo].[SC_Users] ([PKUser], [FKRole], [FirstName], [LastName], [Email], [Password], [Available], [BirthDay]) VALUES (1, 1, N'Brandon', N'Gama Franco', N'gama90@hotmail.com', N'gamas90', 1, CAST(N'2000-05-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[SC_Users] ([PKUser], [FKRole], [FirstName], [LastName], [Email], [Password], [Available], [BirthDay]) VALUES (2, 3, N'Jorge', N'Valdes Perez', N'jorge@hotmail.com', N'jorge90', 1, CAST(N'2000-05-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[SC_Users] ([PKUser], [FKRole], [FirstName], [LastName], [Email], [Password], [Available], [BirthDay]) VALUES (3, 3, N'Juan', N'Sanchez Lopez', N'Juan@hotmail.com', N'juan90', 1, CAST(N'2000-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[SC_Users] ([PKUser], [FKRole], [FirstName], [LastName], [Email], [Password], [Available], [BirthDay]) VALUES (4, 3, N'Ricardo', N'Morongo Salva', N'Ricardo@hotmail.com', N'ricardo90', 1, CAST(N'1990-12-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[SC_Users] ([PKUser], [FKRole], [FirstName], [LastName], [Email], [Password], [Available], [BirthDay]) VALUES (5, 3, N'Maria', N'Ruvalcaba Longoria', N'Maria@hotmail.com', N'maria90', 1, CAST(N'1998-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[SC_Users] ([PKUser], [FKRole], [FirstName], [LastName], [Email], [Password], [Available], [BirthDay]) VALUES (6, 3, N'Carlos', N'Vallarta Ramirez', N'Carlos@hotmail.com', N'carlos90', 1, CAST(N'2023-05-13T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[SC_Users] OFF
GO
ALTER TABLE [dbo].[AR_HistoryTask] ADD  CONSTRAINT [DF_AR_HistoryTask_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[SC_Users] ADD  CONSTRAINT [DF_SC_Users_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[AR_HistoryTask]  WITH CHECK ADD  CONSTRAINT [FK_AR_HistoryTask_CT_Tasks] FOREIGN KEY([FKTask])
REFERENCES [dbo].[CT_Tasks] ([PKTask])
GO
ALTER TABLE [dbo].[AR_HistoryTask] CHECK CONSTRAINT [FK_AR_HistoryTask_CT_Tasks]
GO
ALTER TABLE [dbo].[CT_Tasks]  WITH CHECK ADD  CONSTRAINT [FK_CT_Tasks_CT_Category] FOREIGN KEY([FKCategory])
REFERENCES [dbo].[CT_Category] ([PKCategory])
GO
ALTER TABLE [dbo].[CT_Tasks] CHECK CONSTRAINT [FK_CT_Tasks_CT_Category]
GO
ALTER TABLE [dbo].[CT_Tasks]  WITH CHECK ADD  CONSTRAINT [FK_CT_Tasks_SC_Users_AssignedUser] FOREIGN KEY([FKAssignedUser])
REFERENCES [dbo].[SC_Users] ([PKUser])
GO
ALTER TABLE [dbo].[CT_Tasks] CHECK CONSTRAINT [FK_CT_Tasks_SC_Users_AssignedUser]
GO
ALTER TABLE [dbo].[CT_Tasks]  WITH CHECK ADD  CONSTRAINT [FK_CT_Tasks_SC_Users_Creator] FOREIGN KEY([FKCreatorUser])
REFERENCES [dbo].[SC_Users] ([PKUser])
GO
ALTER TABLE [dbo].[CT_Tasks] CHECK CONSTRAINT [FK_CT_Tasks_SC_Users_Creator]
GO
ALTER TABLE [dbo].[CT_Tasks]  WITH CHECK ADD  CONSTRAINT [FK_CT_Tasks_SC_Users_LastUpdater] FOREIGN KEY([FKLastUpdater])
REFERENCES [dbo].[SC_Users] ([PKUser])
GO
ALTER TABLE [dbo].[CT_Tasks] CHECK CONSTRAINT [FK_CT_Tasks_SC_Users_LastUpdater]
GO
ALTER TABLE [dbo].[SC_Users]  WITH CHECK ADD  CONSTRAINT [FK_SC_Users_CT_Roles] FOREIGN KEY([FKRole])
REFERENCES [dbo].[CT_Roles] ([PKRole])
GO
ALTER TABLE [dbo].[SC_Users] CHECK CONSTRAINT [FK_SC_Users_CT_Roles]
GO
/****** Object:  StoredProcedure [dbo].[Up_AddHistoryTask]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_AddHistoryTask]
	@FKTask int,
	@FKUser int,
	@Comentary varchar(280),
	@Date datetime
AS
BEGIN
	IF NOT exists(SELECT [PKComentary] FROM AR_HistoryTask WITH(NOLOCK) WHERE [Date]= @Date AND FKUser = @FKUser)
	BEGIN
		INSERT INTO AR_HistoryTask(FKTask,FKUser,
		Comentary,[Date]) 
		VALUES (@FKTask,@FKUser,
		@Comentary,@Date) 
		SELECT 1 as resultado
	END
	ELSE
	BEGIN
		SELECT -1 as resultado
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_AddTask]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_AddTask]
	@FKAssignedUser int,
	@FKCategory int,
	@FKLastUpdater int,
	@FKCreatorUser int,
	@FKStatus int,
	@Name varchar(100),
	@Description varchar(100),
	@StartDate datetime,
	@EndDate datetime,
	@LastUpdate datetime
AS
BEGIN
	IF NOT exists(SELECT [PKTask] FROM CT_Tasks A WITH(NOLOCK) WHERE A.StartDate = @StartDate AND FKAssignedUser = @FKAssignedUser)
	BEGIN
		INSERT INTO CT_Tasks (FKAssignedUser,FKCategory,
		FKLastUpdater,FKCreatorUser,
		FKStatus,[Name],
		[Description], StartDate,
		EndDate, LastUpdate,
		Available) 
		VALUES (@FKAssignedUser,@FKCategory,
		@FKLastUpdater,@FKCreatorUser,
		@FKStatus,@Name,
		@Description, @StartDate,
		@EndDate, @LastUpdate,1) 
		SELECT 1 as resultado
	END
	ELSE
	BEGIN
		SELECT -1 as resultado
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_AddUser]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_AddUser]
	@FKRole varchar(100),
	@FirstName varchar(100),
	@LastName varchar(100),
	@Email varchar(100),
	@Password varchar(100),
	@BirthDay datetime
AS
BEGIN
	IF NOT exists(SELECT [PKUser] FROM SC_Users A WITH(NOLOCK) WHERE A.Email = @Email)
	BEGIN
		INSERT INTO SC_Users (FKRole,FirstName,LastName,Email,[Password],BirthDay) VALUES(@FKRole,@FirstName,@LastName,@Email,@Password,@BirthDay)
		SELECT 1 as resultado
	END
	ELSE
	BEGIN
		SELECT -1 as resultado
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_AuthenticationUser]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_AuthenticationUser]
	@Email varchar(100),
	@Password varchar(100)
AS
BEGIN
IF exists(SELECT [PKUser] FROM SC_Users A WITH(NOLOCK) WHERE A.Email = @Email AND [Password] = @Password)
	BEGIN
		SELECT [PKUser], FKRole  FROM SC_Users A WITH(NOLOCK) WHERE A.Email = @Email AND [Password] = @Password AND Available = 1
	END
	ELSE
	BEGIN
		SELECT -1 as resultado
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_DelHistoryTask]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_DelHistoryTask]
	@FKTask int,
	@FKUser int,
	@Date datetime
AS
BEGIN
	IF NOT exists(SELECT PKComentary FROM AR_HistoryTask A WITH(NOLOCK) WHERE A.FKTask = @FKTask AND A.FKUser = @FKUser AND A.[Date] = @Date)
	BEGIN
		UPDATE  AR_HistoryTask SET Available = 0 WHERE FKTask = @FKTask AND FKUser = @FKUser AND [Date] = @Date
		SELECT 1 as resultado
	END
	ELSE
	BEGIN
		SELECT -1 as resultado
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_DelTask]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_DelTask]
	@FKAassignedUser int,
	@FKCategory int,
	@FKCreatorUser int,
	@StartDate datetime
AS
BEGIN
	IF exists(SELECT 
	[PKTask] FROM CT_Tasks WITH(NOLOCK) WHERE FKAssignedUser = @FKAassignedUser AND FKCategory = @FKCategory AND FKCreatorUser = @FKCreatorUser AND StartDate = @StartDate AND Available = 1)
	BEGIN
		UPDATE  CT_Tasks SET Available = 0, LastUpdate = GETDATE() WHERE FKAssignedUser = @FKAassignedUser AND FKCategory = @FKCategory AND FKCreatorUser = @FKCreatorUser AND StartDate = @StartDate AND Available = 1
		SELECT 1 as resultado
	END
	ELSE
	BEGIN
		SELECT -1 as resultado
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_DelUser]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_DelUser]
	@Email varchar(100)
AS
BEGIN
	IF NOT exists(SELECT [PKUser] FROM SC_Users A WITH(NOLOCK) WHERE A.Email = @Email)
	BEGIN
		UPDATE  SC_Users SET Available = 0 WHERE Email = @Email
		SELECT 1 as resultado
	END
	ELSE
	BEGIN
		SELECT -1 as resultado
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_GetAllAvailableTasks]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE[dbo].[Up_GetAllAvailableTasks]

AS
BEGIN
	
	SELECT  
	PKTask,
	FKAssignedUser,
	FKCategory,
	FKLastUpdater,
	FKCreatorUser,
	FKStatus,
	T.[Name],
	T.[Description],
	U.FirstName,
	C.[Name] as CategoryName,
	S.[Name] as StatusName,
	StartDate,
	EndDate,
	LastUpdate,
	T.Available
	FROM CT_Tasks T 
	JOIN SC_Users U ON U.PKUser = T.FKAssignedUser
	JOIN CT_Category C ON C.PKCategory = T.FKCategory
	JOIN CT_Status S ON S.PKStatus = T.FKStatus
	WHERE T.Available = 1

END
GO
/****** Object:  StoredProcedure [dbo].[Up_GetAllStatus]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_GetAllStatus]

AS
BEGIN
	SELECT 
		[PKStatus],
		[Name],
		[Description]
		FROM CT_Status WITH(NOLOCK) WHERE Available = 1
END
GO
/****** Object:  StoredProcedure [dbo].[Up_GetCategorys]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_GetCategorys]

AS
BEGIN
	SELECT 
		[PKCategory],
		[Name],
		[Description]
		FROM CT_Category WITH(NOLOCK) WHERE Available = 1
END
GO
/****** Object:  StoredProcedure [dbo].[Up_GetComentarysByTask]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_GetComentarysByTask]
	@FKTask int
AS
BEGIN
	IF exists(SELECT PKComentary FROM AR_HistoryTask A WITH(NOLOCK) WHERE A.FKTask = @FKTask )
	BEGIN
		SELECT  
		PKComentary,
		FKTask,
		FKUser,
		Comentary,
		[Date]
		FROM AR_HistoryTask WITH(NOLOCK) WHERE FKTask = @FKTask
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_GetTasksByAssignedUser]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_GetTasksByAssignedUser]
	@PKUser int
AS
BEGIN
	
	SELECT  
	PKTask,
	FKAssignedUser,
	FKCategory,
	FKLastUpdater,
	FKCreatorUser,
	FKStatus,
	T.[Name],
	T.[Description],
	U.FirstName,
	C.[Name] as CategoryName,
	S.[Name] as StatusName,
	StartDate,
	EndDate,
	LastUpdate,
	T.Available
	FROM CT_Tasks T 
	JOIN SC_Users U ON U.PKUser = T.FKAssignedUser
	JOIN CT_Category C ON C.PKCategory = T.FKCategory
	JOIN CT_Status S ON S.PKStatus = T.FKStatus
	WHERE FKAssignedUser = @PKUser AND T.Available = 1

END
GO
/****** Object:  StoredProcedure [dbo].[Up_GetTasksByAssignedUserAndCategory]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_GetTasksByAssignedUserAndCategory]
	@PKUser int,
	@Category varchar(100)
AS
BEGIN
	
	IF exists(SELECT  PKCategory FROM CT_Category A WITH(NOLOCK) WHERE A.[Name] = @Category )
	BEGIN
		SELECT  
		PKTask,
		FKAssignedUser,
		FKCategory,
		FKLastUpdater,
		FKCreatorUser,
		FKStatus,
		[Name],
		[Description],
		StartDate,
		EndDate,
		LastUpdate,
		Available
		FROM CT_Tasks WITH(NOLOCK) WHERE FKAssignedUser = @PKUser AND FKCategory = @Category
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_GetUserByEmail]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_GetUserByEmail]
	@Email varchar(100)
AS
BEGIN
	SELECT 
		[PKUser],
		[FKRole],
		[FirstName],
		[LastName],
		[Email],
		[BirthDay]
		FROM SC_Users WITH(NOLOCK) WHERE Available = 1 AND Email = @Email 
END
GO
/****** Object:  StoredProcedure [dbo].[Up_GetUserByPKUser]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_GetUserByPKUser]
	@PKUser int
AS
BEGIN
	SELECT 
		[PKUser],
		[FKRole],
		[FirstName],
		[LastName],
		[Email],
		[BirthDay]
		FROM SC_Users WITH(NOLOCK) WHERE Available = 1 AND [PKUser] = @PKUser 
END
GO
/****** Object:  StoredProcedure [dbo].[Up_GetUserByRole]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[Up_GetUserByRole]
	@RoleName varchar(50),
	@PKRole int
AS
BEGIN

	SELECT @PKRole = PKRole FROM CT_Roles WITH(NOLOCK) WHERE [Name] = @RoleName AND Available = 1;
		SELECT 
		[PKUser],
		[FKRole],
		[FirstName],
		[LastName],
		[Email],
		[BirthDay]
		FROM SC_Users WITH(NOLOCK) WHERE Available = 1 AND FKRole = @PKRole 
END
GO
/****** Object:  StoredProcedure [dbo].[Up_GetUsers]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_GetUsers]

AS
BEGIN
	SELECT 
		[PKUser],
		[FKRole],
		[FirstName],
		[LastName],
		[Email],
		[BirthDay]
		FROM SC_Users WITH(NOLOCK) WHERE Available = 1
END
GO
/****** Object:  StoredProcedure [dbo].[Up_UpdHistoryTask]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_UpdHistoryTask]
	@FKTask int,
	@FKUser int,
	@Comentary varchar(280),
	@Date datetime
AS
BEGIN
	IF NOT exists(SELECT PKComentary FROM AR_HistoryTask A WITH(NOLOCK) WHERE A.FKTask = @FKTask AND A.FKUser = @FKUser AND A.[Date] = @Date)
	BEGIN
		UPDATE  AR_HistoryTask SET Comentary = @Comentary WHERE FKTask = @FKTask AND FKUser = @FKUser AND [Date] = @Date
		SELECT 1 as resultado
	END
	ELSE
	BEGIN
		SELECT -1 as resultado
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_UpdTask]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_UpdTask]
	@PKTask int,
	@FKAssignedUser int,
	@FKCategory int,
	@FKLastUpdater int,
	@FKCreatorUser int,
	@FKStatus int,
	@Name varchar(100),
	@Description varchar(100),
	@StartDate datetime,
	@EndDate datetime,
	@LastUpdate varchar(100)
AS
BEGIN
	IF NOT exists(SELECT [PKTask] FROM CT_Tasks A WITH(NOLOCK) WHERE A.StartDate = @StartDate AND FKAssignedUser = @FKAssignedUser)
	BEGIN
		 UPDATE  CT_Tasks SET FKAssignedUser = @FKAssignedUser,
		 FKCategory = @FKCategory, FKLastUpdater =  @FKLastUpdater,
		 FKCreatorUser = @FKCreatorUser, FKStatus =  @FKStatus,
		 [Name] = @Name, [Description] =  @Description,
		 StartDate = @StartDate, EndDate =  @EndDate,	 
		 LastUpdate = GETDATE() WHERE PKTask = @PKTask AND Available = 1
		 SELECT 1 as resultado
	END
	ELSE
	BEGIN
		SELECT -1 as resultado
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_UpdUser]    Script Date: 29/05/2023 12:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_UpdUser]
	@FKRole varchar(100),
	@FirstName varchar(100),
	@LastName varchar(100),
	@Email varchar(100),
	@Password varchar(100),
	@BirthDay datetime

AS
BEGIN
	IF NOT exists(SELECT [PKUser] FROM SC_Users A WITH(NOLOCK) WHERE A.Email = @Email)
	BEGIN
		UPDATE  SC_Users SET  FKRole = @FKRole,FirstName = @FirstName,LastName = @LastName, [Password] = @Password, BirthDay =  @BirthDay WHERE Email = @Email
		SELECT 1 as resultado
	END
	ELSE
	BEGIN
		SELECT -1 as resultado
	END
END
GO
USE [master]
GO
ALTER DATABASE [WorkControl] SET  READ_WRITE 
GO
