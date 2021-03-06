USE [master]
GO
/****** Object:  Database [tenhourDB]    Script Date: 2/28/2019 11:58:22 PM ******/
CREATE DATABASE [tenhourDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tenhourDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\tenhourDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'tenhourDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\tenhourDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tenhourDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tenhourDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tenhourDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tenhourDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tenhourDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tenhourDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [tenhourDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tenhourDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [tenhourDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tenhourDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tenhourDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tenhourDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tenhourDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tenhourDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tenhourDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tenhourDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tenhourDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tenhourDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tenhourDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tenhourDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tenhourDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tenhourDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tenhourDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tenhourDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tenhourDB] SET RECOVERY FULL 
GO
ALTER DATABASE [tenhourDB] SET  MULTI_USER 
GO
ALTER DATABASE [tenhourDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tenhourDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tenhourDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tenhourDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'tenhourDB', N'ON'
GO
USE [tenhourDB]
GO
/****** Object:  Table [dbo].[activity]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activity](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[loginTime] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[blogPost]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blogPost](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[slug] [nvarchar](200) NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[content] [nvarchar](max) NULL,
	[date] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NULL,
	[image] [nvarchar](140) NULL,
	[category] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[buyTbl]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[buyTbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userEmail] [nvarchar](120) NOT NULL,
	[packageID] [nvarchar](10) NOT NULL,
	[payBy] [nvarchar](50) NULL,
	[payment] [nvarchar](10) NOT NULL,
	[date] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[category]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[slug] [nvarchar](100) NOT NULL,
	[content] [nvarchar](500) NULL,
	[date] [nvarchar](50) NULL,
	[category] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[contactMessage]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactMessage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](260) NOT NULL,
	[email] [nvarchar](250) NOT NULL,
	[phone] [nvarchar](250) NOT NULL,
	[subject] [nvarchar](max) NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[date] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[course]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[insID] [nvarchar](50) NULL,
	[courseName] [nvarchar](60) NULL,
	[slug] [nvarchar](60) NULL,
	[description] [nvarchar](2000) NULL,
	[coverImage] [nvarchar](130) NULL,
	[video] [nvarchar](50) NULL,
	[level] [nvarchar](20) NULL,
	[price] [nvarchar](10) NULL,
	[releaseDate] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[forumPost]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[forumPost](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[topic] [nvarchar](5) NULL,
	[name] [nvarchar](200) NULL,
	[desca] [varchar](max) NULL,
	[postby] [nvarchar](5) NULL,
	[date] [nvarchar](100) NULL,
	[status] [nvarchar](50) NULL,
	[slug] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lessonHistory]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lessonHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseName] [nvarchar](160) NOT NULL,
	[lessonName] [nvarchar](160) NOT NULL,
	[userid] [nvarchar](10) NOT NULL,
	[date] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lessonTbl]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lessonTbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[couID] [nvarchar](30) NOT NULL,
	[insID] [nvarchar](30) NOT NULL,
	[lessionName] [nvarchar](250) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[subject] [nvarchar](100) NOT NULL,
	[slug] [nvarchar](250) NOT NULL,
	[timeMin] [nvarchar](3) NOT NULL,
	[timeSec] [nvarchar](3) NOT NULL,
	[coverImage] [nvarchar](200) NULL,
	[video] [nvarchar](200) NULL,
	[date] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[members]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[members](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](100) NULL,
	[username] [nvarchar](120) NOT NULL,
	[email] [nvarchar](120) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[status] [nvarchar](2) NOT NULL,
	[expire] [nvarchar](50) NOT NULL,
	[token] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[packages]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[packages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](120) NOT NULL,
	[subTitle] [nvarchar](100) NULL,
	[condition] [nvarchar](120) NULL,
	[amount] [nvarchar](10) NOT NULL,
	[duration] [nvarchar](10) NOT NULL,
	[features] [nvarchar](400) NULL,
	[slug] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[podcast]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[podcast](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [nvarchar](10) NULL,
	[name] [nvarchar](120) NULL,
	[description] [nchar](400) NOT NULL,
	[Filelocation] [nvarchar](100) NULL,
	[date] [nvarchar](50) NULL,
	[slug] [nvarchar](120) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[postComment]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postComment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[postid] [nvarchar](5) NULL,
	[byUser] [nvarchar](5) NULL,
	[comment] [nvarchar](max) NULL,
	[status] [nvarchar](5) NULL,
	[date] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[postView]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postView](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[postid] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stuffTbl]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stuffTbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NULL,
	[description] [nvarchar](max) NULL,
	[cover] [nchar](200) NULL,
	[video] [nchar](200) NULL,
	[slug] [nvarchar](max) NULL,
	[date] [nchar](70) NULL,
	[userID] [nchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[subjectCourse]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subjectCourse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](80) NULL,
	[description] [nvarchar](400) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[topics]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[userTbl]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userTbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[loginID] [nvarchar](50) NOT NULL,
	[loginPassword] [nvarchar](50) NOT NULL,
	[imageProfile] [nvarchar](50) NULL,
	[role] [nvarchar](2) NOT NULL,
	[createDate] [nvarchar](50) NOT NULL,
	[twitter] [nvarchar](120) NULL,
	[about] [nvarchar](800) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[visit]    Script Date: 2/28/2019 11:58:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[visit] [nchar](10) NULL,
	[date] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[activity] ON 

INSERT [dbo].[activity] ([id], [userID], [loginTime]) VALUES (1, N'8', N'11/26/2018 3:46:59 PM')
INSERT [dbo].[activity] ([id], [userID], [loginTime]) VALUES (2, N'8', N'11/26/2018 3:47:15 PM')
INSERT [dbo].[activity] ([id], [userID], [loginTime]) VALUES (3, N'8', N'11/26/2018 10:51:45 PM')
INSERT [dbo].[activity] ([id], [userID], [loginTime]) VALUES (4, N'8', N'11/27/2018 7:53:58 PM')
INSERT [dbo].[activity] ([id], [userID], [loginTime]) VALUES (5, N'5', N'12/20/2018 8:21:41 PM')
INSERT [dbo].[activity] ([id], [userID], [loginTime]) VALUES (6, N'8', N'1/16/2019 4:22:28 PM')
INSERT [dbo].[activity] ([id], [userID], [loginTime]) VALUES (7, N'8', N'1/16/2019 5:03:39 PM')
INSERT [dbo].[activity] ([id], [userID], [loginTime]) VALUES (8, N'8', N'1/16/2019 5:12:20 PM')
INSERT [dbo].[activity] ([id], [userID], [loginTime]) VALUES (9, N'8', N'1/16/2019 9:49:04 PM')
INSERT [dbo].[activity] ([id], [userID], [loginTime]) VALUES (10, N'8', N'1/16/2019 9:54:22 PM')
INSERT [dbo].[activity] ([id], [userID], [loginTime]) VALUES (11, N'8', N'2/22/2019 9:28:59 PM')
SET IDENTITY_INSERT [dbo].[activity] OFF
SET IDENTITY_INSERT [dbo].[blogPost] ON 

INSERT [dbo].[blogPost] ([id], [slug], [title], [content], [date], [userID], [image], [category]) VALUES (5, N'How-To-Play-Guitar-With-Friends', N'How To Play Guitar With Friends', N'<!DOCTYPE html>
<html>
<head>
</head>
<body>
<h1 style="color: #626262;"><span style="font-weight: bold;">How To Play Guitar With Friends</span></h1>
<p style="color: #626262;"><img src="https://clapway.com/wp-content/uploads/2016/08/9.-weather-2.jpg" alt="" width="482" height="263" /></p>
<h5 style="color: #626262;"><span style="color: #000000; font-family: ''Open Sans'', Arial, sans-serif; text-align: justify; background-color: #ffffff;">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></h5>
<p style="color: #626262;"><span style="color: #000000; font-family: ''Open Sans'', Arial, sans-serif; text-align: justify; background-color: #ffffff;">12/20/2018</span></p>
</body>
</html>', N'20-12-2018', N'4', N'blog_075201201220189.-weather-2.jpg', N'1')
SET IDENTITY_INSERT [dbo].[blogPost] OFF
SET IDENTITY_INSERT [dbo].[buyTbl] ON 

INSERT [dbo].[buyTbl] ([id], [userEmail], [packageID], [payBy], [payment], [date]) VALUES (8, N'umer.mindaqua@gmail.com', N'4', N'', N'34', N'12/5/2018')
INSERT [dbo].[buyTbl] ([id], [userEmail], [packageID], [payBy], [payment], [date]) VALUES (1002, N'umer123@gmail.com', N'2', N'', N'24', N'12/19/2018')
INSERT [dbo].[buyTbl] ([id], [userEmail], [packageID], [payBy], [payment], [date]) VALUES (1003, N'zeeshan@gmail.com', N'2', N'', N'24', N'12/20/2018')
SET IDENTITY_INSERT [dbo].[buyTbl] OFF
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [title], [slug], [content], [date], [category]) VALUES (1, N'Guitar', N'Guitar', N'This is Guitar  Categories', N'20-12-2018', NULL)
INSERT [dbo].[category] ([id], [title], [slug], [content], [date], [category]) VALUES (2, N'Piano', N'Piano', N'This is Piano Category', N'20-12-2018', NULL)
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[contactMessage] ON 

INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (1, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Syed Umer', N'Syed Umer', N'8-1-2019')
INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (2, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Subject Working', N'Your Content Very Good. I m Happy To See This :)', N'8-1-2019')
INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (3, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Subject Working', N'Your Content Very Nice.... :)', N'8-1-2019')
INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (4, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Subject Working', N'Your Content Very Nice.... :)', N'8-1-2019')
INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (5, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Subject Working', N'Your Content Very Nice.... :)', N'8-1-2019')
INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (6, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Subject Working', N'Your Content Very Nice.... :)', N'8-1-2019')
INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (7, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Subject Working', N'Your Content Very Nice.... :)', N'8-1-2019')
INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (8, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Subject Working', N'Your Content Very Nice.... :)', N'8-1-2019')
INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (9, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Subject Working', N'Your Content Very Nice.... :)', N'8-1-2019')
INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (10, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Subject Working', N'Your Content Very Nice.... :)', N'8-1-2019')
INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (11, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Subject Working', N'xXSDdsasasdasdasdsd', N'8-1-2019')
INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (12, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Subject Working', N'xXSDdsasasdasdasdsd', N'8-1-2019')
INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (13, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Subject Working', N'xXSDdsasasdasdasdsd', N'8-1-2019')
INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (14, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Subject Working', N'xXSDdsasasdasdasdsd', N'8-1-2019')
INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (15, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Subject Working', N'xXSDdsasasdasdasdsd', N'8-1-2019')
INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (16, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Subject Working', N'xXSDdsasasdasdasdsd', N'8-1-2019')
INSERT [dbo].[contactMessage] ([id], [name], [email], [phone], [subject], [message], [date]) VALUES (17, N'Syed Umer', N'syedumer@gmail.com', N'4342434235', N'Subject Working', N'dqsdqweqe1qwqdfv1wqwdqwdqwdqwdqwddqwddqwdqdddqwqwd d qwd qwdqw d qd qwd qd qw dqw dqw d qwd qwd qwd q   v d fsdf sdfsdfasdfasdfsd fsdf sdf sdf sd fsd fsd fsd fsd f sdf qwefq cqec SDCAS C Ev ad casdfsfasc adasdf sadv asd j j', N'8-1-2019')
SET IDENTITY_INSERT [dbo].[contactMessage] OFF
SET IDENTITY_INSERT [dbo].[course] ON 

INSERT [dbo].[course] ([id], [insID], [courseName], [slug], [description], [coverImage], [video], [level], [price], [releaseDate]) VALUES (18, N'4', N'The Campus Quick Start Guide', N'The-Campus-Quick-Start-Guide', N'Whether you are new to The Academy or you’ve been here a while, The Campus can be a little overwhelming as there’s simply so much cool stuff happening in there!

In this course you''ll be taken through everything you need to know to get yourself involved in our awesome community.

In This Course You’re Going to Learn About:

Effective navigation through the Campus
Creating topics, posts and how to edit them
Tagging and liking content
Notifications and keeping track of all your content
Private messaging
Editing your profile & signature
Search functionality and status updates
Asking questions & getting help
Creating a practice log
And much more', N'09242720112018campus-quick-start-guide.png', N'https://www.youtube.com/embed/RK1K2bCg4J8', N'Basic', N'', N'11/20/2018 8:37:41 PM')
INSERT [dbo].[course] ([id], [insID], [courseName], [slug], [description], [coverImage], [video], [level], [price], [releaseDate]) VALUES (19, N'4', N'Demo Title', N'Demo-Title', N'Demo Content ', N'09252720112018home.jpg', N'https://www.youtube.com/embed/RK1K2bCg4J8', N'Intermediate', N'', N'11/20/2018 9:25:20 PM')
INSERT [dbo].[course] ([id], [insID], [courseName], [slug], [description], [coverImage], [video], [level], [price], [releaseDate]) VALUES (22, N'8', N'An Introduction to Slap Bass', N'An-Introduction-to-Slap-Bass', N'Demo Video ', N'02264423112018music.PNG', N'https://www.youtube.com/embed/RK1K2bCg4J8', N'Basic', N'', N'11/23/2018 2:26:44 PM')
SET IDENTITY_INSERT [dbo].[course] OFF
SET IDENTITY_INSERT [dbo].[forumPost] ON 

INSERT [dbo].[forumPost] ([id], [topic], [name], [desca], [postby], [date], [status], [slug]) VALUES (5, N'2', N'How Play Guitar', N'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.', N'16', N'18-12-2018', N'1', N'How-Play-Guitar')
INSERT [dbo].[forumPost] ([id], [topic], [name], [desca], [postby], [date], [status], [slug]) VALUES (6, N'4', N'How To Set Initial Guitar', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', N'16', N'18-12-2018', N'0', N'How-To-Set-Initial-Guitar')
INSERT [dbo].[forumPost] ([id], [topic], [name], [desca], [postby], [date], [status], [slug]) VALUES (7, N'3', N'How To Set Initial Guitar A', N'sdasfadasda', N'1012', N'19-12-2018', N'0', N'How-To-Set-Initial-Guitar-A')
SET IDENTITY_INSERT [dbo].[forumPost] OFF
SET IDENTITY_INSERT [dbo].[lessonHistory] ON 

INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (1, N'jazz Guitar ', N'Lesson For music ', N'11', N'12/5/2018 10:19:52 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (2, N'Demo Title', N'Music Staff Working', N'11', N'12/5/2018 10:27:00 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (3, N'jazz Guitar ', N'Kraft Music Yamaha Tyros Demo with Peter Baartmans', N'11', N'12/5/2018 10:27:21 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (4, N'jazz Guitar ', N'Kraft Music Yamaha Tyros Demo with Peter Baartmans', N'16', N'12/5/2018 10:53:05 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (5, N'jazz Guitar ', N'Lesson For music ', N'16', N'12/5/2018 10:53:21 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (1002, N'jazz Guitar ', N'Kraft Music Yamaha Tyros Demo with Peter Baartmans', N'16', N'12/17/2018 6:24:48 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (1003, N'jazz Guitar ', N'Lesson For music ', N'16', N'12/17/2018 6:24:56 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (1004, N'jazz Guitar ', N'Kraft Music Yamaha Tyros Demo with Peter Baartmans', N'16', N'12/17/2018 6:27:06 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (1005, N'jazz Guitar ', N'Lesson For music ', N'16', N'12/17/2018 6:28:16 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (1006, N'Demo Title', N'Music Staff Working', N'16', N'12/17/2018 6:35:31 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (1007, N'jazz Guitar ', N'Lesson For music ', N'16', N'12/17/2018 6:35:32 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (1008, N'Demo Title', N'Music Staff Working', N'16', N'12/17/2018 6:35:45 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (1009, N'jazz Guitar ', N'Lesson For music ', N'16', N'12/17/2018 6:35:46 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (1010, N'jazz Guitar ', N'Lesson For music ', N'16', N'12/17/2018 6:35:58 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (1011, N'Demo Title', N'Music Staff Working', N'16', N'12/17/2018 6:36:04 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (1012, N'jazz Guitar ', N'Lesson For music ', N'1012', N'1/5/2019 6:55:30 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (1013, N'jazz Guitar ', N'Kraft Music Yamaha Tyros Demo with Peter Baartmans', N'1012', N'1/5/2019 6:55:39 PM')
INSERT [dbo].[lessonHistory] ([id], [courseName], [lessonName], [userid], [date]) VALUES (2012, N'Demo Title', N'Music Staff Working', N'1012', N'1/25/2019 4:37:16 PM')
SET IDENTITY_INSERT [dbo].[lessonHistory] OFF
SET IDENTITY_INSERT [dbo].[lessonTbl] ON 

INSERT [dbo].[lessonTbl] ([id], [couID], [insID], [lessionName], [description], [subject], [slug], [timeMin], [timeSec], [coverImage], [video], [date]) VALUES (1, N'19', N'4', N'Music Staff Working', N'Music Staff Working Demo Video', N'Jazz Guitar', N'Music-Staff-Working', N'3', N'3', N'07462722112018music.PNG', N'https://www.youtube.com/embed/xsnR9AoSPTA', N'22-11-2018')
INSERT [dbo].[lessonTbl] ([id], [couID], [insID], [lessionName], [description], [subject], [slug], [timeMin], [timeSec], [coverImage], [video], [date]) VALUES (2, N'21', N'8', N'Lesson For music ', N'Demo Video Music Lesson', N'Pop Music', N'Lesson-For-music-', N'5', N'6', N'lesson_11005022112018music.PNG', N'https://www.youtube.com/embed/wAfbTvEeMmw', N'22-11-2018')
INSERT [dbo].[lessonTbl] ([id], [couID], [insID], [lessionName], [description], [subject], [slug], [timeMin], [timeSec], [coverImage], [video], [date]) VALUES (3, N'21', N'8', N'Kraft Music Yamaha Tyros Demo with Peter Baartmans', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', N'Pop Music', N'Kraft-Music-Yamaha-Tyros-Demo-with-Peter-Baartmans', N'12', N'40', N'lesson_04241124112018musci.PNG', N'https://www.youtube.com/embed/V75-aOKvL0U', N'24-11-2018')
SET IDENTITY_INSERT [dbo].[lessonTbl] OFF
SET IDENTITY_INSERT [dbo].[members] ON 

INSERT [dbo].[members] ([id], [image], [username], [email], [password], [status], [expire], [token]) VALUES (16, N'avatar2.jpg', N'Demo User ', N'umer.mindaqua@gmail.com', N'21232f297a57a5a743894a0e4a801fc3', N'1', N'12/5/2019', N'')
INSERT [dbo].[members] ([id], [image], [username], [email], [password], [status], [expire], [token]) VALUES (1012, N'', N'Syed Umer', N'umer123@gmail.com', N'21232f297a57a5a743894a0e4a801fc3', N'1', N'12/19/2019', NULL)
INSERT [dbo].[members] ([id], [image], [username], [email], [password], [status], [expire], [token]) VALUES (1013, N'member_1139071612019Aviary Stock Photo 2.png', N'zeeshan Khan', N'zeeshan@gmail.com', N'21232f297a57a5a743894a0e4a801fc3', N'1', N'12/20/2019', NULL)
SET IDENTITY_INSERT [dbo].[members] OFF
SET IDENTITY_INSERT [dbo].[packages] ON 

INSERT [dbo].[packages] ([id], [title], [subTitle], [condition], [amount], [duration], [features], [slug]) VALUES (4, N'Sliver', N'Sliver Package Details', N'No Condition', N'34', N'Year', N'sliver features,guitarist worker', N'Sliver')
SET IDENTITY_INSERT [dbo].[packages] OFF
SET IDENTITY_INSERT [dbo].[postComment] ON 

INSERT [dbo].[postComment] ([id], [postid], [byUser], [comment], [status], [date]) VALUES (4, N'5', N'16', N'Hesdfsdfsdfsdfsdf', N'0', N'19-12-2018')
INSERT [dbo].[postComment] ([id], [postid], [byUser], [comment], [status], [date]) VALUES (5, N'5', N'16', N'asdadadasd', N'0', N'19-12-2018')
INSERT [dbo].[postComment] ([id], [postid], [byUser], [comment], [status], [date]) VALUES (6, N'5', N'16', N'asdadadasd', N'0', N'19-12-2018')
INSERT [dbo].[postComment] ([id], [postid], [byUser], [comment], [status], [date]) VALUES (7, N'5', N'16', N'First You Guitar', N'0', N'19-12-2018')
INSERT [dbo].[postComment] ([id], [postid], [byUser], [comment], [status], [date]) VALUES (8, N'6', N'16', N'sadasdasdasdasdas', N'1', N'19-12-2018')
INSERT [dbo].[postComment] ([id], [postid], [byUser], [comment], [status], [date]) VALUES (9, N'6', N'16', N'First You Guitar For Play', N'0', N'19-12-2018')
INSERT [dbo].[postComment] ([id], [postid], [byUser], [comment], [status], [date]) VALUES (10, N'6', N'16', N'Platy Guitar Al Home', N'0', N'19-12-2018')
INSERT [dbo].[postComment] ([id], [postid], [byUser], [comment], [status], [date]) VALUES (11, N'5', N'1012', N'It''s wrong', N'1', N'19-12-2018')
INSERT [dbo].[postComment] ([id], [postid], [byUser], [comment], [status], [date]) VALUES (12, N'5', N'16', N'Thanks To All Persons', N'0', N'20-12-2018')
INSERT [dbo].[postComment] ([id], [postid], [byUser], [comment], [status], [date]) VALUES (13, N'7', N'16', N'Please Give Me A Comments', N'0', N'20-12-2018')
INSERT [dbo].[postComment] ([id], [postid], [byUser], [comment], [status], [date]) VALUES (14, N'7', N'16', N'Umer===sdasdasdasdasdasdas', N'1', N'20-12-2018')
SET IDENTITY_INSERT [dbo].[postComment] OFF
SET IDENTITY_INSERT [dbo].[postView] ON 

INSERT [dbo].[postView] ([id], [postid]) VALUES (1, N'5')
INSERT [dbo].[postView] ([id], [postid]) VALUES (2, N'5')
INSERT [dbo].[postView] ([id], [postid]) VALUES (3, N'5')
INSERT [dbo].[postView] ([id], [postid]) VALUES (4, N'5')
INSERT [dbo].[postView] ([id], [postid]) VALUES (5, N'5')
INSERT [dbo].[postView] ([id], [postid]) VALUES (6, N'5')
INSERT [dbo].[postView] ([id], [postid]) VALUES (7, N'5')
INSERT [dbo].[postView] ([id], [postid]) VALUES (8, N'5')
INSERT [dbo].[postView] ([id], [postid]) VALUES (9, N'5')
SET IDENTITY_INSERT [dbo].[postView] OFF
SET IDENTITY_INSERT [dbo].[stuffTbl] ON 

INSERT [dbo].[stuffTbl] ([id], [name], [description], [cover], [video], [slug], [date], [userID]) VALUES (2, N'How To Play Guitar ', N'How To Play Guitar With Video', N'1024331612019Aviary Stock Photo 1.png                                                                                                                                                                   ', N'https://www.youtube.com/embed/wAfbTvEeMmw                                                                                                                                                               ', N'How-To-Play-Guitar-', N'1/16/2019 10:24:33 PM                                                 ', N'7                                                                               ')
SET IDENTITY_INSERT [dbo].[stuffTbl] OFF
SET IDENTITY_INSERT [dbo].[subjectCourse] ON 

INSERT [dbo].[subjectCourse] ([id], [name], [description]) VALUES (1, N'Guitar', N'Guitar Tutorials')
INSERT [dbo].[subjectCourse] ([id], [name], [description]) VALUES (2, N'Jazz Guitar', N'Guitar Tutorials')
INSERT [dbo].[subjectCourse] ([id], [name], [description]) VALUES (3, N'Pop Music', N'')
SET IDENTITY_INSERT [dbo].[subjectCourse] OFF
SET IDENTITY_INSERT [dbo].[topics] ON 

INSERT [dbo].[topics] ([id], [name]) VALUES (1, N'Beginner')
INSERT [dbo].[topics] ([id], [name]) VALUES (2, N'General')
INSERT [dbo].[topics] ([id], [name]) VALUES (3, N'Technique')
INSERT [dbo].[topics] ([id], [name]) VALUES (4, N'Music Theory')
INSERT [dbo].[topics] ([id], [name]) VALUES (5, N'Gear')
SET IDENTITY_INSERT [dbo].[topics] OFF
SET IDENTITY_INSERT [dbo].[userTbl] ON 

INSERT [dbo].[userTbl] ([id], [name], [loginID], [loginPassword], [imageProfile], [role], [createDate], [twitter], [about]) VALUES (4, N'umer', N'umer@gmail.com', N'21232f297a57a5a743894a0e4a801fc3', N'user_10194622112018profile.png', N'0', N'11/19/2018 12:56:37 PM', NULL, NULL)
INSERT [dbo].[userTbl] ([id], [name], [loginID], [loginPassword], [imageProfile], [role], [createDate], [twitter], [about]) VALUES (7, N'My Admin', N'admin@gmail.com', N'21232f297a57a5a743894a0e4a801fc3', N'user_10183322112018logo1.jpg', N'0', N'22-11-2018', NULL, NULL)
INSERT [dbo].[userTbl] ([id], [name], [loginID], [loginPassword], [imageProfile], [role], [createDate], [twitter], [about]) VALUES (8, N'inman', N'inman@gmail.com', N'21232f297a57a5a743894a0e4a801fc3', N'user_10274222112018portfolio16.jpg', N'1', N'22-11-2018', NULL, NULL)
INSERT [dbo].[userTbl] ([id], [name], [loginID], [loginPassword], [imageProfile], [role], [createDate], [twitter], [about]) VALUES (9, N'User Name', N'user@gmail.com', N'21232f297a57a5a743894a0e4a801fc3', N'user_02201226112018Aviary Stock Photo 3.png', N'0', N'26-11-2018', N'', N'I m User')
SET IDENTITY_INSERT [dbo].[userTbl] OFF
SET IDENTITY_INSERT [dbo].[visit] ON 

INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (3, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (4, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (5, N'1         ', N'25-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (6, N'1         ', N'25-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (7, N'1         ', N'25-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (8, N'1         ', N'25-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (9, N'1         ', N'25-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (10, N'1         ', N'25-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (11, N'1         ', N'25-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (12, N'1         ', N'24-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (13, N'1         ', N'24-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (14, N'1         ', N'24-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (15, N'1         ', N'24-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (16, N'1         ', N'24-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (17, N'1         ', N'24-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (18, N'1         ', N'24-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (19, N'1         ', N'24-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (20, N'1         ', N'24-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (21, N'1         ', N'24-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (22, N'1         ', N'24-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (23, N'1         ', N'24-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (24, N'1         ', N'24-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (25, N'1         ', N'24-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (26, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (27, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (28, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (29, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (30, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (31, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (32, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (33, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (34, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (35, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (36, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (37, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (38, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (39, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (40, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (41, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (42, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (43, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (44, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (45, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (46, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (47, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (48, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (49, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (50, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (51, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (52, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (53, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (54, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (55, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (56, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (57, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (58, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (59, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (60, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (61, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (62, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (63, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (64, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (65, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (66, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (67, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (68, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (69, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (70, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (71, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (72, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (73, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (74, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (75, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (76, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (77, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (78, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (79, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (80, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (81, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (82, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (83, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (84, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (85, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (86, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (87, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (88, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (89, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (90, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (91, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (92, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (93, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (94, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (95, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (96, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (97, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (98, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (99, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (100, N'1         ', N'26-11-2018')
GO
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (101, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (102, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (103, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (104, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (105, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (106, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (107, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (108, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (109, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (110, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (111, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (112, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (113, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (114, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (115, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (116, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (117, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (118, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (119, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (120, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (121, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (122, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (123, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (124, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (125, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (126, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (127, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (128, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (129, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (130, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (131, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (132, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (133, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (134, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (135, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (136, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (137, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (138, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (139, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (140, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (141, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (142, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (143, N'1         ', N'26-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (144, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (145, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (146, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (147, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (148, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (149, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (150, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (151, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (152, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (153, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (154, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (155, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (156, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (157, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (158, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (159, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (160, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (161, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (162, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (163, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (164, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (165, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (166, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (167, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (168, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (169, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (170, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (171, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (172, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (173, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (174, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (175, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (176, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (177, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (178, N'1         ', N'27-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (179, N'1         ', N'28-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (180, N'1         ', N'28-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (181, N'1         ', N'29-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (182, N'1         ', N'29-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (183, N'1         ', N'29-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (184, N'1         ', N'29-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (185, N'1         ', N'29-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (186, N'1         ', N'29-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (187, N'1         ', N'29-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (188, N'1         ', N'30-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (189, N'1         ', N'30-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (190, N'1         ', N'30-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (191, N'1         ', N'30-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (192, N'1         ', N'30-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (193, N'1         ', N'30-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (194, N'1         ', N'30-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (195, N'1         ', N'30-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (196, N'1         ', N'30-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (197, N'1         ', N'30-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (198, N'1         ', N'30-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (199, N'1         ', N'30-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (200, N'1         ', N'30-11-2018')
GO
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (201, N'1         ', N'30-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (202, N'1         ', N'30-11-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (203, N'1         ', N'3-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (204, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (205, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (206, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (207, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (208, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (209, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (210, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (211, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (212, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (213, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (214, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (215, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (216, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (217, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (218, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (219, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (220, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (221, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (222, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (223, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (224, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (225, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (226, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (227, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (228, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (229, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (230, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (231, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (232, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (233, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (234, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (235, N'1         ', N'4-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (236, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (237, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (238, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (239, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (240, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (241, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (242, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (243, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (244, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (245, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (246, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (247, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (248, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (249, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (250, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (251, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (252, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (253, N'1         ', N'5-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1200, N'1         ', N'13-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1201, N'1         ', N'17-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1202, N'1         ', N'17-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1203, N'1         ', N'17-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1204, N'1         ', N'17-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1205, N'1         ', N'17-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1206, N'1         ', N'17-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1207, N'1         ', N'17-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1208, N'1         ', N'17-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1209, N'1         ', N'17-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1210, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1211, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1212, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1213, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1214, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1215, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1216, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1217, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1218, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1219, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1220, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1221, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1222, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1223, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1224, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1225, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1226, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1227, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1228, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1229, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1230, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1231, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1232, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1233, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1234, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1235, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1236, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1237, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1238, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1239, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1240, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1241, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1242, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1243, N'1         ', N'18-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1244, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1245, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1246, N'1         ', N'19-12-2018')
GO
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1247, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1248, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1249, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1250, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1251, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1252, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1253, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1254, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1255, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1256, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1257, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1258, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1259, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1260, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1261, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1262, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1263, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1264, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1265, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1266, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1267, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1268, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1269, N'1         ', N'19-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1270, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1271, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1272, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1273, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1274, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1275, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1276, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1277, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1278, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1279, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1280, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1281, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1282, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1283, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1284, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1285, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1286, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1287, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1288, N'1         ', N'20-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1289, N'1         ', N'22-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1290, N'1         ', N'22-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1291, N'1         ', N'24-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1292, N'1         ', N'29-12-2018')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1293, N'1         ', N'4-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1294, N'1         ', N'5-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1295, N'1         ', N'5-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1296, N'1         ', N'5-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1297, N'1         ', N'5-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1298, N'1         ', N'5-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (1299, N'1         ', N'5-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2289, N'1         ', N'8-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2290, N'1         ', N'8-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2291, N'1         ', N'9-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2292, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2293, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2294, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2295, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2296, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2297, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2298, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2299, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2300, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2301, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2302, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2303, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2304, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2305, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2306, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2307, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2308, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2309, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2310, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2311, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2312, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2313, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2314, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2315, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2316, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2317, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2318, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2319, N'1         ', N'16-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2320, N'1         ', N'18-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2321, N'1         ', N'25-1-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2322, N'1         ', N'18-2-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2323, N'1         ', N'22-2-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2324, N'1         ', N'22-2-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2325, N'1         ', N'22-2-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2326, N'1         ', N'22-2-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2327, N'1         ', N'22-2-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2328, N'1         ', N'22-2-2019')
INSERT [dbo].[visit] ([id], [visit], [date]) VALUES (2329, N'1         ', N'22-2-2019')
SET IDENTITY_INSERT [dbo].[visit] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__course__32DD1E4CFF0DC627]    Script Date: 2/28/2019 11:58:22 PM ******/
ALTER TABLE [dbo].[course] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tmp_ms_x__AB6E61644C71E005]    Script Date: 2/28/2019 11:58:22 PM ******/
ALTER TABLE [dbo].[members] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tmp_ms_x__1F5EF42E1B40FEA1]    Script Date: 2/28/2019 11:58:22 PM ******/
ALTER TABLE [dbo].[userTbl] ADD UNIQUE NONCLUSTERED 
(
	[loginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [tenhourDB] SET  READ_WRITE 
GO
