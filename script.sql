/*
** Copyright Microsoft, Inc. 1994 - 2000
** All Rights Reserved.
*/

SET NOCOUNT ON
GO

USE master
GO
if exists (select * from sysdatabases where name='PSS')
		drop database PSS
go

DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1

EXECUTE (N'CREATE DATABASE PSS
  ON PRIMARY (NAME = N''PSS'', FILENAME = N''' + @device_directory + N'PSS.mdf'')
  LOG ON (NAME = N''PSS_log'',  FILENAME = N''' + @device_directory + N'PSS.ldf'')')
go


set quoted_identifier on
GO

/* Set DATEFORMAT so that the date strings are interpreted correctly regardless of
   the default DATEFORMAT on the server.
*/
SET DATEFORMAT mdy
GO
use "PSS"
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [text] NULL,
	[slug] [nvarchar](50) NULL,
	[level] [int] NULL,
	[parent_id] [int] NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[items]    Script Date: 11/5/2019 2:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[items](
	[category_id] [int] NOT NULL,
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[status] [bit] NULL,
	[pricePerUnit] [float] NULL,
	[tags] [nvarchar](50) NULL,
	[image] [nvarchar](50) NULL,
	[detail] [text] NULL,
	[quantity] [int] NULL,
	[supplier_id] [int] NOT NULL,
 CONSTRAINT [PK_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 11/5/2019 2:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] NOT NULL,
	[date_order] [date] NULL,
	[price] [float] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_product]    Script Date: 11/5/2019 2:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_product](
	[order_id] [int] NOT NULL,
	[pet_id] [int] NULL,
	[item_id] [int] NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_user]    Script Date: 11/5/2019 2:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_user](
	[user_id] [int] NOT NULL,
	[order_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pet]    Script Date: 11/5/2019 2:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pet](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [text] NULL,
	[gender] [nvarchar](50) NULL,
	[birth] [date] NULL,
	[price] [float] NULL,
	[color] [nvarchar](50) NULL,
	[vaccine] [char](10) NULL,
	[status] [bit] NULL,
	[species_id] [int] NOT NULL,
 CONSTRAINT [PK_pet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 11/5/2019 2:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[species]    Script Date: 11/5/2019 2:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[species](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_species] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier]    Script Date: 11/5/2019 2:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [text] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 11/5/2019 2:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[phone_number] [int] NULL,
	[email] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[status] [bit] NULL,
	[role_id] [int] NULL,
	[gender] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[role] ([id], [name]) VALUES (0, N'customer')
INSERT [dbo].[role] ([id], [name]) VALUES (1, N'employee')
INSERT [dbo].[role] ([id], [name]) VALUES (2, N'admin')
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (1, N'Kwilith', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (2, N'Thoughtstorm', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (3, N'Gigazoom', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (4, N'Dazzlesphere', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (5, N'Trilith', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (6, N'Jabbersphere', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (7, N'Dabfeed', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (8, N'Rhynyx', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (9, N'Fatz', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (10, N'Livepath', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (11, N'Topdrive', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (12, N'Linktype', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (13, N'Meetz', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (14, N'Riffpedia', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (15, N'Devcast', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (16, N'Tagtune', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (17, N'Yacero', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (18, N'Jaloo', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (19, N'Skimia', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (20, N'Centidel', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (21, N'Voonyx', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (22, N'Plajo', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (23, N'Bluejam', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (24, N'Skinte', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (25, N'Yakijo', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (26, N'Kimia', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (27, N'Talane', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (28, N'Plambee', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (29, N'Aimbu', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (30, N'Tagcat', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (31, N'Jaxspan', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (32, N'Demimbu', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (33, N'Pixonyx', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (34, N'Jaxworks', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (35, N'Quatz', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (36, N'Centimia', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (37, N'Divanoodle', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (38, N'Riffwire', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (39, N'Blogtags', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (40, N'Bluezoom', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (41, N'Wordify', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (42, N'Vimbo', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (43, N'Agivu', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (44, N'Jatri', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (45, N'Oba', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (46, N'Ainyx', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (47, N'Vinte', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (48, N'Aibox', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (49, N'Dabshots', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (50, N'Shufflester', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (51, N'Nlounge', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (52, N'Viva', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (53, N'Tekfly', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (54, N'Skibox', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (55, N'Jabbertype', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (56, N'Kamba', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (57, N'Quinu', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (58, N'Skinix', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (59, N'Blogtags', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (60, N'Zoonoodle', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (61, N'Mydeo', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (62, N'Thoughtblab', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (63, N'Browsedrive', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (64, N'Topicshots', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (65, N'Skivee', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (66, N'Wikizz', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (67, N'Vimbo', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (68, N'Youtags', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (69, N'Omba', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (70, N'Blogspan', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (71, N'Dabjam', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (72, N'Jetpulse', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (73, N'Dynazzy', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (74, N'Dabfeed', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (75, N'Izio', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (76, N'Zoomzone', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (77, N'Fanoodle', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (78, N'Jaxbean', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (79, N'Gigazoom', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (80, N'Yata', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (81, N'Tagchat', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (82, N'Photojam', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (83, N'Avaveo', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (84, N'Blogtags', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (85, N'Kamba', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (86, N'Snaptags', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (87, N'Voomm', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (88, N'Vipe', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (89, N'Muxo', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (90, N'Eidel', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (91, N'Browsecat', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (92, N'Leenti', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (93, N'Wordify', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (94, N'Jabbersphere', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (95, N'Trunyx', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (96, N'Skivee', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (97, N'Omba', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (98, N'Bubblemix', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (99, N'Twimbo', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (100, N'Jabberstorm', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
GO
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (101, N'Jabbertype', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (102, N'Katz', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (103, N'Kimia', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (104, N'Mymm', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (105, N'Jaxbean', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (106, N'Thoughtstorm', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (107, N'Dynazzy', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (108, N'Twinder', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (109, N'Yambee', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (110, N'Wikido', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (111, N'Devshare', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (112, N'Roomm', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (113, N'Browsedrive', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (114, N'Skibox', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (115, N'Skyba', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (116, N'Dazzlesphere', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (117, N'Edgetag', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (118, N'Blogtag', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (119, N'Wikivu', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (120, N'Lazz', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (121, N'Blogtags', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (122, N'Kwimbee', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (123, N'Pixope', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (124, N'Fivechat', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (125, N'LiveZ', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (126, N'Livepath', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (127, N'Babbleset', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (128, N'Yoveo', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (129, N'Feednation', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (130, N'Midel', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (131, N'Quire', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (132, N'Flashspan', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (133, N'Yodoo', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (134, N'Leenti', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (135, N'Quimm', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (136, N'Roodel', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (137, N'Nlounge', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (138, N'Oyonder', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (139, N'Eabox', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (140, N'Fliptune', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (141, N'Cogibox', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (142, N'Vitz', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (143, N'Mynte', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (144, N'Twitterbeat', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (145, N'Jayo', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (146, N'Photobug', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (147, N'Yotz', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (148, N'Agimba', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (149, N'Mydo', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (150, N'Camido', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (151, N'Fanoodle', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (152, N'Miboo', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (153, N'Meetz', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (154, N'Linkbuzz', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (155, N'Jazzy', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (156, N'Snaptags', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (157, N'Edgetag', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (158, N'Skibox', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (159, N'JumpXS', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (160, N'Jabbertype', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (161, N'Voomm', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (162, N'Yakitri', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (163, N'Zoomcast', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (164, N'Vimbo', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (165, N'Yotz', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (166, N'Wikizz', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (167, N'Eabox', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (168, N'Kamba', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (169, N'Avavee', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (170, N'Eabox', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (171, N'Nlounge', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (172, N'Oodoo', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (173, N'Bubblebox', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (174, N'Buzzshare', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (175, N'JumpXS', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (176, N'Zoovu', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (177, N'Kare', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (178, N'Jetpulse', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (179, N'Meevee', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (180, N'Vidoo', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (181, N'Yacero', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (182, N'Gabtune', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (183, N'Trilia', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (184, N'Blogtag', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (185, N'Divape', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (186, N'Twinder', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (187, N'Fivechat', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (188, N'Twinder', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (189, N'Thoughtbeat', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (190, N'Meetz', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (191, N'Twitternation', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (192, N'Podcat', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (193, N'Agivu', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (194, N'Jatri', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (195, N'Babbleopia', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (196, N'Brainbox', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (197, N'Mynte', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (198, N'Skimia', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (199, N'Mymm', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (200, N'Innojam', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 1)
GO
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (201, N'Dynabox', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (202, N'Fivechat', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (203, N'Chatterpoint', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (204, N'Edgepulse', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (205, N'Kazu', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (206, N'Twiyo', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (207, N'Viva', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (208, N'Realcube', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (209, N'Gabcube', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (210, N'Edgeify', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (211, N'Zoonoodle', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (212, N'Photolist', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (213, N'Meezzy', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (214, N'Rhyloo', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (215, N'Wikibox', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (216, N'Yakitri', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (217, N'Viva', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (218, N'Blogpad', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (219, N'Jabberstorm', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (220, N'Brainsphere', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (221, N'Dynava', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (222, N'Eidel', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (223, N'Realcube', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (224, N'Linkbridge', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (225, N'Brainsphere', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (226, N'Quimba', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (227, N'Skaboo', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (228, N'Topiclounge', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (229, N'Chatterbridge', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (230, N'Kimia', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (231, N'Tagtune', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (232, N'Avavee', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (233, N'Agimba', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (234, N'Kazio', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (235, N'Tagtune', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (236, N'Quire', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (237, N'Dynabox', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (238, N'Roomm', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (239, N'Kwideo', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (240, N'Skinte', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (241, N'Skimia', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (242, N'Dabtype', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (243, N'Plambee', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (244, N'Thoughtstorm', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (245, N'Meemm', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (246, N'Mymm', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (247, N'Myworks', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (248, N'Quatz', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (249, N'Eare', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (250, N'Thoughtbridge', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (251, N'Riffwire', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (252, N'Voonder', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (253, N'Skibox', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (254, N'Buzzbean', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (255, N'BlogXS', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (256, N'Brainsphere', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (257, N'Yakijo', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (258, N'Trilith', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (259, N'LiveZ', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (260, N'Dabfeed', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (261, N'Quatz', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (262, N'Youopia', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (263, N'Agivu', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (264, N'Edgeclub', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (265, N'Devify', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (266, N'Meevee', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (267, N'Eayo', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (268, N'Ailane', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (269, N'Blogtag', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (270, N'Feedbug', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (271, N'Browsezoom', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (272, N'Edgeify', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (273, N'Katz', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (274, N'Dabtype', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (275, N'Buzzbean', N'In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (276, N'Gabvine', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (277, N'Chatterpoint', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (278, N'Lazzy', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (279, N'Twimm', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (280, N'Quinu', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (281, N'Wikizz', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (282, N'Tavu', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (283, N'Buzzshare', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (284, N'Jaxbean', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (285, N'Rhynyx', N'In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (286, N'Skipstorm', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (287, N'Thoughtworks', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (288, N'Dabfeed', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (289, N'Skyba', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (290, N'Zoomdog', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (291, N'Blogtags', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (292, N'Mycat', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (293, N'Wikibox', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (294, N'Mynte', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (295, N'Avamba', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (296, N'Podcat', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (297, N'Muxo', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (298, N'Shuffletag', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (299, N'Gigaclub', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (300, N'Yacero', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
GO
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (301, N'Skajo', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (302, N'Babbleopia', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (303, N'Topicshots', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (304, N'Zoonoodle', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (305, N'Voomm', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (306, N'Latz', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (307, N'Youfeed', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (308, N'Cogilith', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (309, N'Yadel', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (310, N'Rhycero', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (311, N'Skynoodle', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (312, N'Meejo', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (313, N'Devcast', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (314, N'Fivespan', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (315, N'Riffwire', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (316, N'Voolia', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (317, N'Brainverse', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (318, N'Zooveo', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (319, N'Chatterpoint', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (320, N'Eire', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (321, N'Oodoo', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (322, N'Eire', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (323, N'Innotype', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (324, N'Janyx', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (325, N'Wikivu', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (326, N'Trilith', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (327, N'Ooba', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (328, N'Jaloo', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (329, N'Lazzy', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (330, N'Eamia', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (331, N'Skalith', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (332, N'Bubbletube', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (333, N'Voomm', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (334, N'Linkbridge', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (335, N'Gabspot', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (336, N'Riffpedia', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (337, N'Skilith', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (338, N'Avavee', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (339, N'Topiczoom', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (340, N'Zoovu', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (341, N'Buzzdog', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (342, N'Ntag', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (343, N'Livefish', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (344, N'Flashspan', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (345, N'Topiclounge', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (346, N'Tagtune', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (347, N'Quinu', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (348, N'Twitterlist', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (349, N'Meejo', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (350, N'Innojam', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (351, N'Photofeed', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (352, N'Vitz', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (353, N'Quinu', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (354, N'Oloo', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (355, N'Devpulse', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (356, N'Livetube', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (357, N'Jayo', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (358, N'Zooxo', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (359, N'Rhynoodle', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (360, N'Shufflebeat', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (361, N'Skynoodle', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (362, N'Chatterpoint', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (363, N'Yambee', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (364, N'Buzzshare', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (365, N'Kamba', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (366, N'Buzzdog', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (367, N'Mybuzz', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (368, N'InnoZ', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (369, N'Quimba', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (370, N'Kamba', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (371, N'Jazzy', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (372, N'Layo', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (373, N'Skaboo', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (374, N'Skalith', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (375, N'Aimbo', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (376, N'Wikivu', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (377, N'Vinte', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (378, N'Realcube', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (379, N'Youspan', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (380, N'Skinte', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (381, N'Plajo', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (382, N'Bubblemix', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (383, N'Tekfly', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (384, N'Zoozzy', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (385, N'Kwideo', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (386, N'Katz', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (387, N'Yodo', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (388, N'Lajo', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (389, N'Yakijo', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (390, N'Kaymbo', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (391, N'Quatz', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (392, N'Shufflester', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (393, N'Zazio', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (394, N'Brainlounge', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (395, N'Tagcat', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (396, N'Avamba', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (397, N'Photobug', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (398, N'Jayo', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (399, N'Devbug', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (400, N'Meezzy', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
GO
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (401, N'Ozu', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (402, N'Meembee', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (403, N'Flashset', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (404, N'Kwinu', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (405, N'Skivee', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (406, N'Wikizz', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (407, N'Jetpulse', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (408, N'Avavee', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (409, N'Yombu', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (410, N'Thoughtworks', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (411, N'Zoomzone', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (412, N'Fadeo', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (413, N'Mymm', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (414, N'Twitterlist', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (415, N'Voomm', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (416, N'Topdrive', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (417, N'Twimbo', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (418, N'Myworks', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (419, N'Browseblab', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (420, N'Wikido', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (421, N'Gigaclub', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (422, N'Photofeed', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (423, N'Yakijo', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (424, N'Cogilith', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (425, N'Tagcat', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (426, N'Skinix', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (427, N'Mudo', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (428, N'Flipopia', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (429, N'Izio', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (430, N'Linktype', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (431, N'Realcube', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (432, N'Kayveo', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (433, N'Jetwire', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (434, N'Tambee', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (435, N'Mudo', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (436, N'Gabcube', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (437, N'Feedfish', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (438, N'LiveZ', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (439, N'Skyndu', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (440, N'Yata', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (441, N'Zoonoodle', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (442, N'Bubbletube', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (443, N'Trupe', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (444, N'Mynte', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (445, N'Leexo', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (446, N'Ozu', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (447, N'Bubblemix', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (448, N'Shufflebeat', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (449, N'Edgepulse', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (450, N'Browsebug', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (451, N'Agivu', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (452, N'Gabtype', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (453, N'Flashpoint', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (454, N'Centidel', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (455, N'Gigashots', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (456, N'Bubbletube', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (457, N'Pixonyx', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (458, N'Demimbu', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (459, N'Topicware', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (460, N'Buzzshare', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (461, N'Geba', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (462, N'Photobean', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (463, N'Meevee', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (464, N'Kimia', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (465, N'Agivu', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (466, N'Fadeo', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (467, N'InnoZ', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (468, N'Topiclounge', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (469, N'Jaxbean', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (470, N'Dynabox', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (471, N'Voonder', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (472, N'Oodoo', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (473, N'Twitterbeat', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (474, N'Realfire', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (475, N'Voonder', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (476, N'Jaxspan', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (477, N'Skinix', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (478, N'Latz', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (479, N'Leenti', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (480, N'Realbridge', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (481, N'Quaxo', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (482, N'Plambee', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (483, N'Voonyx', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (484, N'Aimbu', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (485, N'Wordware', N'In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (486, N'Zazio', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (487, N'Blogtag', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (488, N'Tazzy', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (489, N'Wikizz', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (490, N'Eidel', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (491, N'Skinix', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (492, N'Riffpedia', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (493, N'Yakitri', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (494, N'Skalith', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (495, N'Zoonder', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (496, N'Fivebridge', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (497, N'Tagfeed', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (498, N'Livefish', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (499, N'Thoughtmix', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (500, N'Edgeblab', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1)
GO
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (501, N'Kwilith', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (502, N'Jaxworks', N'In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (503, N'Buzzshare', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (504, N'Flashset', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (505, N'Buzzster', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (506, N'Trilith', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (507, N'Blogtag', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (508, N'Topicware', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (509, N'Avamba', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (510, N'Npath', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (511, N'Topicshots', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (512, N'Dabjam', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (513, N'Jaxnation', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (514, N'Flashset', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (515, N'Realfire', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (516, N'Twitterbeat', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (517, N'Janyx', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (518, N'Lajo', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (519, N'Fanoodle', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (520, N'Jaxspan', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (521, N'Brainverse', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (522, N'Brightbean', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (523, N'Zooxo', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (524, N'Gabtune', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (525, N'Centidel', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (526, N'Rhyloo', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (527, N'Riffpath', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (528, N'Quinu', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (529, N'Jaloo', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (530, N'Skipfire', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (531, N'Janyx', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (532, N'Dabjam', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (533, N'Yodoo', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (534, N'Chatterpoint', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (535, N'Riffwire', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (536, N'Gigashots', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (537, N'Shuffledrive', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (538, N'Zava', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (539, N'Jaxspan', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (540, N'Quimm', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (541, N'Cogibox', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (542, N'Thoughtbeat', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (543, N'Browsecat', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (544, N'Twimm', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (545, N'Aimbo', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (546, N'Tazzy', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (547, N'Minyx', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (548, N'Mycat', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (549, N'Kwideo', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (550, N'Yata', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (551, N'Realcube', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (552, N'Talane', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (553, N'Youopia', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (554, N'Janyx', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (555, N'Photofeed', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (556, N'Eadel', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (557, N'Twitternation', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (558, N'Eayo', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (559, N'Yakijo', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (560, N'Oba', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (561, N'Trudoo', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (562, N'Riffpedia', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (563, N'Dabjam', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (564, N'Yambee', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (565, N'Vimbo', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (566, N'Wikivu', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (567, N'Gabcube', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (568, N'Brainverse', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (569, N'Browsetype', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (570, N'Brightdog', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (571, N'Chatterbridge', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (572, N'Zoomdog', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (573, N'Lazzy', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (574, N'Oyoyo', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (575, N'Brainbox', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (576, N'Tazzy', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (577, N'Tanoodle', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (578, N'Latz', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (579, N'Aimbo', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (580, N'Yamia', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (581, N'Oyoloo', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (582, N'Buzzdog', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (583, N'Eayo', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (584, N'Brainsphere', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (585, N'Topdrive', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (586, N'Linkbridge', N'In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (587, N'Midel', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (588, N'Meevee', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (589, N'Gigabox', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (590, N'Twitterwire', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (591, N'Quinu', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (592, N'Buzzster', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (593, N'Jayo', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (594, N'Zooxo', N'In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (595, N'Flashpoint', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (596, N'Lazzy', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (597, N'LiveZ', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (598, N'Wikivu', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (599, N'Edgewire', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (600, N'Livetube', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
GO
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (601, N'Jabbercube', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (602, N'Innotype', N'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (603, N'Katz', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (604, N'Realbuzz', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (605, N'Fanoodle', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (606, N'Yakidoo', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (607, N'Blogspan', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (608, N'Edgewire', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (609, N'Topiclounge', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (610, N'Wordpedia', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (611, N'Photojam', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (612, N'Buzzbean', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (613, N'Talane', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (614, N'Lazzy', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (615, N'Linklinks', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (616, N'Skimia', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (617, N'Pixope', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (618, N'Quamba', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (619, N'Voolia', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (620, N'Quinu', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (621, N'Eire', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (622, N'Blogpad', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (623, N'Zazio', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (624, N'Yakitri', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (625, N'Edgeify', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (626, N'Livetube', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (627, N'Devshare', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (628, N'Flashset', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (629, N'Voonte', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (630, N'Feedmix', N'In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (631, N'Meevee', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (632, N'Zooveo', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (633, N'Eire', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (634, N'Topicshots', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (635, N'Flipopia', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (636, N'Tanoodle', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (637, N'Pixoboo', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (638, N'Leenti', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (639, N'Tavu', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (640, N'Aimbo', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (641, N'Tanoodle', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (642, N'Flashset', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (643, N'Voonder', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (644, N'Jayo', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (645, N'Zazio', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (646, N'Lazz', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (647, N'Feedfish', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (648, N'Jaxspan', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (649, N'Voonte', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (650, N'Skyndu', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (651, N'Topicshots', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (652, N'Yakijo', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (653, N'Twitterwire', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (654, N'Brightdog', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (655, N'Rooxo', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (656, N'Zoomdog', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (657, N'Yakijo', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (658, N'Wikido', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (659, N'Dynabox', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (660, N'Fadeo', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (661, N'Myworks', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (662, N'Wikizz', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (663, N'Dazzlesphere', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (664, N'Quatz', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (665, N'Skivee', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (666, N'Skidoo', N'In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (667, N'Topiczoom', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (668, N'Kimia', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (669, N'Npath', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (670, N'Devbug', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (671, N'Chatterbridge', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (672, N'Yadel', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (673, N'Livepath', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (674, N'Avavee', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (675, N'Eabox', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (676, N'Quatz', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (677, N'Photobug', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (678, N'Avaveo', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (679, N'Dynava', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (680, N'Lazzy', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (681, N'Twinder', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (682, N'Fanoodle', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (683, N'Kimia', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (684, N'Yodel', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (685, N'Oozz', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (686, N'Oloo', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (687, N'Voonder', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (688, N'Yacero', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (689, N'Kimia', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (690, N'Jazzy', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (691, N'Podcat', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (692, N'Gabspot', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (693, N'Trudeo', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (694, N'Meembee', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (695, N'Quimm', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (696, N'Mynte', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (697, N'Rhynyx', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (698, N'Gevee', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (699, N'Twimbo', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (700, N'Skiptube', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
GO
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (701, N'Vipe', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (702, N'Gevee', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (703, N'Ainyx', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (704, N'Dabvine', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (705, N'Meevee', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (706, N'Wikibox', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (707, N'Topicshots', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (708, N'Tagpad', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (709, N'Yabox', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (710, N'Demizz', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (711, N'Muxo', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (712, N'Roombo', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (713, N'Centizu', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (714, N'Voomm', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (715, N'Brainbox', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (716, N'Twitternation', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (717, N'Fivechat', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (718, N'Realcube', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (719, N'Buzzster', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (720, N'Mita', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (721, N'Browsecat', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (722, N'Meedoo', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (723, N'Innojam', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (724, N'Aibox', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (725, N'Wordify', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (726, N'Jabberbean', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (727, N'Topicblab', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (728, N'Yambee', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (729, N'Quinu', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (730, N'Linkbuzz', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (731, N'Linktype', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (732, N'Gigaclub', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (733, N'Topicstorm', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (734, N'Mynte', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (735, N'Centidel', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (736, N'Brightbean', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (737, N'Skimia', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (738, N'Linkbridge', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (739, N'Vinder', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (740, N'Aibox', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (741, N'Mybuzz', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (742, N'Miboo', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (743, N'Oyondu', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (744, N'Twitterworks', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (745, N'Buzzbean', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (746, N'Twinder', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (747, N'Topicstorm', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (748, N'Zoombeat', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (749, N'Skiba', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (750, N'Trilia', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (751, N'Latz', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (752, N'Camido', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (753, N'Eadel', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (754, N'Vipe', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (755, N'Oyoloo', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (756, N'Zoomzone', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (757, N'LiveZ', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (758, N'Dablist', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (759, N'Topiclounge', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (760, N'Yombu', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (761, N'Muxo', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (762, N'Omba', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (763, N'Mycat', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (764, N'Avamm', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (765, N'Yombu', N'Fusce consequat. Nulla nisl. Nunc nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (766, N'Feednation', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (767, N'Quatz', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (768, N'Yodo', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (769, N'Voonyx', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (770, N'Voomm', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (771, N'Innotype', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (772, N'Teklist', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (773, N'Zoonoodle', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (774, N'Npath', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (775, N'Vidoo', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (776, N'Innotype', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (777, N'Vinte', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (778, N'Dazzlesphere', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (779, N'Kazu', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (780, N'Oodoo', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (781, N'Blognation', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (782, N'Tagopia', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (783, N'Cogidoo', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (784, N'Gigaclub', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (785, N'Shufflebeat', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (786, N'Podcat', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (787, N'Roombo', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (788, N'Innojam', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (789, N'Wikivu', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (790, N'Yodo', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (791, N'Oyonder', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (792, N'Yata', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (793, N'Trilith', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (794, N'Zoomlounge', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (795, N'Zoomdog', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (796, N'Voonix', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (797, N'Kwideo', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (798, N'Wikivu', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (799, N'Fatz', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (800, N'Layo', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
GO
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (801, N'Jazzy', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (802, N'Latz', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (803, N'Centidel', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (804, N'Yamia', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (805, N'Realcube', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (806, N'Shufflebeat', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (807, N'Dabfeed', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (808, N'Zoonoodle', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (809, N'Jetpulse', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (810, N'Wordtune', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (811, N'Yata', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (812, N'Browseblab', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (813, N'Demizz', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (814, N'Janyx', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (815, N'Fivebridge', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (816, N'Oyonder', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (817, N'Eayo', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (818, N'Kwinu', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (819, N'Dabvine', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (820, N'Innojam', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (821, N'Dabjam', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (822, N'Blogtag', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (823, N'Yodo', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (824, N'Shufflebeat', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (825, N'Tagchat', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (826, N'Kaymbo', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (827, N'Oodoo', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (828, N'Photofeed', N'In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (829, N'Zazio', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (830, N'Yoveo', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (831, N'JumpXS', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (832, N'Twiyo', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (833, N'Riffpath', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (834, N'Miboo', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (835, N'Wikizz', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (836, N'Feednation', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (837, N'Chatterbridge', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (838, N'Shuffletag', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (839, N'Izio', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (840, N'Yabox', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (841, N'Avaveo', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (842, N'Gigabox', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (843, N'Camido', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (844, N'Abata', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (845, N'Flipopia', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (846, N'Edgepulse', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (847, N'Flipopia', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (848, N'Photobug', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (849, N'Feedfire', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (850, N'Brightbean', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (851, N'Buzzdog', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (852, N'Ooba', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (853, N'Muxo', N'Fusce consequat. Nulla nisl. Nunc nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (854, N'Feedfish', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (855, N'Kwilith', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (856, N'Zoonoodle', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (857, N'Dynabox', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (858, N'Edgewire', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (859, N'Twitterbeat', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (860, N'Kwimbee', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (861, N'Thoughtstorm', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (862, N'Flashpoint', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (863, N'Trilith', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (864, N'Fatz', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (865, N'Viva', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (866, N'Kwideo', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (867, N'Browsedrive', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (868, N'Thoughtblab', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (869, N'Ntags', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (870, N'Vidoo', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (871, N'Kazio', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (872, N'Demizz', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (873, N'Skyvu', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (874, N'Geba', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (875, N'Katz', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (876, N'Brainsphere', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (877, N'Livetube', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (878, N'Brainsphere', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (879, N'Tambee', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (880, N'Tanoodle', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (881, N'Wikizz', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (882, N'Centidel', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (883, N'Oyope', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (884, N'Chatterpoint', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (885, N'Voomm', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (886, N'Jaloo', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (887, N'Miboo', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (888, N'Layo', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (889, N'Pixonyx', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (890, N'Kayveo', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (891, N'Dabtype', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (892, N'Wordpedia', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (893, N'Tazz', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (894, N'Mycat', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (895, N'Realfire', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (896, N'Wordpedia', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (897, N'Rhybox', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (898, N'Edgeclub', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (899, N'Gigaclub', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (900, N'Yakitri', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
GO
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (901, N'Rhybox', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (902, N'Jaloo', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (903, N'Topdrive', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (904, N'Shuffledrive', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (905, N'Mydeo', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (906, N'Babbleopia', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (907, N'Oyoyo', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (908, N'Talane', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (909, N'Thoughtmix', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (910, N'Mita', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (911, N'Jabbersphere', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (912, N'Meedoo', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (913, N'Jetwire', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (914, N'Voonder', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (915, N'Roombo', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (916, N'Buzzster', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (917, N'Livetube', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (918, N'Twimbo', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (919, N'Twitternation', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (920, N'Tazzy', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (921, N'Twitternation', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (922, N'Zooveo', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (923, N'Trilith', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (924, N'Tazzy', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (925, N'Thoughtblab', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (926, N'Yata', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (927, N'Flipopia', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (928, N'Vitz', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (929, N'Buzzster', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (930, N'Jazzy', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (931, N'Wikizz', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (932, N'Photolist', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (933, N'Trupe', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (934, N'Tagtune', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (935, N'Edgeclub', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (936, N'Buzzbean', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (937, N'Zoonoodle', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (938, N'Twitterbeat', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (939, N'Yombu', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (940, N'Katz', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (941, N'Jetpulse', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (942, N'Oyoyo', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (943, N'Einti', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (944, N'Babblestorm', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (945, N'Flashpoint', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (946, N'Reallinks', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (947, N'Linkbuzz', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (948, N'Miboo', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (949, N'Blogpad', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (950, N'Skajo', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (951, N'Jabberstorm', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (952, N'Ailane', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (953, N'Voonte', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (954, N'Livepath', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (955, N'Divanoodle', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (956, N'Zava', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (957, N'Mydeo', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (958, N'Innojam', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (959, N'Dabjam', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (960, N'Quimba', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (961, N'Quinu', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (962, N'Tagchat', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (963, N'Edgepulse', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (964, N'Skyvu', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (965, N'Divape', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (966, N'Youopia', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (967, N'Youbridge', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (968, N'Realmix', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (969, N'BlogXS', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (970, N'Jaxworks', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (971, N'Trilia', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (972, N'Skynoodle', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (973, N'Gevee', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (974, N'Twinte', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (975, N'Dynabox', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (976, N'Babbleset', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (977, N'Browsetype', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (978, N'Vitz', N'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (979, N'Meemm', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (980, N'Jetpulse', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (981, N'Wikivu', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (982, N'Linklinks', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (983, N'Yodo', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (984, N'Camido', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (985, N'Mymm', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (986, N'Linklinks', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (987, N'Twitterworks', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (988, N'Tagcat', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (989, N'Kare', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (990, N'Skinte', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (991, N'Wikizz', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (992, N'Divape', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (993, N'Fanoodle', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (994, N'Jabbertype', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (995, N'Kimia', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (996, N'Wordpedia', N'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (997, N'Einti', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (998, N'Fliptune', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (999, N'Skinix', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 1)
INSERT [dbo].[supplier] ([id], [name], [description], [status]) VALUES (1000, N'Wordpedia', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 1)
GO
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (16, N'Caldwell', N'Harrell', 1552256099, N'charrellf@dion.ne.jp', N'9474 Green Court', N'Chennevières-sur-Marne', N'8c865e5a6352bf20023e1dd37134f269', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (73, N'Ari', N'Moan', 1781020122, N'amoan20@constantcontact.com', N'1 Del Sol Pass', N'Huangcun', N'2b98939b69365754779126024d1cc4d2', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (74, N'Daile', N'Conneely', 1126250399, N'dconneely21@japanpost.jp', N'2971 Talisman Terrace', N'Leeuwarden', N'f02b881ea9dcbe0c91557577a8109feb', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (75, N'Hetti', N'Forman', 2135971222, N'hforman22@com.com', N'12 Anzinger Pass', N'Bakunase', N'68ee496880552479c5eb86187140bcc3', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (89, N'Morse', N'Soots', 1661876225, N'msoots2g@hud.gov', N'4107 Almo Court', N'Dongzhang', N'b67c8091accd5738951dfa8289d09c8e', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (100, N'Royce', N'Mollison', 1031528895, N'rmollison2r@elpais.com', N'31 Myrtle Place', N'León', N'd0bc3642b569818e1872ed8d464de8fb', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (138, N'Dareen', N'Corkel', 1176602144, N'dcorkel3t@themeforest.net', N'76 Derek Place', N'El Caño', N'552225a749003915ae5f895b48430528', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (153, N'Florie', N'McHan', 1696457024, N'fmchan48@globo.com', N'151 Darwin Parkway', N'Murom', N'4184674be9be34843f64722b3983a719', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (160, N'Wade', N'Bleeze', 2123933780, N'wbleeze4f@printfriendly.com', N'94 Loeprich Road', N'Ishinomaki', N'd4975050f01ab24c8b3b247c82c33d80', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (170, N'Brittani', N'Ayscough', 1391430281, N'bayscough4p@myspace.com', N'9960 Truax Plaza', N'São Mateus', N'9672a437eb937a424a4ee2f8dfcd2bef', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (174, N'Yvonne', N'Lorriman', 1818745075, N'ylorriman4t@unicef.org', N'6681 Westend Circle', N'Shijing', N'f0f801c35e80955b4418252aa387b4fb', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (179, N'Kenny', N'Laycock', 1906272297, N'klaycock4y@dedecms.com', N'8968 Tony Crossing', N'Hobo', N'7ff38c77b3c8831836f27f87a7070cc1', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (184, N'Dexter', N'Paolazzi', 1182831936, N'dpaolazzi53@over-blog.com', N'31183 Sutteridge Alley', N'Huanxi', N'3537ad6a52ea549a9d366e9cb6222909', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (191, N'Fey', N'Palk', 1596410793, N'fpalk5a@cdc.gov', N'87214 Atwood Lane', N'Lionel Town', N'b66289fa0ba2269e8d81ebe7b70bcbf2', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (195, N'Fidelio', N'Tetley', 2101624680, N'ftetley5e@slate.com', N'7811 Bultman Park', N'Santa Catalina', N'04bac3e201aee1389cd6102cc67c58be', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (197, N'Marlo', N'Ravenscroftt', 1197296116, N'mravenscroftt5g@wikimedia.org', N'782 Sunnyside Pass', N'Cárdenas', N'a16f077b6b7850d3641f308f48a080f0', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (203, N'Hagen', N'Newns', 1941573106, N'hnewns5m@washingtonpost.com', N'0268 Lunder Crossing', N'Stockholm', N'88298ed1b5f8294fba8eb4cf5787f9e8', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (210, N'Dulcea', N'Gorsse', 1093226100, N'dgorsse5t@behance.net', N'8 American Alley', N'Liquica', N'6980679e5391ef76faa932898b49d3cf', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (222, N'Enriqueta', N'Martinie', 1071723974, N'emartinie65@google.ru', N'620 Claremont Way', N'Immatin', N'69d5be3c908493e30328b08b4ee22128', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (230, N'Arielle', N'Darrigoe', 1411085408, N'adarrigoe6d@angelfire.com', N'20 Ludington Circle', N'Padre Bernardo', N'f653a00a7f2bac27945d10fe83533dd6', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (238, N'Katharine', N'Crewe', 1349795728, N'kcrewe6l@scientificamerican.com', N'7939 Amoth Park', N'Ust’-Abakan', N'4fde8ca2b7f3fe371407bb10b1bba960', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (243, N'Malissa', N'Overthrow', 1176023482, N'moverthrow6q@wunderground.com', N'49276 Rigney Pass', N'Uppsala', N'c6d3b5dc62146d17c2100d89928c440a', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (269, N'Poppy', N'Bletso', 2051828705, N'pbletso7g@desdev.cn', N'60916 Namekagon Road', N'Katsikás', N'a8b7a890fec1474f2f608b1c7869e09e', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (278, N'Granthem', N'Antonsson', 1523959826, N'gantonsson7p@globo.com', N'1378 Waubesa Circle', N'Hashtgerd', N'f06896894bb29ee20b5a404e86946671', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (283, N'Georgiana', N'Sowray', 1635530769, N'gsowray7u@ycombinator.com', N'314 Bunting Street', N'Tanumah', N'6d68ea500623bce5fb6359af5a636851', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (289, N'Saloma', N'Aucoate', 1578453476, N'saucoate80@php.net', N'025 Springview Trail', N'Qiulu', N'47edfa3143b21227ad6a3a8ec2521591', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (294, N'Cletus', N'Meany', 1075212753, N'cmeany85@bloglines.com', N'1 2nd Way', N'Ribeirão das Neves', N'd045c0359d9d963fe098c43061281c28', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (296, N'Normy', N'Relfe', 1313611387, N'nrelfe87@chron.com', N'8 Debra Court', N'Palekastro', N'1fde209fc2f71d3484148e0d2b7dda03', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (297, N'Heinrik', N'MacCome', 1548972394, N'hmaccome88@ox.ac.uk', N'255 Old Gate Trail', N'Hallstahammar', N'8b39940faafef2f6709d45e22bccce9b', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (300, N'Kinnie', N'Henker', 2042259897, N'khenker8b@so-net.ne.jp', N'58301 Miller Road', N'Hou’an', N'd357932d5044bca28e82a61858f3a561', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (310, N'Mackenzie', N'Dubarry', 1888232179, N'mdubarry8l@nifty.com', N'27035 Rieder Crossing', N'Hanji', N'5799d515a147512cf19cb5cf55227670', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (311, N'Gratiana', N'Ughetti', 1251578461, N'gughetti8m@devhub.com', N'61 Sage Junction', N'Boxholm', N'aad797a71a64ee981f17d5f5d9285ac0', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (312, N'Bink', N'Nutt', 2023103581, N'bnutt8n@a8.net', N'39740 Vernon Terrace', N'Washington', N'01941bb3f989b1b12bf08cdb0123ac70', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (314, N'Lindsay', N'Vsanelli', 1288093216, N'lvsanelli8p@goodreads.com', N'31130 Melvin Trail', N'Tlutup', N'af42d1467ad83780e9df4d855f87c992', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (329, N'Antoni', N'Emeny', 1646485184, N'aemeny94@gizmodo.com', N'3 Mitchell Point', N'Zhuangtou', N'3326da475d6adeae58f25c07ab1e05b8', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (333, N'Murdock', N'Firk', 1915921102, N'mfirk98@shutterfly.com', N'05 Hoffman Point', N'Young', N'99f45e3cadd28c033d4cd5185f905449', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (336, N'Weston', N'Denial', 2104507646, N'wdenial9b@ning.com', N'5158 Lien Avenue', N'Lezhë', N'18957d07809f4c1b8d26c1f71ab853a7', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (347, N'Beltran', N'Steynor', 1905052903, N'bsteynor9m@over-blog.com', N'9 Rusk Pass', N'Hluboká nad Vltavou', N'0e189213d5a9528022ff65a1a88176ca', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (348, N'Lyell', N'Tolfrey', 1581634220, N'ltolfrey9n@upenn.edu', N'8134 Mccormick Park', N'Gjoçaj', N'06a7589f29352f11e6c99d5429ef9d75', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (349, N'Christie', N'Vatcher', 1962154719, N'cvatcher9o@dailymail.co.uk', N'4 Sachtjen Drive', N'Sangatta', N'2d3d2bdd759fc1db98842cac8c0eec1a', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (351, N'Elita', N'Dunmore', 1591028942, N'edunmore9q@irs.gov', N'3 Eastlawn Crossing', N'Hongsi', N'524b5a4b4323967c1eaac1eb0a08f6e6', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (356, N'Willard', N'Tripony', 1003358680, N'wtripony9v@spotify.com', N'368 Lakewood Point', N'Arzakan', N'a0466bbf671e5f0c975d23cb65070eb8', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (357, N'Tanitansy', N'Townrow', 2028586329, N'ttownrow9w@wp.com', N'5 Maryland Terrace', N'Washington', N'8fb454cc6779498abe9d892dbc6cfabf', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (365, N'Timotheus', N'Barstowk', 1074951059, N'tbarstowka4@gnu.org', N'135 Columbus Terrace', N'Bwizibwera', N'eb9cd3e5d00b76d2d133fd668ef7be7e', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (369, N'Wald', N'O''Bruen', 1634936495, N'wobruena8@earthlink.net', N'78253 Sage Drive', N'Xia Dawo', N'c079b3e6996db7411f30b67e5f4d8e48', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (371, N'Alwyn', N'Whittle', 1266692207, N'awhittleaa@eepurl.com', N'5 Northland Avenue', N'Wanmingang', N'400607b4c6874d4b755b239dfa9e38e8', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (378, N'Neel', N'Merrin', 1398773890, N'nmerrinah@google.pl', N'2236 Declaration Pass', N'Changmaoling', N'0aee7dd857c1a1eda0513f54eca21a91', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (388, N'Saraann', N'Kesper', 1296898017, N'skesperar@delicious.com', N'1 Almo Trail', N'Fotolívos', N'99276b362d039398d7f28e7f10f0c546', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (392, N'Lorna', N'Dyter', 1661961981, N'ldyterav@cornell.edu', N'1 Dunning Way', N'Kryva Hora', N'b1f6ecba2d4ad88f79e97eb97c9d629e', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (393, N'Ignacius', N'Josofovitz', 1152569141, N'ijosofovitzaw@usda.gov', N'41 Bultman Court', N'Isna', N'8743a042e34fabdea9c1dc9abf4fffcf', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (399, N'John', N'Quillinane', 1553680801, N'jquillinaneb2@studiopress.com', N'86745 Fuller Road', N'Margamukti', N'd6c504365ad1728f2995e9299ce4a2df', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (400, N'Brenda', N'Spada', 1409928820, N'bspadab3@usgs.gov', N'55261 Upham Avenue', N'Yongledian', N'a60cbf4d6ef827e9267b4ff059049892', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (404, N'Eduard', N'Bruhnke', 1761835324, N'ebruhnkeb7@ebay.com', N'7 Messerschmidt Lane', N'Umm Kaddadah', N'764a0897ae1a80af44a2fc4ba5a7db6f', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (426, N'Sutherland', N'Meineck', 1525332268, N'smeineckbt@zimbio.com', N'54652 Union Trail', N'Paulista', N'dce561dcc19cb5ec5962b66e8354b07c', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (430, N'Celeste', N'Soden', 1627600523, N'csodenbx@answers.com', N'7 Manufacturers Parkway', N'Bilao', N'168d5431e0b726144fb36e5e47c8baa3', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (432, N'Graehme', N'Ruppertz', 1372484636, N'gruppertzbz@twitpic.com', N'600 Lyons Crossing', N'Piraí do Sul', N'5d32fc1afea687fdd1ceefd6648b6c08', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (437, N'Tabina', N'Smallbone', 1049084917, N'tsmallbonec4@t.co', N'72307 Pleasure Trail', N'Castanheira', N'a79461b16f0afa722d55f46aec8f201f', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (447, N'Felicle', N'Lachaize', 1548725291, N'flachaizece@hatena.ne.jp', N'2 Bobwhite Junction', N'Hua Sai', N'ae4e0a01c4712746ed232a1156e1fbfe', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (450, N'Lesley', N'Glentz', 1802111847, N'lglentzch@irs.gov', N'56707 Mcbride Crossing', N'Sumberpucung', N'974d5f02502abed31fe766a67c3c8f98', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (460, N'Marlie', N'Braybrooks', 1766271862, N'mbraybrookscr@godaddy.com', N'897 John Wall Lane', N'Stepnogorsk', N'2636216aebcfcd013551c56df1ec2b0c', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (465, N'Lisle', N'Carvil', 1503112252, N'lcarvilcw@ocn.ne.jp', N'84400 Summit Circle', N'Comendador', N'15eb832ab77d70461a70ccb47967f108', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (477, N'Madlin', N'Clardge', 1004475081, N'mclardged8@last.fm', N'8 Fisk Pass', N'Cicayur', N'e02fb6b204cc9b69d7a5c076bbd58c4f', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (485, N'Jeanie', N'Edmenson', 1016556970, N'jedmensondg@pagesperso-orange.fr', N'2 Marcy Avenue', N'Pithári', N'fab938a420a1030fa547d3123018459e', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (500, N'Arron', N'Salvadori', 1557169163, N'asalvadoridv@loc.gov', N'480 Mccormick Pass', N'Cikuray', N'dcbbf505561b8780638b7f7335bcaf6d', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (525, N'Cordey', N'Klamp', 1489490212, N'cklampek@godaddy.com', N'37 Pleasure Trail', N'Cajazeiras', N'84c1d5189c5eed888e9e0e774503626a', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (528, N'Marten', N'Samart', 1233543551, N'msamarten@sogou.com', N'201 Lake View Terrace', N'Zvenigorod', N'2c7d58e65a93dfca45c103b7171073c2', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (537, N'Francoise', N'Firminger', 1898540820, N'ffirmingerew@cyberchimps.com', N'853 Golf Course Court', N'Hongkeli', N'e074a69a76dd0399cb0d49a5210198db', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (549, N'Darelle', N'Poli', 1051470576, N'dpolif8@craigslist.org', N'172 Nobel Terrace', N'Huilong', N'95b5b59f68a430d4207db715abb56a59', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (561, N'Jens', N'Joyes', 1467777013, N'jjoyesfk@squidoo.com', N'0674 Erie Crossing', N'Ekerö', N'f41faca8872a2497a279be807918daff', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (562, N'Ketty', N'Bluck', 1751871153, N'kbluckfl@list-manage.com', N'063 Mosinee Pass', N'Bogoria', N'd9f6f0364edeee6ee908f65eb203db33', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (565, N'Crystie', N'Snooks', 1599080755, N'csnooksfo@blogtalkradio.com', N'0069 Golf Course Hill', N'Haolin', N'9fe0bc1818d2e97f135cb2f850264c5b', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (571, N'Mischa', N'Scally', 1659386439, N'mscallyfu@kickstarter.com', N'30 Arkansas Hill', N'Kertapura', N'a80e8445abbb617995f36972f4785d54', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (580, N'Hildegarde', N'Skein', 1935717397, N'hskeing3@phoca.cz', N'9 Havey Center', N'São José de Mipibu', N'fd69ed64a64f8760adb77bac71ab8a53', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (581, N'Arnuad', N'Veysey', 1861678350, N'aveyseyg4@rakuten.co.jp', N'1712 Scofield Parkway', N'Yongning', N'f08f674669f231d7a36470804d0978a9', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (589, N'Anastasie', N'Richen', 1979882713, N'arichengc@phoca.cz', N'2 Superior Junction', N'Junyang', N'84bdfc27562cbfbc7c0f684fd0f67a62', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (599, N'Gerri', N'Cubbinelli', 1203590850, N'gcubbinelligm@google.pl', N'9800 Colorado Pass', N'Mikró Monastíri', N'194155c63a742406492794e7cba2346e', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (621, N'Dore', N'Tomenson', 1884093279, N'dtomensonh8@umn.edu', N'5600 Dwight Pass', N'Kaduy', N'089936423e12243cc0a95143cad69d32', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (622, N'Vyky', N'Messager', 1643262044, N'vmessagerh9@gnu.org', N'2804 Golf Pass', N'Mungwi', N'aadcf4f355f4c535d0b399f7c93f2b1e', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (630, N'Cary', N'Katt', 2067576960, N'ckatthh@boston.com', N'20772 Raven Road', N'Cisitu', N'001488cae477798b1dc7b3dcfbcb0c44', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (632, N'Cyrus', N'Chase', 1129497335, N'cchasehj@prweb.com', N'29003 Center Drive', N'Cotaparaco', N'7f6b653c68710977c25b468070ffbfad', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (641, N'Bryon', N'Chieco', 2122164896, N'bchiecohs@hubpages.com', N'10341 Burning Wood Hill', N'Jeruk', N'dadb6dc3402c38a07180abe18c6d3dd6', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (646, N'Joyous', N'O''Towey', 1319934776, N'jotoweyhx@nsw.gov.au', N'38449 Emmet Court', N'Riung', N'b74dd062e3b77adc48e42fc1b53079c4', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (651, N'Ebenezer', N'Pakeman', 1436332364, N'epakemani2@google.pl', N'7844 Badeau Drive', N'Tuopu', N'85805b65c505b191b20a77e78fd5cd82', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (656, N'Catrina', N'Squibbs', 1673965311, N'csquibbsi7@so-net.ne.jp', N'4817 Troy Pass', N'Buena Esperanza', N'47a1cdcc3197dd41f35ed662bf65cdf0', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (677, N'Leroy', N'Filipic', 1562991265, N'lfilipicis@cafepress.com', N'80 Division Alley', N'Bobon', N'104840ce84736641192e7c26aa86e632', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (685, N'Daniel', N'Alday', 1906712540, N'daldayj0@aboutads.info', N'8 Dottie Point', N'Mandal', N'a9fce1a5762a2b5194ab7d29bebe95de', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (688, N'Brooke', N'MacDiarmid', 1018277366, N'bmacdiarmidj3@si.edu', N'4 Briar Crest Pass', N'Koronadal', N'b64e49532c8c1b19863966321595747e', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (719, N'Elnora', N'Leer', 1774349107, N'eleerjy@prnewswire.com', N'33 Continental Park', N'Zhenziliang', N'5766039c2b064e43dc527e25865bcd4d', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (732, N'Hyatt', N'Siemianowicz', 1549592193, N'hsiemianowiczkb@de.vu', N'811 Jenna Place', N'Gorzkowice', N'ec3040ddb580dd2112afe19aad90abcb', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (736, N'Cass', N'Cromb', 1164037827, N'ccrombkf@google.ca', N'214 Butternut Hill', N'San Antonio', N'9246a92594d0b1dbc071493ddf569d5b', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (741, N'Nicoline', N'Kastel', 1971127258, N'nkastelkk@ning.com', N'98457 Bashford Plaza', N'Saint-Étienne-du-Rouvray', N'c087cf71f1662282d894219b68f484b1', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (745, N'Parry', N'Eckh', 1106228564, N'peckhko@skype.com', N'6 Glendale Lane', N'Pérez', N'c58389d678fe7cd1511b51d397448b7e', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (748, N'Chariot', N'Schankelborg', 1759928067, N'cschankelborgkr@dropbox.com', N'91 Sachtjen Point', N'Robonkon', N'bb808dfc60f61129069d14a9537bce34', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (756, N'Giorgia', N'McCambrois', 2059235008, N'gmccambroiskz@g.co', N'66 Esker Circle', N'Khoshi', N'2f314b8fa77c65f23b158cfe29f750bc', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (767, N'Joyce', N'Lyte', 1625714276, N'jlytela@yolasite.com', N'414 Killdeer Parkway', N'Panalo-on', N'c446d4cbb018fdef5a40e1a749fbb63c', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (769, N'Eddy', N'Cheyenne', 1838897800, N'echeyennelc@wikispaces.com', N'5808 Waubesa Crossing', N'Pánormos', N'5fc3155a75fbe5b4f9d9064097e6e5f9', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (774, N'Amory', N'McMylor', 1686473746, N'amcmylorlh@buzzfeed.com', N'21483 Mayfield Lane', N'Wahai', N'7bf7f87a7b5b6e1119bf845b9561276d', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (780, N'Farly', N'Brazil', 1893597831, N'fbrazilln@github.io', N'88 Doe Crossing Point', N'Bugis', N'9a0e94273baa4fcc7a8d68769367d8db', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (782, N'Audrie', N'Dallender', 1127548040, N'adallenderlp@google.ru', N'106 Westridge Drive', N'Gurinai', N'5e8ceedb7cc83a5194b7b3590d264fc7', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (789, N'Chantal', N'Bluett', 1857549939, N'cbluettlw@seesaa.net', N'1 Meadow Vale Center', N'Lampa', N'f43447247e91d7fda21db375b70af247', 1, NULL, N'Female', NULL)
GO
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (792, N'Maureene', N'Cleft', 2027196882, N'mcleftlz@blogtalkradio.com', N'2 Daystar Junction', N'Washington', N'e48842ed78f433141d226d96ca247bee', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (804, N'Tiphany', N'Philbrook', 1737885758, N'tphilbrookmb@cbsnews.com', N'0 Bowman Street', N'Kuching', N'85b9f3a958adfe922e9543247d07987d', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (835, N'Emmalyn', N'Fruin', 2049555117, N'efruinn6@infoseek.co.jp', N'7639 Carpenter Parkway', N'Fontenay-sous-Bois', N'0a167d003e0ea4e12e34977cd9113433', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (836, N'Eddie', N'Guido', 1491425842, N'eguidon7@godaddy.com', N'4 Lighthouse Bay Center', N'Falköping', N'49b3a55e979b36df0d4988d73c7f3b9f', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (837, N'Amargo', N'Hanney', 1456681450, N'ahanneyn8@vk.com', N'661 Eagle Crest Trail', N'Vagos', N'5250596c9ac86a76c1032a4a638bb487', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (842, N'Lauren', N'Buglar', 1143673570, N'lbuglarnd@cdbaby.com', N'6906 Johnson Lane', N'Yantongtun', N'b5bde066956eaf5ae044ad9ace125364', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (845, N'Crystal', N'Rodinger', 1293158128, N'crodingerng@php.net', N'0 Duke Hill', N'Xiejia', N'7b6592a5fc35bfbad597da1fcf6737b1', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (853, N'Katina', N'Meni', 1392318710, N'kmenino@sitemeter.com', N'07925 Lukken Drive', N'Cikadongdong', N'bd30de5a0cfb984ff703bb16888b757b', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (860, N'Serena', N'Humpherson', 1371830997, N'shumphersonnv@buzzfeed.com', N'12087 Clyde Gallagher Junction', N'Lagayan', N'aa9184d3352adec8ae7f4b531fc9fe62', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (868, N'Marielle', N'Dran', 1427399250, N'mdrano3@51.la', N'4671 Cordelia Hill', N'Carandaí', N'f6a8dd99920b6d3562030c2c88c6b562', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (871, N'Ronalda', N'Haucke', 1007230012, N'rhauckeo6@privacy.gov.au', N'27049 Arapahoe Center', N'Shibin al Kawm', N'831caa377b388a22eb406d9cb05cfc6b', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (890, N'Paxon', N'Dimbleby', 1551955183, N'pdimblebyop@amazon.co.jp', N'106 Anhalt Park', N'Fernandópolis', N'58dcbf5611f2462998342956e990c5dd', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (892, N'Jock', N'Drei', 1645351891, N'jdreior@engadget.com', N'1 Sunnyside Park', N'Jimusa’er', N'f579840619e51bca01eb603dc92a1ad1', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (921, N'Chrystel', N'Peasee', 1894664094, N'cpeaseepk@diigo.com', N'89 Talisman Alley', N'Laocheng', N'15e8381d8b01c7d67f14ec2880826aa8', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (922, N'Carol-jean', N'Ibbeson', 1919551877, N'cibbesonpl@tiny.cc', N'3923 South Way', N'Luohuang', N'5eec77ca44e2ce2b14ab482ec0ee6ffa', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (929, N'Dewitt', N'Jaffra', 1772619437, N'djaffraps@ycombinator.com', N'81 Truax Way', N'Wydminy', N'726eb1247be356c4a8bcc1e520566760', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (938, N'Bendite', N'Inchan', 1298741516, N'binchanq1@intel.com', N'34 Barnett Way', N'Webuye', N'5ef39fac2ed63689cca2335f05e6bfcb', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (939, N'Bibi', N'Goodayle', 1081667579, N'bgoodayleq2@va.gov', N'7 Ridgeway Way', N'Pampa Hermosa', N'3b7cbcc485c07e6ffd60b5f5f3ee423e', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (950, N'Gilbertina', N'Leaming', 1326439753, N'gleamingqd@msn.com', N'640 Russell Hill', N'Daliuhang', N'd81cd3398655ba434f476e3cd24d8ccf', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (967, N'Arney', N'Gallen', 1757223679, N'agallenqu@tumblr.com', N'44663 Fallview Street', N'Krajan Jamprong', N'f81fee9aec23a8c7c42caf5a68e412bc', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (974, N'Kirby', N'Cruces', 1121503276, N'kcrucesr1@un.org', N'8425 Northwestern Court', N'Camias', N'defaf1943ee99a0bb81f90224e470239', 1, NULL, N'Female', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (980, N'Leroy', N'Shemelt', 1502949835, N'lshemeltr7@nhs.uk', N'7 Briar Crest Drive', N'Shatalovo', N'1d628e37ac123a31be8af5cbe4ad2944', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (987, N'Pincus', N'Hanson', 1861786260, N'phansonre@ovh.net', N'7 South Road', N'Limassol', N'9a6eafdadcffff6786972015f135579f', 1, NULL, N'Male', NULL)
INSERT [dbo].[user] ([id], [first_name], [last_name], [phone_number], [email], [address], [city], [password], [status], [role_id], [gender], [username]) VALUES (994, N'Trace', N'Pusill', 2094650420, N'tpusillrl@networksolutions.com', N'93188 Hazelcrest Place', N'Fresno', N'98d7d38f7640edcbc39c3cbc4bd3b544', 1, NULL, N'Male', NULL)
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [FK_category_category] FOREIGN KEY([parent_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [FK_category_category]
GO
ALTER TABLE [dbo].[items]  WITH CHECK ADD  CONSTRAINT [FK_items_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[items] CHECK CONSTRAINT [FK_items_category]
GO
ALTER TABLE [dbo].[items]  WITH CHECK ADD  CONSTRAINT [FK_items_supplier] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[supplier] ([id])
GO
ALTER TABLE [dbo].[items] CHECK CONSTRAINT [FK_items_supplier]
GO
ALTER TABLE [dbo].[order_product]  WITH CHECK ADD  CONSTRAINT [FK_order_product_items] FOREIGN KEY([item_id])
REFERENCES [dbo].[items] ([id])
GO
ALTER TABLE [dbo].[order_product] CHECK CONSTRAINT [FK_order_product_items]
GO
ALTER TABLE [dbo].[order_product]  WITH CHECK ADD  CONSTRAINT [FK_order_product_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[order_product] CHECK CONSTRAINT [FK_order_product_order]
GO
ALTER TABLE [dbo].[order_product]  WITH CHECK ADD  CONSTRAINT [FK_order_product_pet] FOREIGN KEY([pet_id])
REFERENCES [dbo].[pet] ([id])
GO
ALTER TABLE [dbo].[order_product] CHECK CONSTRAINT [FK_order_product_pet]
GO
ALTER TABLE [dbo].[order_user]  WITH CHECK ADD  CONSTRAINT [FK_order_user_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[order_user] CHECK CONSTRAINT [FK_order_user_order]
GO
ALTER TABLE [dbo].[order_user]  WITH CHECK ADD  CONSTRAINT [FK_order_user_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[order_user] CHECK CONSTRAINT [FK_order_user_user]
GO
ALTER TABLE [dbo].[pet]  WITH CHECK ADD  CONSTRAINT [FK_pet_species] FOREIGN KEY([species_id])
REFERENCES [dbo].[species] ([id])
GO
ALTER TABLE [dbo].[pet] CHECK CONSTRAINT [FK_pet_species]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_role]
GO
