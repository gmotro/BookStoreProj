USE [master]
GO
/****** Object:  Database [Bookstore]    Script Date: 10/1/2014 11:00:40 PM ******/
CREATE DATABASE [Bookstore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bookstore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS14\MSSQL\DATA\Bookstore.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Bookstore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS14\MSSQL\DATA\Bookstore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Bookstore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bookstore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bookstore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bookstore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bookstore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bookstore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bookstore] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bookstore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bookstore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bookstore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bookstore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bookstore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bookstore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bookstore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bookstore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bookstore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bookstore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bookstore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bookstore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bookstore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bookstore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bookstore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bookstore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bookstore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bookstore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bookstore] SET  MULTI_USER 
GO
ALTER DATABASE [Bookstore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bookstore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bookstore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bookstore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Bookstore] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Bookstore]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 10/1/2014 11:00:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorFirstName] [varchar](30) NULL,
	[AuthorLastName] [varchar](30) NULL,
	[Author_DOB] [date] NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Book]    Script Date: 10/1/2014 11:00:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[PublisherID] [int] NOT NULL,
	[GenreID] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 10/1/2014 11:00:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 10/1/2014 11:00:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Publisher](
	[PublisherID] [int] IDENTITY(1,1) NOT NULL,
	[PublisherName] [varchar](100) NOT NULL,
	[Address1] [varchar](200) NULL,
	[Address2] [varchar](200) NULL,
	[City] [varchar](200) NULL,
	[State] [varchar](50) NULL,
	[ZipCode] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Wrote]    Script Date: 10/1/2014 11:00:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wrote](
	[WroteID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
 CONSTRAINT [PK_Wrote] PRIMARY KEY CLUSTERED 
(
	[WroteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

GO
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (1, N'Comedy')
GO
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (2, N'Drama')
GO
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (3, N'Fantasy')
GO
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (4, N'Nonfiction')
GO
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (5, N'Novel')
GO
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (6, N'Poetry')
GO
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (7, N'Romance')
GO
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (8, N'Satire')
GO
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (9, N'Tragedy')
GO
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[Publisher] ON 

GO
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address1], [Address2], [City], [State], [ZipCode], [Phone]) VALUES (1, N'Pearson', N'3874 Burning Woods', NULL, N'Neverfail', N'NY', N'13125', N'5165218241')
GO
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address1], [Address2], [City], [State], [ZipCode], [Phone]) VALUES (2, N'Reed Elsevier', N'7863 Easy Autumn Walk', NULL, N'Alice Beach', N'HI', N'96865', N'8088736787')
GO
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address1], [Address2], [City], [State], [ZipCode], [Phone]) VALUES (3, N'Random House', N'3852 Cinder Creek Vale', N'Suite 100', N'Hard Rocks', N'NY', N'13724', N'9144841232')
GO
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address1], [Address2], [City], [State], [ZipCode], [Phone]) VALUES (4, N'McGraw-Hill', N'3644 Grand Panda Pathway', NULL, N'Sugar Land', N'TX', N'78824', N'9567826178')
GO
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address1], [Address2], [City], [State], [ZipCode], [Phone]) VALUES (5, N'Scholastic', N'3664 Rustic Pond Grounds', NULL, N'Otter Hole', N'MA', N'02784', N'3394780593')
GO
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address1], [Address2], [City], [State], [ZipCode], [Phone]) VALUES (6, N'Cengage', N'4314 Jagged Sky Turnabout', NULL, N'Dovetail', N'SC', N'29555', N'8649052994')
GO
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address1], [Address2], [City], [State], [ZipCode], [Phone]) VALUES (7, N'ThomsonReuters', N'9424 Dusty Elk Green', N'1st Floor', N'Dipple', N'FL', N'32186', N'8509832323')
GO
INSERT [dbo].[Publisher] ([PublisherID], [PublisherName], [Address1], [Address2], [City], [State], [ZipCode], [Phone]) VALUES (8, N'Wiley', N'8512 Grand Spring Harbour', NULL, N'Cornerton', N'CA', N'98137', N'9188486313')
GO
SET IDENTITY_INSERT [dbo].[Publisher] OFF
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Genre] FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genre] ([GenreID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Genre]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Publisher] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[Publisher] ([PublisherID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Publisher]
GO
ALTER TABLE [dbo].[Wrote]  WITH CHECK ADD  CONSTRAINT [FK_Wrote_Author] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([AuthorID])
GO
ALTER TABLE [dbo].[Wrote] CHECK CONSTRAINT [FK_Wrote_Author]
GO
ALTER TABLE [dbo].[Wrote]  WITH CHECK ADD  CONSTRAINT [FK_Wrote_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Wrote] CHECK CONSTRAINT [FK_Wrote_Book]
GO
USE [master]
GO
ALTER DATABASE [Bookstore] SET  READ_WRITE 
GO
