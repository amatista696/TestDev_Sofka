USE [master]
GO
/****** Object:  Database [Test]    Script Date: 18/12/2021 10:04:49 a. m. ******/
CREATE DATABASE [Test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Test] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [Test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Test] SET  MULTI_USER 
GO
ALTER DATABASE [Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Test] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Test] SET QUERY_STORE = OFF
GO
USE [Test]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 18/12/2021 10:04:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[IATACode] [varchar](5) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[CountryIATACode] [varchar](2) NOT NULL,
	[StateName] [varchar](50) NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[IATACode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 18/12/2021 10:04:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[IATACode] [varchar](2) NOT NULL,
	[Name] [varchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DIANCode] [varchar](50) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[IATACode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdentificationDocuments]    Script Date: 18/12/2021 10:04:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentificationDocuments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](65) NULL,
 CONSTRAINT [PK_IdentificationDocuments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThirdParties]    Script Date: 18/12/2021 10:04:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThirdParties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](200) NULL,
	[LastName] [varchar](200) NULL,
	[DocumentTypeID] [int] NOT NULL,
	[DocumentNumber] [varchar](50) NOT NULL,
	[CityIataCode] [varchar](5) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[FaxNumber] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[MobilePhoneNumber] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[CountryID] [int] NULL,
	[VerificationDigit] [int] NULL,
 CONSTRAINT [PK_ThirdParties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Thirdparties_bogota]    Script Date: 18/12/2021 10:04:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Thirdparties_bogota]
AS 
	SELECT
			FirstName
			,LastName
			,B.Name identification
			,DocumentNumber
			,C.Name city
			,PhoneNumber
			,FaxNumber
			,Address
			,MobilePhoneNumber
			,Email
			,D.Name country
			,VerificationDigit
	FROM Thirdparties A
		INNER JOIN IdentificationDocuments B ON A.DocumentTypeID = B.ID
		INNER JOIN Countries D ON A.CountryID = D.ID
		INNER JOIN Cities C ON A.CityIataCode = C.IATACode AND C.CountryIATACode = D.IATACode
	WHERE c.IATACode = 55  --Bogotá
GO
/****** Object:  View [dbo].[vw_Thirdparties_cali]    Script Date: 18/12/2021 10:04:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_Thirdparties_cali]
AS 
	SELECT
			FirstName
			,LastName
			,B.Name identification
			,DocumentNumber
			,C.Name city
			,PhoneNumber
			,FaxNumber
			,Address
			,MobilePhoneNumber
			,Email
			,D.Name country
			,VerificationDigit
	FROM Thirdparties A
		INNER JOIN IdentificationDocuments B ON A.DocumentTypeID = B.ID
		INNER JOIN Countries D ON A.CountryID = D.ID
		INNER JOIN Cities C ON A.CityIataCode = C.IATACode AND C.CountryIATACode = D.IATACode
	WHERE c.IATACode = 65 --Cali
		and b.ID = 2
GO
/****** Object:  View [dbo].[vw_Thirdparties_Cartgena]    Script Date: 18/12/2021 10:04:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_Thirdparties_Cartgena]
AS 
	SELECT
			FirstName
			,LastName
			,B.Name identification
			,DocumentNumber
			,C.Name city
			,PhoneNumber
			,FaxNumber
			,Address
			,MobilePhoneNumber
			,Email
			,D.Name country
			,VerificationDigit
	FROM Thirdparties A
		INNER JOIN IdentificationDocuments B ON A.DocumentTypeID = B.ID
		INNER JOIN Countries D ON A.CountryID = D.ID
		INNER JOIN Cities C ON A.CityIataCode = C.IATACode AND C.CountryIATACode = D.IATACode
	WHERE c.IATACode = 75 --Cartagena
		and b.ID = 1
		and VerificationDigit = 2
GO
INSERT [dbo].[Cities] ([IATACode], [Name], [CountryIATACode], [StateName]) VALUES (N'11', N'Buenos Aires', N'12', N'')
INSERT [dbo].[Cities] ([IATACode], [Name], [CountryIATACode], [StateName]) VALUES (N'12', N'Guatemala', N'42', N'')
INSERT [dbo].[Cities] ([IATACode], [Name], [CountryIATACode], [StateName]) VALUES (N'22', N'La Paz', N'23', N'')
INSERT [dbo].[Cities] ([IATACode], [Name], [CountryIATACode], [StateName]) VALUES (N'33', N'Brasilia', N'45', N'')
INSERT [dbo].[Cities] ([IATACode], [Name], [CountryIATACode], [StateName]) VALUES (N'44', N'Santiago de Chile', N'45', N'')
INSERT [dbo].[Cities] ([IATACode], [Name], [CountryIATACode], [StateName]) VALUES (N'55', N'Bogotá', N'56', N'')
INSERT [dbo].[Cities] ([IATACode], [Name], [CountryIATACode], [StateName]) VALUES (N'65', N'Cali', N'56', N'')
INSERT [dbo].[Cities] ([IATACode], [Name], [CountryIATACode], [StateName]) VALUES (N'66', N'San José', N'34', N'')
INSERT [dbo].[Cities] ([IATACode], [Name], [CountryIATACode], [StateName]) VALUES (N'75', N'Cartagena', N'56', N'')
INSERT [dbo].[Cities] ([IATACode], [Name], [CountryIATACode], [StateName]) VALUES (N'77', N'La Habana', N'65', N'')
INSERT [dbo].[Cities] ([IATACode], [Name], [CountryIATACode], [StateName]) VALUES (N'88', N'Quito', N'53', N'')
INSERT [dbo].[Cities] ([IATACode], [Name], [CountryIATACode], [StateName]) VALUES (N'99', N'San Salvador', N'24', N'')
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([IATACode], [Name], [ID], [DIANCode]) VALUES (N'12', N'Argentina', 1, N'1')
INSERT [dbo].[Countries] ([IATACode], [Name], [ID], [DIANCode]) VALUES (N'23', N'Bolivia', 2, N'2')
INSERT [dbo].[Countries] ([IATACode], [Name], [ID], [DIANCode]) VALUES (N'24', N'El Salvador', 9, N'9')
INSERT [dbo].[Countries] ([IATACode], [Name], [ID], [DIANCode]) VALUES (N'34', N'Costa Rica', 6, N'6')
INSERT [dbo].[Countries] ([IATACode], [Name], [ID], [DIANCode]) VALUES (N'42', N'Guatemala', 10, N'10')
INSERT [dbo].[Countries] ([IATACode], [Name], [ID], [DIANCode]) VALUES (N'45', N'Brasil', 3, N'3')
INSERT [dbo].[Countries] ([IATACode], [Name], [ID], [DIANCode]) VALUES (N'47', N'Chile', 11, N'4')
INSERT [dbo].[Countries] ([IATACode], [Name], [ID], [DIANCode]) VALUES (N'53', N'Ecuador', 8, N'8')
INSERT [dbo].[Countries] ([IATACode], [Name], [ID], [DIANCode]) VALUES (N'56', N'Colombia', 5, N'5')
INSERT [dbo].[Countries] ([IATACode], [Name], [ID], [DIANCode]) VALUES (N'65', N'Cuba', 7, N'7')
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[IdentificationDocuments] ON 

INSERT [dbo].[IdentificationDocuments] ([ID], [Name]) VALUES (1, N'NIT')
INSERT [dbo].[IdentificationDocuments] ([ID], [Name]) VALUES (2, N'CEDULA')
INSERT [dbo].[IdentificationDocuments] ([ID], [Name]) VALUES (3, N'REG. CIVIL')
INSERT [dbo].[IdentificationDocuments] ([ID], [Name]) VALUES (4, N'TJ. IDENTIDAD')
INSERT [dbo].[IdentificationDocuments] ([ID], [Name]) VALUES (5, N'C. EXTRANJERIA')
SET IDENTITY_INSERT [dbo].[IdentificationDocuments] OFF
GO
SET IDENTITY_INSERT [dbo].[ThirdParties] ON 

INSERT [dbo].[ThirdParties] ([ID], [FirstName], [LastName], [DocumentTypeID], [DocumentNumber], [CityIataCode], [PhoneNumber], [FaxNumber], [Address], [MobilePhoneNumber], [Email], [CountryID], [VerificationDigit]) VALUES (7, N'A', N'B', 1, N'123456789', N'11', NULL, NULL, NULL, NULL, NULL, 1, 2)
INSERT [dbo].[ThirdParties] ([ID], [FirstName], [LastName], [DocumentTypeID], [DocumentNumber], [CityIataCode], [PhoneNumber], [FaxNumber], [Address], [MobilePhoneNumber], [Email], [CountryID], [VerificationDigit]) VALUES (8, N'A', N'B', 2, N'79135806', N'11', NULL, NULL, NULL, NULL, NULL, 1, 7)
INSERT [dbo].[ThirdParties] ([ID], [FirstName], [LastName], [DocumentTypeID], [DocumentNumber], [CityIataCode], [PhoneNumber], [FaxNumber], [Address], [MobilePhoneNumber], [Email], [CountryID], [VerificationDigit]) VALUES (10, N'Ana', N'Lopez', 1, N'1234556', N'11', N'098766', N'9876', N'cra 1 # 1 -1', N'3195678999', N'aaa@aaa.com', 1, 0)
INSERT [dbo].[ThirdParties] ([ID], [FirstName], [LastName], [DocumentTypeID], [DocumentNumber], [CityIataCode], [PhoneNumber], [FaxNumber], [Address], [MobilePhoneNumber], [Email], [CountryID], [VerificationDigit]) VALUES (11, N'Anan', N'Lopez', 3, N'35345345', N'22', N'098766', N'9876', N'cra 1 # 1 -1', N'3195678999', N'aaa@aaa.com', 0, 0)
INSERT [dbo].[ThirdParties] ([ID], [FirstName], [LastName], [DocumentTypeID], [DocumentNumber], [CityIataCode], [PhoneNumber], [FaxNumber], [Address], [MobilePhoneNumber], [Email], [CountryID], [VerificationDigit]) VALUES (12, N'Anann', N'Lopez', 1, N'35345345', N'22', N'098766', N'9876', N'cra 1 # 1 -1', N'3195678999', N'aaa@aaa.com', 0, 6)
INSERT [dbo].[ThirdParties] ([ID], [FirstName], [LastName], [DocumentTypeID], [DocumentNumber], [CityIataCode], [PhoneNumber], [FaxNumber], [Address], [MobilePhoneNumber], [Email], [CountryID], [VerificationDigit]) VALUES (13, N'Prueba', N'DOS', 2, N'123456', N'12', N'123456', N'123456', N'123456', N'123456', N'123456', 10, 0)
SET IDENTITY_INSERT [dbo].[ThirdParties] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ThirdParties]    Script Date: 18/12/2021 10:04:49 a. m. ******/
ALTER TABLE [dbo].[ThirdParties] ADD  CONSTRAINT [IX_ThirdParties] UNIQUE NONCLUSTERED 
(
	[DocumentTypeID] ASC,
	[DocumentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([CountryIATACode])
REFERENCES [dbo].[Countries] ([IATACode])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[ThirdParties]  WITH NOCHECK ADD  CONSTRAINT [FK_ThirdParties_Cities] FOREIGN KEY([CityIataCode])
REFERENCES [dbo].[Cities] ([IATACode])
GO
ALTER TABLE [dbo].[ThirdParties] CHECK CONSTRAINT [FK_ThirdParties_Cities]
GO
ALTER TABLE [dbo].[ThirdParties]  WITH NOCHECK ADD  CONSTRAINT [FK_ThirdParties_IdentificationDocuments] FOREIGN KEY([DocumentTypeID])
REFERENCES [dbo].[IdentificationDocuments] ([ID])
GO
ALTER TABLE [dbo].[ThirdParties] CHECK CONSTRAINT [FK_ThirdParties_IdentificationDocuments]
GO
/****** Object:  StoredProcedure [dbo].[spi_insert_Thirdparties]    Script Date: 18/12/2021 10:04:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC spi_insert_Thirdparties 'A','B',1
CREATE    procedure [dbo].[spi_insert_Thirdparties] (
	 @FirstName	varchar	(200)
	,@LastName	varchar	(200)
	,@DocumentTypeID	int	
	,@DocumentNumber	varchar	(50)
	,@CityIataCode	varchar	(5)
	,@PhoneNumber	varchar	(50)
	,@FaxNumber	varchar	(50)
	,@Address	varchar	(100)
	,@MobilePhoneNumber	varchar	(50)
	,@Email	varchar	(50)
	,@CountryID	int		
)
as
	set nocount on

	DECLARE @VerificationDigit	int	 = 0
	DECLARE @VAR1 INT, @VAR2 INT, @VAR3 INT

	IF @DocumentTypeID  = 2 --CEDULA
	BEGIN 
		SELECT @VAR1 = SUBSTRING(@DocumentNumber,1,3)
		SELECT @VAR2 =  SUBSTRING(@DocumentNumber,LEN(@DocumentNumber)-2,LEN(@DocumentNumber))
		SELECT @VAR3 = @VAR1  + @VAR2
		SELECT @VerificationDigit = SUBSTRING (cast(@VAR3 as varchar(20)),LEN(@VAR3),LEN(@VAR3))
	END

	IF @DocumentTypeID  = 1 --NIT
	BEGIN 
		SET @VAR1=1
		SET @VAR2=0
		WHILE (@VAR1 <= LEN(@DocumentNumber))
		BEGIN			
			SELECT @VAR2 = @VAR2  + SUBSTRING(@DocumentNumber,@VAR1,1)
			SET @VAR1 = @VAR1  +1
		END  
		SET @VAR3 = @VAR2 / 2
		SELECT @VerificationDigit = SUBSTRING (cast(@VAR3 as varchar(20)),LEN(@VAR3),LEN(@VAR3))
	END	

	INSERT INTO Thirdparties (		
			FirstName
			,LastName
			,DocumentTypeID
			,DocumentNumber
			,CityIataCode
			,PhoneNumber
			,FaxNumber
			,Address
			,MobilePhoneNumber
			,Email
			,CountryID
			,VerificationDigit)
		VALUES(
			@FirstName
			,@LastName
			,@DocumentTypeID
			,@DocumentNumber
			,@CityIataCode
			,@PhoneNumber
			,@FaxNumber
			,@Address
			,@MobilePhoneNumber
			,@Email
			,@CountryID
			,@VerificationDigit	)
	
	
	return 0
GO
/****** Object:  StoredProcedure [dbo].[spi_select_Thirdparties]    Script Date: 18/12/2021 10:04:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    procedure [dbo].[spi_select_Thirdparties] 
as
	set nocount on

	SELECT
			FirstName
			,LastName
			,B.Name
			,DocumentNumber
			,C.Name
			,PhoneNumber
			,FaxNumber
			,Address
			,MobilePhoneNumber
			,Email
			,D.Name
			,VerificationDigit
	FROM Thirdparties A
		INNER JOIN IdentificationDocuments B ON A.DocumentTypeID = B.ID
		INNER JOIN Countries D ON A.CountryID = D.ID
		INNER JOIN Cities C ON A.CityIataCode = C.IATACode AND C.CountryIATACode = D.IATACode
		
	return 0
GO
USE [master]
GO
ALTER DATABASE [Test] SET  READ_WRITE 
GO
