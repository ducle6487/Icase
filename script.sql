USE [Icase]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 6/17/2021 8:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[color]    Script Date: 6/17/2021 8:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color](
	[idproduct] [int] NOT NULL,
	[color] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryStatus]    Script Date: 6/17/2021 8:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryStatus](
	[idStatus] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_DeliveryStatus] PRIMARY KEY CLUSTERED 
(
	[idStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[device]    Script Date: 6/17/2021 8:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[device](
	[idproduct] [int] NOT NULL,
	[idphone] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[history]    Script Date: 6/17/2021 8:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history](
	[IdHistory] [int] IDENTITY(1,1) NOT NULL,
	[IdOrder] [int] NOT NULL,
	[IdMethod] [int] NULL,
	[IdStatusDelivery] [int] NULL,
	[IdStatusPayment] [int] NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[IdHistory] ASC,
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 6/17/2021 8:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[idimage] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[idproduct] [int] NOT NULL,
 CONSTRAINT [PK_image] PRIMARY KEY CLUSTERED 
(
	[idimage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[infoorder]    Script Date: 6/17/2021 8:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[infoorder](
	[IdOrder] [int] NOT NULL,
	[IdProduct] [int] NULL,
	[Amount] [int] NULL,
	[Total] [decimal](18, 0) NULL,
	[Color] [nvarchar](50) NULL,
	[Phone] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[methodpayment]    Script Date: 6/17/2021 8:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[methodpayment](
	[IdMethod] [int] IDENTITY(1,1) NOT NULL,
	[NameMethod] [nvarchar](50) NULL,
 CONSTRAINT [PK_MethodPayment] PRIMARY KEY CLUSTERED 
(
	[IdMethod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news]    Script Date: 6/17/2021 8:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[IdNews] [int] IDENTITY(1,1) NOT NULL,
	[Header] [nvarchar](max) NULL,
	[Thumnail] [nvarchar](500) NULL,
	[Detail] [nvarchar](max) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[IdNews] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 6/17/2021 8:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[IdOrder] [int] IDENTITY(1,1) NOT NULL,
	[DateOrder] [datetime] NULL,
	[Total] [decimal](18, 0) NULL,
	[Name] [nvarchar](100) NULL,
	[Phone] [decimal](10, 0) NULL,
	[Address] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[IdOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 6/17/2021 8:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentStatus](
	[idStatus] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_PaymentStatus] PRIMARY KEY CLUSTERED 
(
	[idStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 6/17/2021 8:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone](
	[idphone] [int] IDENTITY(1,1) NOT NULL,
	[namephone] [nvarchar](500) NULL,
	[idphonebrand] [int] NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[idphone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phonebrand]    Script Date: 6/17/2021 8:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phonebrand](
	[idphonebrand] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_phonebrand] PRIMARY KEY CLUSTERED 
(
	[idphonebrand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 6/17/2021 8:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[idproduct] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[idphonebrand] [int] NOT NULL,
	[price] [decimal](18, 0) NULL,
	[desciption] [nvarchar](max) NULL,
	[amount] [int] NULL,
	[casebrand] [nvarchar](50) NULL,
	[sold] [int] NULL,
	[dateadded] [datetime] NULL,
 CONSTRAINT [PK_case] PRIMARY KEY CLUSTERED 
(
	[idproduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([username], [password]) VALUES (N'admin', N'Anhducle')
INSERT [dbo].[Admin] ([username], [password]) VALUES (N'admin2', N'Anhducle')
INSERT [dbo].[Admin] ([username], [password]) VALUES (N'admin3', N'Anhducle')
GO
INSERT [dbo].[color] ([idproduct], [color]) VALUES (11, N'Rằn ri')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (12, N'Rằn ri')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (13, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (13, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (13, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (14, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (14, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (14, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (14, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (21, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (21, N'Nâu')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (21, N'Xám')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (21, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (22, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (22, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (22, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (23, N'Trắng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (23, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (23, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (23, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (23, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (23, N'Xanh chuối')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (24, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (24, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (24, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (25, N'Trắng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (25, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (25, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (25, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (25, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (26, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (26, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (26, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (27, N'Rằn ri')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (28, N'Trắng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (28, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (28, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (28, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (28, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (29, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (29, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (29, N'Xanh chuối')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (29, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (29, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (30, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (30, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (30, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (30, N'Xanh đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (30, N'Xanh rêu')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (30, N'Trắng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (31, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (31, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (31, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (32, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (32, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (32, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (32, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (33, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (33, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (33, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (33, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (34, N'Nâu')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (34, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (34, N'Trắng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (34, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (35, N'Trong suốt')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (35, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (35, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (35, N'Xanh đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (35, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (36, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (36, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (36, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (36, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (37, N'Camo rằn ri')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (38, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (38, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (38, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (38, N'Xám')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (38, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (38, N'Hồng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (38, N'Tím')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (39, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (39, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (39, N'Trắng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (39, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (40, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (40, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (40, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (40, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (40, N'Trong suốt')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (41, N'Nâu')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (41, N'Da')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (41, N'Xám')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (41, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (41, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (42, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (42, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (42, N'Hồng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (42, N'Trắng')
GO
INSERT [dbo].[color] ([idproduct], [color]) VALUES (43, N'Số 1')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (43, N'Số 2')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (43, N'Số 3')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (43, N'Số 4')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (43, N'Số 6')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (44, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (44, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (44, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (45, N'Hồng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (45, N'Trắng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (45, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (46, N'Số 1')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (46, N'Số 2')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (46, N'Số 3')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (46, N'Số 4')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (46, N'Số 5')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (46, N'Số 6')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (46, N'Số 7')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (46, N'Số 8')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (47, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (47, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (47, N'Xám')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (47, N'Xanh')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (48, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (48, N'Xanh Navy')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (48, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (48, N'Xám')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (49, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (49, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (49, N'Xanh ngọc')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (49, N'Xanh Navy')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (49, N'Xám')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (50, N'Captian')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (50, N'Spider')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (51, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (51, N'Xanh')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (52, N'Sói')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (53, N'Cây kem')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (54, N'Đen vàng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (54, N'Đen đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (54, N'Đen xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (54, N'Đen Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (54, N'Đen Trắng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (55, N'Nâu')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (55, N'Da')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (55, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (55, N'Xanh đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (56, N'Gấu nón trắng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (56, N'Gấu nón đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (56, N'3 con gấu')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (57, N'Snoopy')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (57, N'Charlie')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (58, N'Đen trắng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (58, N'Trắng đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (58, N'Trắng đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (58, N'Xanh')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (59, N'Cún mắt đốm nâu')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (60, N'Bánh mì ốp la')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (5, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (5, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (5, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (6, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (6, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (6, N'Trắng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (6, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (7, N'Trong suốt')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (8, N'Trong suốt')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (9, N'Trong suốt')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (10, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (10, N'Tím')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (10, N'Hồng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (10, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (10, N'Xanh Lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (10, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (15, N'Xanh Lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (15, N'Xanh chuối')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (15, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (16, N'Nâu')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (16, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (16, N'Xám')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (16, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (17, N'Nâu')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (17, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (17, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (18, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (18, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (18, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (19, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (19, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (19, N'Xám')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (20, N'Vàng nhạt')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (20, N'Nâu')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (20, N'Xám')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (20, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (20, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (61, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (62, N'Trong suốt')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (63, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (63, N'Trắng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (63, N'Hồng')
GO
INSERT [dbo].[color] ([idproduct], [color]) VALUES (64, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (65, N'vân carbon')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (66, N'Da')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (66, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (66, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (67, N'Xanh')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (67, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (68, N'Hồng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (68, N'Da')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (68, N'Hồng phấn')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (68, N'Xanh')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (68, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (69, N'Trong suốt')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (70, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (70, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (70, N'Xanh')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (71, N'Xanh')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (71, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (71, N'Trắng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (71, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (72, N'Xanh')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (72, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (72, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (72, N'Da')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (73, N'Xanh')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (73, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (74, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (74, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (74, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (74, N'Hồng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (74, N'Xanh ngọc')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (74, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (75, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (83, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (83, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (83, N'Xanh')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (83, N'Vàng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (83, N'Trắng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (84, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (85, N'Trong suốt')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (86, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (87, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (87, N'Xanh')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (87, N'Nâu')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (87, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (88, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (88, N'Xanh')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (88, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (88, N'Vàng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (89, N'Vàng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (89, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (89, N'Trắng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (89, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (90, N'Xanh đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (90, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (90, N'Da')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (90, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (75, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (75, N'Xanh dương')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (75, N'Xanh lá')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (75, N'Xanh ngọc')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (76, N'Da')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (76, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (76, N'Xanh')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (76, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (77, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (77, N'Xanh')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (77, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (78, N'Hồng phấn')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (78, N'Hồng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (78, N'Da')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (78, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (78, N'Xanh')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (79, N'Da')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (79, N'Hồng')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (79, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (79, N'Xám')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (80, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (81, N'Đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (81, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (81, N'Nâu')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (81, N'Xanh đen')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (82, N'Xanh')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (82, N'Nâu')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (82, N'Đỏ')
INSERT [dbo].[color] ([idproduct], [color]) VALUES (82, N'Đen')
GO
INSERT [dbo].[DeliveryStatus] ([idStatus], [name]) VALUES (1, N'Đang lấy hàng')
INSERT [dbo].[DeliveryStatus] ([idStatus], [name]) VALUES (2, N'Đang vận chuyển')
INSERT [dbo].[DeliveryStatus] ([idStatus], [name]) VALUES (3, N'Đã giao')
INSERT [dbo].[DeliveryStatus] ([idStatus], [name]) VALUES (4, N'Đã hủy')
GO
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (11, 252)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (12, 253)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (12, 254)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (12, 247)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (12, 248)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (12, 255)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (12, 256)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (12, 257)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (12, 258)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (13, 259)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (13, 260)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (13, 261)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (14, 256)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (14, 255)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (14, 262)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (14, 263)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (14, 249)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (14, 259)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (14, 247)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (14, 248)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (21, 264)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (21, 265)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (21, 266)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (21, 267)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (21, 268)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (22, 269)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (22, 270)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (23, 269)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (23, 270)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (24, 265)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (24, 271)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (24, 266)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (24, 264)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (25, 269)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (25, 270)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (26, 272)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (26, 273)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (27, 267)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (27, 274)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (27, 275)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (27, 268)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (27, 276)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (27, 277)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (27, 278)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (27, 279)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (27, 280)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (28, 267)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (28, 268)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (29, 267)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (29, 268)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (30, 280)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (31, 268)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (32, 272)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (32, 281)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (32, 282)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (33, 274)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (33, 275)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (34, 281)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (34, 272)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (34, 282)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (35, 275)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (35, 274)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (36, 283)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (36, 284)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (61, 285)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (61, 286)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (61, 287)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (61, 288)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (61, 289)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (61, 290)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (61, 291)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (61, 292)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (61, 293)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (62, 291)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (62, 287)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (62, 288)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (62, 292)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (62, 294)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (62, 295)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (62, 296)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (63, 297)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (64, 297)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (65, 298)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (65, 299)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (65, 300)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (65, 301)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (65, 302)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (66, 303)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (67, 304)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (67, 305)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (67, 306)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (68, 307)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (69, 306)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (70, 304)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (71, 305)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (72, 306)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (72, 304)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (73, 308)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (73, 309)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (74, 310)
GO
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (76, 311)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (77, 312)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (77, 313)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (78, 314)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (78, 312)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (79, 314)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (80, 315)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (81, 316)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (81, 317)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (81, 318)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (82, 316)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (82, 317)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (83, 319)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (84, 320)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (85, 321)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (86, 322)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (87, 323)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (88, 324)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (89, 325)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (90, 326)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (5, 251)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (6, 251)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (7, 257)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (8, 253)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (8, 259)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (8, 260)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (9, 255)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (10, 249)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (10, 250)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (15, 258)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (15, 327)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (15, 328)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (15, 329)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (15, 330)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (15, 331)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (15, 332)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (15, 253)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (15, 254)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (15, 333)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (15, 334)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (15, 335)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (16, 336)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (16, 337)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (16, 327)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (16, 338)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (16, 339)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (16, 340)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (17, 340)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (17, 339)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (18, 341)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (18, 342)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (18, 330)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (18, 331)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (18, 332)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (19, 341)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (19, 342)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (19, 343)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (20, 344)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (20, 333)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (20, 334)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (20, 343)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (20, 330)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (20, 331)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (20, 332)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (20, 345)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (20, 327)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (20, 346)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (20, 347)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (41, 348)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (41, 349)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (41, 350)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (41, 351)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (42, 352)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (42, 353)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (42, 351)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (42, 354)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (36, 355)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (36, 356)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (36, 351)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (36, 357)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (36, 358)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (36, 359)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (37, 351)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (37, 352)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (37, 353)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (37, 360)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (37, 355)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (37, 284)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (43, 349)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (43, 348)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (44, 349)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (44, 348)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (44, 351)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (45, 354)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (45, 349)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (45, 351)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (46, 352)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (47, 352)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (48, 350)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (48, 283)
GO
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (49, 361)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (49, 348)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (50, 361)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (50, 348)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (51, 362)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (52, 284)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (52, 350)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (53, 364)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (53, 365)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (54, 364)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (54, 365)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (55, 365)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (56, 365)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (57, 365)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (58, 365)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (59, 364)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (60, 364)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (60, 365)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (37, 350)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (38, 348)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (38, 356)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (38, 351)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (38, 357)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (38, 358)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (38, 359)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (39, 358)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (39, 359)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (39, 357)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (40, 361)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (40, 348)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (40, 349)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (40, 354)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (40, 351)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (40, 357)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (40, 358)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (40, 359)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (43, 351)
INSERT [dbo].[device] ([idproduct], [idphone]) VALUES (75, 363)
GO
SET IDENTITY_INSERT [dbo].[history] ON 

INSERT [dbo].[history] ([IdHistory], [IdOrder], [IdMethod], [IdStatusDelivery], [IdStatusPayment]) VALUES (1, 1, 1, 3, 2)
INSERT [dbo].[history] ([IdHistory], [IdOrder], [IdMethod], [IdStatusDelivery], [IdStatusPayment]) VALUES (2, 2, 1, 3, 2)
INSERT [dbo].[history] ([IdHistory], [IdOrder], [IdMethod], [IdStatusDelivery], [IdStatusPayment]) VALUES (3, 3, 1, 3, 2)
INSERT [dbo].[history] ([IdHistory], [IdOrder], [IdMethod], [IdStatusDelivery], [IdStatusPayment]) VALUES (4, 4, 2, 2, 2)
INSERT [dbo].[history] ([IdHistory], [IdOrder], [IdMethod], [IdStatusDelivery], [IdStatusPayment]) VALUES (5, 5, 1, 4, 1)
INSERT [dbo].[history] ([IdHistory], [IdOrder], [IdMethod], [IdStatusDelivery], [IdStatusPayment]) VALUES (6, 6, 1, 1, 2)
INSERT [dbo].[history] ([IdHistory], [IdOrder], [IdMethod], [IdStatusDelivery], [IdStatusPayment]) VALUES (7, 7, 1, 2, 1)
SET IDENTITY_INSERT [dbo].[history] OFF
GO
SET IDENTITY_INSERT [dbo].[image] ON 

INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (32, N'5.1.png', 5)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (33, N'5.2.png', 5)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (34, N'5.3.png', 5)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (35, N'5.4.png', 5)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (36, N'5.5.png', 5)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (37, N'5.6.png', 5)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (38, N'5.7.png', 5)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (39, N'5.8.png', 5)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (40, N'5.9.png', 5)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (41, N'6.1.png', 6)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (42, N'6.2.png', 6)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (43, N'6.3.png', 6)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (44, N'6.4.png', 6)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (45, N'6.5.png', 6)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (46, N'6.6.png', 6)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (47, N'6.7.png', 6)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (48, N'6.8.png', 6)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (49, N'7.1.png', 7)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (50, N'7.2.png', 7)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (51, N'7.3.png', 7)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (52, N'7.4.png', 7)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (53, N'7.5.png', 7)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (54, N'7.6.png', 7)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (55, N'7.7.png', 7)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (56, N'7.8.png', 7)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (57, N'8.1.png', 8)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (58, N'8.2.png', 8)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (59, N'8.3.png', 8)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (60, N'8.4.png', 8)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (61, N'8.5.png', 8)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (62, N'8.6.png', 8)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (63, N'8.7.png', 8)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (64, N'8.8.png', 8)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (65, N'9.1.png', 9)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (66, N'9.2.png', 9)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (67, N'9.3.png', 9)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (68, N'9.4.png', 9)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (69, N'9.5.png', 9)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (70, N'9.6.png', 9)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (71, N'9.7.png', 9)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (72, N'9.8.png', 9)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (73, N'10.1.png', 10)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (74, N'10.2.png', 10)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (75, N'10.3.png', 10)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (76, N'10.4.png', 10)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (77, N'10.5.png', 10)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (78, N'10.6.png', 10)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (79, N'10.7.png', 10)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (80, N'11.1.png', 11)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (81, N'11.2.png', 11)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (82, N'11.3.png', 11)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (83, N'11.4.png', 11)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (84, N'11.5.png', 11)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (85, N'11.6.png', 11)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (86, N'11.7.png', 11)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (87, N'12.1.png', 12)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (88, N'12.2.png', 12)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (89, N'12.3.png', 12)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (90, N'12.4.png', 12)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (91, N'12.5.png', 12)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (92, N'12.6.png', 12)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (93, N'12.7.png', 12)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (94, N'12.8.png', 12)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (95, N'12.9.png', 12)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (96, N'12.10.png', 12)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (97, N'13.1.png', 13)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (98, N'13.2.png', 13)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (99, N'13.3.png', 13)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (100, N'13.4.png', 13)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (101, N'13.5.png', 13)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (102, N'13.6.png', 13)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (103, N'13.7.png', 13)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (104, N'14.1.png', 14)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (105, N'14.2.png', 14)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (106, N'14.3.png', 14)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (107, N'14.4.png', 14)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (108, N'14.5.png', 14)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (109, N'14.6.png', 14)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (110, N'14.7.png', 14)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (111, N'14.8.png', 14)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (112, N'15.1.png', 15)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (113, N'15.2.png', 15)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (114, N'15.3.png', 15)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (115, N'15.4.png', 15)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (116, N'15.5.png', 15)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (117, N'15.6.png', 15)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (118, N'15.7.png', 15)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (119, N'16.1.png', 16)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (120, N'16.2.png', 16)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (121, N'16.3.png', 16)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (122, N'16.4.png', 16)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (123, N'16.5.png', 16)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (124, N'16.6.png', 16)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (125, N'16.7.png', 16)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (126, N'16.8.png', 16)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (127, N'17.1.png', 17)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (128, N'17.2.png', 17)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (129, N'17.3.png', 17)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (130, N'17.4.png', 17)
GO
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (131, N'17.5.png', 17)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (132, N'17.6.png', 17)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (133, N'17.7.png', 17)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (134, N'17.8.png', 17)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (135, N'17.9.png', 17)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (136, N'17.10.png', 17)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (137, N'17.11.png', 17)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (138, N'18.1.png', 18)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (139, N'18.2.png', 18)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (140, N'18.3.png', 18)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (141, N'18.4.png', 18)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (142, N'18.5.png', 18)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (143, N'18.6.png', 18)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (144, N'18.7.png', 18)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (145, N'18.8.png', 18)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (146, N'18.9.png', 18)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (147, N'18.10.png', 18)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (148, N'18.11.png', 18)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (149, N'19.1.png', 19)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (150, N'19.2.png', 19)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (151, N'19.3.png', 19)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (152, N'19.4.png', 19)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (153, N'19.5.png', 19)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (154, N'19.6.png', 19)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (155, N'19.7.png', 19)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (156, N'19.8.png', 19)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (157, N'19.9.png', 19)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (158, N'19.10.png', 19)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (159, N'20.1.png', 20)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (160, N'20.2.png', 20)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (161, N'20.3.png', 20)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (162, N'20.4.png', 20)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (163, N'20.5.png', 20)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (164, N'20.6.png', 20)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (165, N'20.7.png', 20)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (166, N'20.8.png', 20)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (167, N'20.9.png', 20)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (168, N'20.10.png', 20)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (169, N'20.11.png', 20)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (170, N'20.12.png', 20)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (171, N'21.1.png', 21)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (172, N'21.2.png', 21)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (173, N'21.3.png', 21)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (174, N'21.4.png', 21)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (175, N'21.5.png', 21)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (176, N'21.6.png', 21)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (177, N'21.7.png', 21)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (178, N'21.8.png', 21)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (179, N'21.9.png', 21)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (180, N'22.1.png', 22)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (181, N'22.2.png', 22)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (182, N'22.3.png', 22)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (183, N'22.4.png', 22)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (184, N'22.5.png', 22)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (185, N'22.6.png', 22)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (186, N'22.7.png', 22)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (187, N'23.1.png', 23)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (188, N'23.2.png', 23)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (189, N'23.3.png', 23)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (190, N'23.4.png', 23)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (191, N'23.5.png', 23)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (192, N'23.6.png', 23)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (193, N'23.7.png', 23)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (194, N'23.8.png', 23)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (195, N'23.9.png', 23)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (196, N'23.10.png', 23)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (197, N'24.1.png', 24)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (198, N'24.2.png', 24)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (199, N'24.3.png', 24)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (200, N'24.4.png', 24)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (201, N'24.5.png', 24)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (202, N'24.6.png', 24)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (203, N'24.7.png', 24)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (205, N'24.8.png', 24)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (206, N'24.9.png', 24)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (207, N'24.10.png', 24)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (208, N'25.1.png', 25)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (209, N'25.2.png', 25)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (210, N'25.3.png', 25)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (211, N'25.4.png', 25)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (212, N'25.5.png', 25)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (213, N'25.6.png', 25)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (214, N'25.7.png', 25)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (215, N'25.8.png', 25)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (216, N'26.1.png', 26)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (217, N'26.2.png', 26)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (218, N'26.3.png', 26)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (219, N'26.4.png', 26)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (220, N'26.4.png', 26)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (221, N'26.5.png', 26)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (222, N'26.6.png', 26)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (223, N'26.7.png', 26)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (224, N'26.8.png', 26)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (225, N'26.9.png', 26)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (226, N'27.1.png', 27)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (227, N'27.2.png', 27)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (228, N'27.3.png', 27)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (229, N'27.4.png', 27)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (230, N'27.5.png', 27)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (231, N'27.6.png', 27)
GO
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (232, N'27.7.png', 27)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (233, N'27.8.png', 27)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (234, N'27.9.png', 27)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (235, N'27.10.png', 27)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (236, N'27.11.png', 27)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (237, N'27.12.png', 27)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (238, N'28.1.png', 28)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (239, N'28.2.png', 28)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (240, N'28.3.png', 28)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (241, N'28.4.png', 28)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (242, N'28.5.png', 28)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (243, N'28.6.png', 28)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (244, N'28.7.png', 28)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (245, N'28.8.png', 28)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (246, N'28.9.png', 28)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (247, N'28.10.png', 28)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (248, N'28.11.png', 28)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (249, N'28.12.png', 28)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (250, N'29.1.png', 29)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (251, N'29.2.png', 29)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (252, N'29.3.png', 29)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (253, N'29.4.png', 29)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (254, N'29.5.png', 29)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (255, N'29.6.png', 29)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (256, N'29.7.png', 29)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (257, N'29.8.png', 29)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (258, N'29.9.png', 29)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (259, N'29.10.png', 29)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (260, N'29.11.png', 29)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (261, N'29.12.png', 29)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (262, N'29.13.png', 29)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (263, N'29.14.png', 29)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (264, N'29.15.png', 29)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (265, N'30.1.png', 30)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (266, N'30.2.png', 30)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (267, N'30.3.png', 30)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (268, N'30.4.png', 30)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (269, N'30.5.png', 30)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (270, N'30.6.png', 30)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (271, N'31.1.png', 31)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (272, N'31.2.png', 31)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (273, N'31.3.png', 31)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (274, N'31.4.png', 31)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (275, N'31.5.png', 31)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (276, N'31.6.png', 31)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (277, N'31.7.png', 31)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (278, N'31.8.png', 31)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (279, N'31.9.png', 31)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (280, N'32.1.png', 32)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (281, N'32.2.png', 32)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (282, N'32.3.png', 32)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (283, N'32.4.png', 32)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (284, N'32.4.png', 32)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (285, N'32.5.png', 32)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (286, N'33.1.png', 33)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (287, N'33.2.png', 33)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (288, N'33.3.png', 33)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (289, N'33.4.png', 33)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (290, N'33.5.png', 33)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (291, N'34.1.png', 34)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (292, N'34.2.png', 34)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (293, N'34.3.png', 34)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (294, N'34.4.png', 34)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (295, N'34.5.png', 34)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (296, N'34.6.png', 34)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (297, N'34.7.png', 34)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (298, N'35.1.png', 35)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (299, N'35.2.png', 35)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (300, N'35.3.png', 35)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (301, N'35.4.png', 35)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (302, N'35.5.png', 35)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (303, N'35.6.png', 35)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (304, N'35.7.png', 35)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (305, N'35.8.png', 35)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (306, N'35.9.png', 35)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (307, N'36.1.png', 36)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (308, N'36.2.png', 36)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (309, N'36.3.png', 36)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (310, N'36.4.png', 36)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (311, N'36.5.png', 36)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (312, N'36.6.png', 36)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (313, N'36.7.png', 36)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (314, N'37.1.png', 37)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (315, N'37.2.png', 37)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (316, N'37.3.png', 37)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (317, N'37.4.png', 37)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (318, N'37.5.png', 37)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (319, N'37.6.png', 37)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (320, N'37.7.png', 37)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (321, N'37.8.png', 37)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (322, N'38.1.png', 38)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (323, N'38.2.png', 38)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (324, N'38.3.png', 38)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (325, N'38.4.png', 38)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (326, N'38.5.png', 38)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (327, N'38.6.png', 38)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (328, N'39.1.png', 39)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (329, N'39.2.png', 39)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (330, N'39.3.png', 39)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (331, N'39.4.png', 39)
GO
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (332, N'39.5.png', 39)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (333, N'39.6.png', 39)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (334, N'39.7.png', 39)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (335, N'39.8.png', 39)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (336, N'39.9.png', 39)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (337, N'39.10.png', 39)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (338, N'40.1.png', 40)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (339, N'40.2.png', 40)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (340, N'40.3.png', 40)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (341, N'40.4.png', 40)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (342, N'40.5.png', 40)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (343, N'40.6.png', 40)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (344, N'40.7.png', 40)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (345, N'40.8.png', 40)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (346, N'40.9.png', 40)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (347, N'41.1.png', 41)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (348, N'41.2.png', 41)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (349, N'41.3.png', 41)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (350, N'41.4.png', 41)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (351, N'41.5.png', 41)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (352, N'41.6.png', 41)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (353, N'41.7.png', 41)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (354, N'41.8.png', 41)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (355, N'41.9.png', 41)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (356, N'41.10.png', 41)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (357, N'41.11.png', 41)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (358, N'41.12.png', 41)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (359, N'42.1.png', 42)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (360, N'42.2.png', 42)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (361, N'42.3.png', 42)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (362, N'42.4.png', 42)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (363, N'42.5.png', 42)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (364, N'42.6.png', 42)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (365, N'42.7.png', 42)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (366, N'42.8.png', 42)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (367, N'42.9.png', 42)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (368, N'42.10.png', 42)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (369, N'42.11.png', 42)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (370, N'42.12.png', 42)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (371, N'43.1.png', 43)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (372, N'43.2.png', 43)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (373, N'43.3.png', 43)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (374, N'43.4.png', 43)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (375, N'43.5.png', 43)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (376, N'43.6.png', 43)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (377, N'43.7.png', 43)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (378, N'43.8.png', 43)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (379, N'43.9.png', 43)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (380, N'44.1.png', 44)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (381, N'44.2.png', 44)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (382, N'44.3.png', 44)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (383, N'44.4.png', 44)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (384, N'44.5.png', 44)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (385, N'44.6.png', 44)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (386, N'44.7.png', 44)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (387, N'44.8.png', 44)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (388, N'44.9.png', 44)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (389, N'44.10.png', 44)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (390, N'45.1.png', 45)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (391, N'45.2.png', 45)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (392, N'45.3.png', 45)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (393, N'45.4.png', 45)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (394, N'45.5.png', 45)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (395, N'45.6.png', 45)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (396, N'45.7.png', 45)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (397, N'45.8.png', 45)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (398, N'45.9.png', 45)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (399, N'45.10.png', 45)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (400, N'45.11.png', 45)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (401, N'46.1.png', 46)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (402, N'46.2.png', 46)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (403, N'46.3.png', 46)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (404, N'46.4.png', 46)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (405, N'46.5.png', 46)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (406, N'46.6.png', 46)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (407, N'47.1.png', 47)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (408, N'47.2.png', 47)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (409, N'47.3.png', 47)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (410, N'47.4.png', 47)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (411, N'47.5.png', 47)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (412, N'47.6.png', 47)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (413, N'47.7.png', 47)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (414, N'47.8.png', 47)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (415, N'47.9.png', 47)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (416, N'48.1.png', 48)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (417, N'48.2.png', 48)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (418, N'48.3.png', 48)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (419, N'48.4.png', 48)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (420, N'48.5.png', 48)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (421, N'48.6.png', 48)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (422, N'48.7.png', 48)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (423, N'48.8.png', 48)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (424, N'48.9.png', 48)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (425, N'49.1.png', 49)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (426, N'49.2.png', 49)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (427, N'49.3.png', 49)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (428, N'49.4.png', 49)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (429, N'49.5.png', 49)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (430, N'49.6.png', 49)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (431, N'49.7.png', 49)
GO
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (432, N'49.8.png', 49)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (433, N'49.9.png', 49)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (434, N'50.1.png', 50)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (435, N'50.2.png', 50)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (436, N'50.3.png', 50)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (437, N'50.4.png', 50)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (438, N'50.5.png', 50)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (439, N'50.6.png', 50)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (440, N'50.7.png', 50)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (441, N'50.8.png', 50)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (442, N'50.9.png', 50)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (443, N'50.10.png', 50)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (444, N'51.1.png', 51)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (445, N'51.2.png', 51)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (446, N'51.3.png', 51)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (447, N'51.4.png', 51)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (448, N'52.1.png', 52)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (449, N'52.2.png', 52)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (450, N'52.3.png', 52)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (451, N'52.4.png', 52)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (452, N'53.1.png', 53)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (453, N'53.2.png', 53)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (454, N'53.3.png', 53)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (455, N'53.4.png', 53)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (456, N'53.5.png', 53)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (457, N'53.6.png', 53)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (458, N'53.7.png', 53)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (459, N'54.1.png', 54)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (460, N'54.2.png', 54)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (461, N'54.3.png', 54)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (462, N'54.4.png', 54)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (463, N'54.5.png', 54)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (464, N'54.6.png', 54)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (465, N'54.7.png', 54)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (466, N'54.8.png', 54)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (467, N'54.9.png', 54)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (468, N'55.1.png', 55)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (469, N'55.2.png', 55)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (470, N'55.3.png', 55)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (471, N'55.4.png', 55)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (472, N'55.5.png', 55)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (473, N'55.6.png', 55)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (474, N'55.7.png', 55)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (475, N'56.1.png', 56)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (476, N'56.2.png', 56)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (477, N'56.3.png', 56)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (478, N'56.4.png', 56)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (479, N'56.5.png', 56)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (480, N'56.6.png', 56)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (481, N'56.7.png', 56)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (482, N'56.8.png', 56)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (483, N'57.1.png', 57)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (484, N'57.2.png', 57)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (485, N'57.3.png', 57)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (486, N'57.4.png', 57)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (487, N'57.5.png', 57)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (488, N'57.6.png', 57)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (489, N'57.7.png', 57)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (490, N'57.8.png', 57)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (491, N'58.1.png', 58)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (492, N'58.2.png', 58)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (493, N'58.3.png', 58)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (494, N'58.4.png', 58)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (495, N'58.5.png', 58)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (496, N'58.6.png', 58)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (497, N'58.7.png', 58)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (498, N'58.8.png', 58)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (499, N'58.9.png', 58)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (500, N'59.1.png', 59)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (501, N'59.2.png', 59)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (502, N'59.3.png', 59)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (503, N'59.4.png', 59)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (504, N'59.5.png', 59)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (505, N'59.6.png', 59)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (506, N'59.7.png', 59)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (507, N'60.1.png', 60)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (508, N'60.2.png', 60)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (509, N'60.3.png', 60)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (510, N'60.4.png', 60)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (511, N'60.5.png', 60)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (512, N'60.6.png', 60)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (513, N'60.7.png', 60)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (514, N'60.8.png', 60)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (515, N'60.9.png', 60)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (516, N'61.1.png', 61)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (517, N'61.2.png', 61)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (518, N'61.3.png', 61)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (519, N'61.4.png', 61)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (520, N'61.5.png', 61)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (521, N'61.6.png', 61)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (522, N'61.7.png', 61)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (523, N'61.8.png', 61)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (524, N'61.9.png', 61)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (525, N'61.10.png', 61)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (526, N'61.11.png', 61)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (527, N'61.12.png', 61)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (528, N'61.13.png', 61)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (529, N'61.14.png', 61)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (530, N'61.15.png', 61)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (531, N'61.16.png', 61)
GO
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (532, N'62.1.png', 62)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (533, N'62.2.png', 62)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (534, N'62.3.png', 62)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (535, N'62.4.png', 62)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (536, N'62.5.png', 62)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (537, N'62.6.png', 62)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (538, N'62.7.png', 62)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (539, N'62.8.png', 62)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (540, N'62.9.png', 62)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (541, N'62.10.png', 62)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (542, N'62.11.png', 62)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (543, N'62.12.png', 62)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (544, N'62.13.png', 62)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (545, N'62.14.png', 62)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (546, N'63.1.png', 63)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (547, N'63.2.png', 63)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (548, N'63.3.png', 63)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (549, N'64.1.png', 64)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (550, N'65.1.png', 65)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (551, N'65.2.png', 65)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (552, N'65.3.png', 65)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (553, N'65.4.png', 65)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (554, N'65.5.png', 65)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (555, N'65.6.png', 65)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (556, N'65.7.png', 65)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (557, N'65.8.png', 65)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (558, N'65.9.png', 65)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (559, N'65.10.png', 65)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (560, N'66.1.png', 66)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (561, N'66.2.png', 66)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (562, N'66.3.png', 66)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (563, N'66.4.png', 66)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (564, N'66.5.png', 66)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (565, N'66.6.png', 66)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (566, N'66.7.png', 66)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (567, N'66.8.png', 66)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (568, N'66.9.png', 66)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (569, N'66.10.png', 66)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (570, N'67.1.png', 67)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (571, N'67.2.png', 67)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (572, N'67.3.png', 67)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (573, N'67.4.png', 67)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (574, N'67.5.png', 67)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (575, N'67.6.png', 67)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (576, N'67.7.png', 67)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (577, N'67.8.png', 67)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (578, N'67.9.png', 67)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (579, N'67.10.png', 67)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (580, N'68.1.png', 68)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (581, N'68.2.png', 68)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (582, N'68.3.png', 68)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (583, N'68.4.png', 68)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (584, N'68.5.png', 68)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (585, N'68.6.png', 68)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (586, N'68.7.png', 68)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (587, N'68.8.png', 68)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (588, N'69.1.png', 69)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (589, N'69.2.png', 69)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (590, N'69.3.png', 69)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (591, N'69.4.png', 69)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (592, N'69.5.png', 69)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (593, N'69.6.png', 69)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (594, N'69.7.png', 69)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (595, N'70.1.png', 70)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (596, N'70.2.png', 70)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (597, N'70.3.png', 70)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (598, N'70.4.png', 70)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (599, N'70.5.png', 70)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (600, N'70.6.png', 70)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (601, N'70.7.png', 70)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (602, N'70.8.png', 70)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (603, N'70.9.png', 70)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (604, N'71.1.png', 71)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (605, N'71.2.png', 71)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (606, N'71.3.png', 71)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (607, N'71.4.png', 71)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (608, N'71.5.png', 71)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (609, N'71.6.png', 71)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (610, N'71.7.png', 71)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (611, N'71.8.png', 71)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (612, N'72.1.png', 72)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (613, N'72.2.png', 72)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (614, N'72.3.png', 72)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (615, N'72.4.png', 72)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (616, N'72.5.png', 72)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (617, N'72.6.png', 72)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (618, N'72.7.png', 72)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (619, N'72.8.png', 72)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (620, N'72.9.png', 72)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (621, N'72.10.png', 72)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (622, N'73.1.png', 73)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (623, N'73.2.png', 73)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (624, N'73.3.png', 73)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (625, N'73.4.png', 73)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (626, N'73.5.png', 73)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (627, N'73.6.png', 73)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (628, N'73.7.png', 73)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (629, N'73.8.png', 73)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (630, N'74.1.png', 74)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (631, N'74.2.png', 74)
GO
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (632, N'74.3.png', 74)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (633, N'74.4.png', 74)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (634, N'74.5.png', 74)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (635, N'74.6.png', 74)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (636, N'74.7.png', 74)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (637, N'75.1.png', 75)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (638, N'75.2.png', 75)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (639, N'75.3.png', 75)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (640, N'75.4.png', 75)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (641, N'75.5.png', 75)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (642, N'75.6.png', 75)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (643, N'75.7.png', 75)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (644, N'75.8.png', 75)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (645, N'76.1.png', 76)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (646, N'76.2.png', 76)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (647, N'76.3.png', 76)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (648, N'76.4.png', 76)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (649, N'76.5.png', 76)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (650, N'76.6.png', 76)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (651, N'76.7.png', 76)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (652, N'76.8.png', 76)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (653, N'76.9.png', 76)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (654, N'77.1.png', 77)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (655, N'77.2.png', 77)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (656, N'77.3.png', 77)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (657, N'77.4.png', 77)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (658, N'77.5.png', 77)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (659, N'77.6.png', 77)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (660, N'77.6.png', 77)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (661, N'77.7.png', 77)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (662, N'77.8.png', 77)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (663, N'78.1.png', 78)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (664, N'78.2.png', 78)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (665, N'78.3.png', 78)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (666, N'78.4.png', 78)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (667, N'78.5.png', 78)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (668, N'78.6.png', 78)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (669, N'78.7.png', 78)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (670, N'78.8.png', 78)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (671, N'79.1.png', 79)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (672, N'79.2.png', 79)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (673, N'79.3.png', 79)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (674, N'79.4.png', 79)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (675, N'79.5.png', 79)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (676, N'79.6.png', 79)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (677, N'79.7.png', 79)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (678, N'79.8.png', 79)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (679, N'80.1.png', 80)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (680, N'80.2.png', 80)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (681, N'80.3.png', 80)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (682, N'80.4.png', 80)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (683, N'80.5.png', 80)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (684, N'80.6.png', 80)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (685, N'80.7.png', 80)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (686, N'80.8.png', 80)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (687, N'81.1.png', 81)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (688, N'81.2.png', 81)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (689, N'81.3.png', 81)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (690, N'81.4.png', 81)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (691, N'81.5.png', 81)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (692, N'81.6.png', 81)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (693, N'81.7.png', 81)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (694, N'81.8.png', 81)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (695, N'81.9.png', 81)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (696, N'81.10.png', 81)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (697, N'82.1.png', 82)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (698, N'82.2.png', 82)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (699, N'82.3.png', 82)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (700, N'82.4.png', 82)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (701, N'82.5.png', 82)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (702, N'82.6.png', 82)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (703, N'82.7.png', 82)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (704, N'82.8.png', 82)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (705, N'82.9.png', 82)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (706, N'83.1.png', 83)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (707, N'83.2.png', 83)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (708, N'83.3.png', 83)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (709, N'83.4.png', 83)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (710, N'83.5.png', 83)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (711, N'83.6.png', 83)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (712, N'83.7.png', 83)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (713, N'83.8.png', 83)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (714, N'84.1.png', 84)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (715, N'84.2.png', 84)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (716, N'84.3.png', 84)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (717, N'84.4.png', 84)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (718, N'85.1.png', 85)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (719, N'85.2.png', 85)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (720, N'85.3.png', 85)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (721, N'85.4.png', 85)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (722, N'85.5.png', 85)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (723, N'85.6.png', 85)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (724, N'86.1.png', 86)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (725, N'86.2.png', 86)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (726, N'86.3.png', 86)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (727, N'86.4.png', 86)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (728, N'87.1.png', 87)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (729, N'87.2.png', 87)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (730, N'87.3.png', 87)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (731, N'87.4.png', 87)
GO
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (732, N'87.5.png', 87)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (733, N'88.1.png', 88)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (734, N'88.2.png', 88)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (735, N'88.3.png', 88)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (736, N'88.4.png', 88)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (737, N'88.5.png', 88)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (738, N'88.6.png', 88)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (739, N'88.7.png', 88)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (740, N'88.8.png', 88)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (741, N'89.1.png', 89)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (742, N'89.2.png', 89)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (743, N'89.3.png', 89)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (744, N'89.4.png', 89)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (745, N'89.5.png', 89)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (746, N'89.6.png', 89)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (747, N'90.1.png', 90)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (748, N'90.2.png', 90)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (749, N'90.3.png', 90)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (750, N'90.4.png', 90)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (751, N'90.5.png', 90)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (752, N'90.6.png', 90)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (753, N'90.7.png', 90)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (754, N'90.8.png', 90)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (755, N'90.9.png', 90)
INSERT [dbo].[image] ([idimage], [name], [idproduct]) VALUES (756, N'90.10.png', 90)
SET IDENTITY_INSERT [dbo].[image] OFF
GO
INSERT [dbo].[infoorder] ([IdOrder], [IdProduct], [Amount], [Total], [Color], [Phone]) VALUES (1, NULL, 3, CAST(20000 AS Decimal(18, 0)), N'red', 277)
INSERT [dbo].[infoorder] ([IdOrder], [IdProduct], [Amount], [Total], [Color], [Phone]) VALUES (1, NULL, 3, CAST(22222 AS Decimal(18, 0)), N'blue', 300)
INSERT [dbo].[infoorder] ([IdOrder], [IdProduct], [Amount], [Total], [Color], [Phone]) VALUES (1, NULL, 3, CAST(444444 AS Decimal(18, 0)), N'green', 280)
INSERT [dbo].[infoorder] ([IdOrder], [IdProduct], [Amount], [Total], [Color], [Phone]) VALUES (2, NULL, 4, CAST(44444 AS Decimal(18, 0)), N'blue', 301)
INSERT [dbo].[infoorder] ([IdOrder], [IdProduct], [Amount], [Total], [Color], [Phone]) VALUES (3, NULL, 5, CAST(777777 AS Decimal(18, 0)), N'green', 333)
INSERT [dbo].[infoorder] ([IdOrder], [IdProduct], [Amount], [Total], [Color], [Phone]) VALUES (4, NULL, 2, CAST(77777 AS Decimal(18, 0)), N'brown', 321)
INSERT [dbo].[infoorder] ([IdOrder], [IdProduct], [Amount], [Total], [Color], [Phone]) VALUES (5, NULL, 3, CAST(210000 AS Decimal(18, 0)), N'Xanh dương', 249)
INSERT [dbo].[infoorder] ([IdOrder], [IdProduct], [Amount], [Total], [Color], [Phone]) VALUES (5, 59, 1, CAST(90000 AS Decimal(18, 0)), N'Cún mắt đốm nâu', 364)
INSERT [dbo].[infoorder] ([IdOrder], [IdProduct], [Amount], [Total], [Color], [Phone]) VALUES (5, NULL, 1, CAST(60000 AS Decimal(18, 0)), N'Đen', 247)
INSERT [dbo].[infoorder] ([IdOrder], [IdProduct], [Amount], [Total], [Color], [Phone]) VALUES (6, NULL, 1, CAST(140000 AS Decimal(18, 0)), N'Đen', 251)
INSERT [dbo].[infoorder] ([IdOrder], [IdProduct], [Amount], [Total], [Color], [Phone]) VALUES (6, 8, 1, CAST(80000 AS Decimal(18, 0)), N'Trong suốt', 253)
INSERT [dbo].[infoorder] ([IdOrder], [IdProduct], [Amount], [Total], [Color], [Phone]) VALUES (7, 16, 1, CAST(60000 AS Decimal(18, 0)), N'Nâu', 336)
INSERT [dbo].[infoorder] ([IdOrder], [IdProduct], [Amount], [Total], [Color], [Phone]) VALUES (7, 13, 1, CAST(70000 AS Decimal(18, 0)), N'Đỏ', 259)
INSERT [dbo].[infoorder] ([IdOrder], [IdProduct], [Amount], [Total], [Color], [Phone]) VALUES (7, 7, 1, CAST(80000 AS Decimal(18, 0)), N'Trong suốt', 257)
GO
SET IDENTITY_INSERT [dbo].[methodpayment] ON 

INSERT [dbo].[methodpayment] ([IdMethod], [NameMethod]) VALUES (1, N'COD')
INSERT [dbo].[methodpayment] ([IdMethod], [NameMethod]) VALUES (2, N'MOMO')
SET IDENTITY_INSERT [dbo].[methodpayment] OFF
GO
SET IDENTITY_INSERT [dbo].[news] ON 

INSERT [dbo].[news] ([IdNews], [Header], [Thumnail], [Detail]) VALUES (3, N'Tổng hợp những chiếc ốp lưng đẹp nhất và đắt nhất thế giới', N'blog1.1.png', N'Ốp lưng điện thoại hiện đang được rất nhiều người yêu thích sử dụng. Hiện nay trên thị trường có rất nhiều hình dáng, mẫu mã khác nhau giúp người dùng thoải mái lựa chọn. Bài viết hôm nay chúng tôi sẽ giới thiệu đến với các bạn những chiếc ốp lưng đẹp nhất và đắt nhất thế giới. Hãy cùng tìm hiểu nhé.

Ưu điểm của những chiếc ốp lưng điện thoại
Ốp lưng điện thoại ngày nay đang được sản xuất ra rất nhiều nhằm đáp ứng, phục vụ nhu cầu bảo vệ và trang trí cho dế yêu của mọi người. Chúng mang tới rất nhiều ưu điểm vượt trội. Chẳng hạn như:

Bảo vệ an toàn và chống trầy xước điện thoại
Với những chiếc điện thoại đáng giá hàng triệu hay là chục triệu thì người sở hữu nó luôn mong muốn điện thoại của mình luôn trong tình trạng mới và không bị trầy xước. Chính vì điều này nhu cầu sử dụng ốp điện thoại ngày càng tăng.

Những chiếc ốp lưng sẽ giúp giảm thiểu đi rất nhiều nguy cơ bị trầy xước hay nứt mẻ khi va đập. Bảo quản điện thoại của bạn luôn bền và luôn mới.

Mang tới màu sắc mới cho dế yêu
Những chiếc ốp điện thoại đẹp nhất sẽ giúp cho dế yêu của bạn trở nên nổi bật hơn. Bận có thể lựa chọn ốp điện thoại với nhiều màu sắc và họa tiết khác nhau.

Do nhu cầu sử dụng ốp lưng điện thoại cao nên các nhà sản xuất cũng không ngừng cho ra những mẫu mã, kiểu dáng đẹp nhất. Cùng với đó là sự đa dạng màu sắc giúp người dùng thoải mái lựa chọn.

Ốp lưng điện thoại thể hiện đẳng cấp của người sử dụng
Hiện nay có rất nhiều người sưu tầm những chiếc ốp lưng đẹp nhất và đắt nhất. Nó không chỉ làm nổi bật cho chiếc điện thoại mà còn thể hiện được đẳng cấp của người sử dụng.
Ốp lưng điện thoại từ da cự đà và họa tiết dolce
Đây cũng chính là một trong những ốp lưng đắt nhất thế giới mà chúng tôi muốn chia sẻ đến với các bạn. Chiếc ốp lưng này có giá tầm 895 đô la mỹ. Chắc chắn bạn sẽ cảm thấy vô cùng ngạc nhiên với giá thành của nó.

Ốp lưng được là từ chất liệu da cực đà cao cấp. Yếu tố tạo nên sự đắt đỏ nữa đó là những họa tiết thiên nhiên được làm từ vàng và đá quý nghệ thuật. Mặc dù nó có giá thành cao nhưng cũng đã được rất nhiều người trên thế giới sở hữu.
Ốp lưng Anita Mai Tan Rồng và Nhện
Chiếc ốp lưng này được liệt kê vào danh sách những cái ốp lưng điện thoại đẹp nhất chuyên dành cho dòng Iphone. Không chỉ đẹp mà đây còn là một trong những ốp lưng điện thoại đắt nhất thế giới với giá gần 1 triệu đô la.

Có hai phiên bản khác nhau cho bạn lựa chọn đó chính là ốp điện thoại rồng hoặc nhện. Những chiếc ốp lưng hình nhện được làm từ 2800 viên kim cương và nặng gần 38 carat. Còn đối với những chiếc ốp lưng hình rồng được chế tác thủ công với 2200 viên kim cương. Đây cũng chính là lý do tạo nên sự đắt đỏ cho chiếc ốp lưng này.')
INSERT [dbo].[news] ([IdNews], [Header], [Thumnail], [Detail]) VALUES (4, N'10 mẫu ốp lưng điện thoại thời thượng được giới trẻ săn lùng nhất hiện nay', N'blog2.1.png', N'1. Ốp lưng điện thoại hình thú

Đây là mẫu ốp lưng rất được lòng các bạn nữ bởi sự trẻ trung, dễ thương và bắt mắt. Hình những con thú ngộ nghĩnh sẽ được in lên mặt sau của ốp dạng in chìm, in nổi một phần hay in nổi toàn phần,… Bên cạnh đó, ốp được làm bằng chất liệu sillicon vừa dễ tháo lắp vừa mang lại cảm giác thoải mái khi cầm nắm, sử dụng.

Với mức giá từ 50 nghìn đồng trở lên là bạn đã có thể sở hữu được một chiếc ốp cực kì cute và đáng yêu này rồi.

Nguồn : https://bloganchoi.com/op-lung-dien-thoai-thoi-thuong-duoc-gioi-tre-san-lung-nhat-hien-nay/ 
2. Ốp lưng điện thoại hoa cúc họa mi

Gần đây, những chiếc ốp lưng chủ đề cúc họa mi đang là xu hướng mới, được các bạn trẻ săn lùng mở đầu năm 2020. Với thiết kế đa dạng, nhiều phong cách khác nhau đã khiến cho mẫu ốp lưng cúc họa mi đã “hot” lại càng “hot” hơn. Từ thiết kế in hình hoa cúc lên trên mặt lưng trong suốt đến việc dùng cả hoa cúc họa mi thật ép khô đặt lên ốp lưng đã khiến giới trẻ thích thú, hào hứng và mong muốn được sở hữu.

Cúc họa mi còn được in lên trên mặt kính siêu “cute“, đây là một sự lựa chọn không thể thiếu trong bộ sưu tập ốp lưng điện thoại nhà cúc họa mi. Với thiết kế kính cường lực cộng thêm hình hoa cúc mới lạ, càng làm cho sản phẩm thêm tinh tế và sang trọng. Ốp lưng hoa cúc họa mi có giá bình dân, dao động từ 50 nghìn đến 150 nghìn đồng tùy vào chất liệu.

Nguồn : https://bloganchoi.com/op-lung-dien-thoai-thoi-thuong-duoc-gioi-tre-san-lung-nhat-hien-nay/ ')
INSERT [dbo].[news] ([IdNews], [Header], [Thumnail], [Detail]) VALUES (5, N'Tự vẽ trang trí ốp lưng điện thoại đẹp mắt và đầy cá tính bằng Bút', N'blog3.1.png', N'Để sơn trắng phủ lên trên case trong, bạn sử dụng mực bút sơn Sharpie màu trắng, bình sịt phủ trắng hay sơn phủ trắng thường dùng trong làm Nails đều được. Sau đó, dùng bút sơn nhiều màu để vẽ hình mà bạn muốn.

Để pha được các màu sơn này, bạn dung bút sơn Sharpie nhấn nhẹ ngòi xuống để mực sơn trong bút chảy ra ngoài, sau đó sử dụng cọ để vẽ lên ốp lưng')
SET IDENTITY_INSERT [dbo].[news] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([IdOrder], [DateOrder], [Total], [Name], [Phone], [Address], [Message]) VALUES (1, CAST(N'2021-03-03T00:00:00.000' AS DateTime), CAST(200000 AS Decimal(18, 0)), N'anh duc', CAST(397067907 AS Decimal(10, 0)), N'thu duc', N'ddajsdaksj')
INSERT [dbo].[orders] ([IdOrder], [DateOrder], [Total], [Name], [Phone], [Address], [Message]) VALUES (2, CAST(N'2021-05-26T13:00:00.000' AS DateTime), CAST(200000 AS Decimal(18, 0)), N'dddd', CAST(909090090 AS Decimal(10, 0)), N'sdasdasd', N'sdjhajkdhakjhd')
INSERT [dbo].[orders] ([IdOrder], [DateOrder], [Total], [Name], [Phone], [Address], [Message]) VALUES (3, CAST(N'2021-05-25T00:00:00.000' AS DateTime), CAST(200000 AS Decimal(18, 0)), N'mmmm', CAST(909090909 AS Decimal(10, 0)), N'dakjhdkash', N'hduiahuidaysui')
INSERT [dbo].[orders] ([IdOrder], [DateOrder], [Total], [Name], [Phone], [Address], [Message]) VALUES (4, CAST(N'2021-05-26T05:03:03.000' AS DateTime), CAST(20000 AS Decimal(18, 0)), N'jajdklasjdkal', CAST(9029092092 AS Decimal(10, 0)), N'sdhdjhjhj', N'iiisjdisdi')
INSERT [dbo].[orders] ([IdOrder], [DateOrder], [Total], [Name], [Phone], [Address], [Message]) VALUES (5, CAST(N'2021-06-04T00:10:59.983' AS DateTime), CAST(390000 AS Decimal(18, 0)), N'xiao', CAST(378787878 AS Decimal(10, 0)), N'577,Xã Thạch Đồng,Huyện Thanh Thuỷ,Tỉnh Phú Thọ', N'7')
INSERT [dbo].[orders] ([IdOrder], [DateOrder], [Total], [Name], [Phone], [Address], [Message]) VALUES (6, CAST(N'2021-06-14T16:46:23.277' AS DateTime), CAST(250000 AS Decimal(18, 0)), N'Anh Duc Le', CAST(397067907 AS Decimal(10, 0)), N'29/8/11,Phường Hiệp Bình Chánh,Quận Thủ Đức,Thành phố Hồ Chí Minh', N'')
INSERT [dbo].[orders] ([IdOrder], [DateOrder], [Total], [Name], [Phone], [Address], [Message]) VALUES (7, CAST(N'2021-06-17T18:32:26.583' AS DateTime), CAST(240000 AS Decimal(18, 0)), N'Anh Duc Le', CAST(397067907 AS Decimal(10, 0)), N'29/8/11,Phường Hiệp Bình Phước,Quận Thủ Đức,Thành phố Hồ Chí Minh', N'')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
INSERT [dbo].[PaymentStatus] ([idStatus], [name]) VALUES (1, N'Chưa thanh toán')
INSERT [dbo].[PaymentStatus] ([idStatus], [name]) VALUES (2, N'Đã thanh toán')
GO
SET IDENTITY_INSERT [dbo].[Phone] ON 

INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (247, N'Mi 10T Pro', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (248, N'Redmi K30s', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (249, N'Mi 10T Lite', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (250, N'Redmi Note 9 Pro 5G', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (251, N'Mi 11', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (252, N'Black Shark 3', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (253, N'Redmi Note 9S', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (254, N'Note 9 Pro', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (255, N'Poco M3', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (256, N'Redmi 9T', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (257, N'Poco X3 NFC', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (258, N'Redmi Note 8 Pro', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (259, N'Mi 10T', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (260, N'Mi 10T Pro 5G', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (261, N'K30S', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (262, N'Redmi Note 9 5G', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (263, N'Note 9 Pro 5G', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (264, N'Realme 7', 2)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (265, N'Realme 7i', 2)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (266, N'Realme 7 Pro', 2)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (267, N'Realme 6', 2)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (268, N'Realme 6 Pro', 2)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (269, N'Oppo A52', 3)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (270, N'Oppo A92', 3)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (271, N'Realme C17', 2)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (272, N'OPPO A5', 3)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (273, N'OPPO A3S', 3)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (274, N'Realme 5 Pro', 2)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (275, N'Realme 5', 2)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (276, N'Realme X2 Pro', 2)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (277, N'Reno ACE', 3)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (278, N'Realme XT', 2)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (279, N'Realme X2', 2)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (280, N'Oppo K5', 3)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (281, N'Oppo A9', 3)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (282, N'Oppo A11X', 3)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (283, N'iPhone 6 Plus', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (284, N'iPhone 7', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (285, N'Vsmart Aris Pro', 5)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (286, N'Vsmart Aris', 5)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (287, N'Vsmart Joy 4', 5)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (288, N'Vsmart Live 4', 5)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (289, N'Vsmart Star 4', 5)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (290, N'Vsmart Star 3', 5)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (291, N'Vsmart Active 3', 5)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (292, N'Vsmart Joy 3', 5)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (293, N'Vsmart Bee 3', 5)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (294, N'Vsmart Star', 5)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (295, N'Vsmart Joy 1', 5)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (296, N'Vsmart Joy 1+ Plus', 5)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (297, N'Galaxy Note 20 Ultra', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (298, N'Galaxy S8', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (299, N'Galaxy A7 2017', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (300, N'Galaxy A5 2017', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (301, N'Galaxy A3 2017', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (302, N'Galaxy J7 Prime', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (303, N'Galaxy A52', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (304, N'Galaxy S21 Ultra', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (305, N'Galaxy S21+ Plus', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (306, N'Galaxy S21', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (307, N'Galaxy A02s', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (308, N'Galaxy Note 9', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (309, N'Galaxy Note 8', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (310, N'Galaxy S20 FE', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (311, N'Galaxy M51', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (312, N'Galaxy A11', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (313, N'Galaxy A21s', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (314, N'Galaxy M11', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (315, N'Galaxy M31', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (316, N'Huawei P40 Pro', 7)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (317, N'Huawei P40', 7)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (318, N'Huawei Nova 5T', 7)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (319, N'Mate 30 Pro', 7)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (320, N'Huawei Y9s', 7)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (321, N'Huawei Nova 7i', 7)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (322, N'Huawei Nova 6 SE', 7)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (323, N'Huawei P30 Lite', 7)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (324, N'Huawei Y9 2019', 7)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (325, N'Huawei P30', 7)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (326, N'Huawei P30 Pro', 7)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (327, N'Redmi K30', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (328, N'Redmi K30 5G', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (329, N'Redmi Note 8', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (330, N'Poco F2 Pro', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (331, N'Redmi K30 Pro', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (332, N'K30 Ultra', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (333, N'Mi 9T', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (334, N'Redmi K20', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (335, N'Redmi Note 7', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (336, N'Redmi 9A', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (337, N'Mi Note 10 Lite', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (338, N'PocoPhone X2', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (339, N'Redmi 9', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (340, N'Redmi 9C', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (341, N'Redmi Note 9', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (342, N'Redmi 10X 4G', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (343, N'Mi 10 Lite', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (344, N'Mi 9', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (345, N'Mi 8', 1)
GO
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (346, N'Poco X2', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (347, N'Note 8 Pro', 1)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (348, N'iPhone 7 Plus / 8 Plus', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (349, N'iPhone X / Xs', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (350, N'iPhone 6 Plus / 6s Plus', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (351, N'iPhone Xs Max', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (352, N'iPhone X', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (353, N'iPhone Xs', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (354, N'iPhone XR', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (355, N'iPhone 7 Plus', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (356, N'iPhone X-XR', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (357, N'iPhone 11', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (358, N'iPhone 11 Pro', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (359, N'iPhone 11 Pro Max', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (360, N'iPhone 8', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (361, N'iPhone 6/7/8', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (362, N'iPhone 6/6S', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (363, N'Galaxy S10 5G', 6)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (364, N'Airpods 1 / 2', 4)
INSERT [dbo].[Phone] ([idphone], [namephone], [idphonebrand]) VALUES (365, N'Airpods Pro', 4)
SET IDENTITY_INSERT [dbo].[Phone] OFF
GO
INSERT [dbo].[phonebrand] ([idphonebrand], [name]) VALUES (1, N'Xiaomi')
INSERT [dbo].[phonebrand] ([idphonebrand], [name]) VALUES (2, N'Realme')
INSERT [dbo].[phonebrand] ([idphonebrand], [name]) VALUES (3, N'Oppo')
INSERT [dbo].[phonebrand] ([idphonebrand], [name]) VALUES (4, N'Apple')
INSERT [dbo].[phonebrand] ([idphonebrand], [name]) VALUES (5, N'Vsmart')
INSERT [dbo].[phonebrand] ([idphonebrand], [name]) VALUES (6, N'Samsung')
INSERT [dbo].[phonebrand] ([idphonebrand], [name]) VALUES (7, N'Huawei')
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (5, N'Ốp lưng cho Xiaomi Mi 11 Chống sốc - Rugged Armor', 1, CAST(70000 AS Decimal(18, 0)), N'•	Ốp lưng dùng cho máy Xiaomi Mi 11
•	Ốp có 3 màu lựa chọn
•	Kiểu dáng sang trọng, thể thao
•	Ốp không bám vân tay
•	Vừa khít với máy
•	Ôm full mặt trước và sau
•	Dễ dàng tháo lắp
•	Ốp nhô cao 0.3mm che toàn bộ, bảo vệ camera 
•	Chống trầy xước, va đập
•	Chống sốc cực tốt khi rớt điện thoại
•	Bảo vệ máy tốt
•	Mẫu ốp được nhiều người tìm kiếm và ưa thích
', 50, N'Rugged Armor', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (6, N'Ốp lưng cho Xiaomi Mi 11 Frosted Shield nhựa PC cứng Nillkin , Vân nhám , chống vân tay', 1, CAST(110000 AS Decimal(18, 0)), N'•	Ốp lưng cứng dùng cho Xiaomi Mi 11
•	Mặt trên khắc chìm thương hiệu
•	Chống sốc, tránh va đập trày xước, bụi bẩn
•	Ôm lên mặt trước full và sát máy
•	Ốp cứng chống trầy
•	Dễ dàng tháo / lắp
•	Không bám vân tay
•	Ốp nhô cao 0.2mm bảo vệ camera
•	Kiểu dáng đơn giản sang trọng, phù hợp với mọi lứa tuổi
•	Ốp cứng không trơn, cảm giác cầm chắc tay
•	Ốp vừa khít máy
•	Ốp chính hãng giá rẻ
•	Thương hiệu Nillkin được nhiều bạn tìm kiếm

', 50, N' Nillkin', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (7, N'Ốp lưng cho Xiaomi Poco X3 NFC Rzants Carbon', 1, CAST(80000 AS Decimal(18, 0)), N'•	Ốp lưng dùng cho máy Xiaomi Poco X3 NFC
•	Kiểu dán Carbon Cá tính
•	Viền nhựa TPU dẻo nên dễ dàng tháo lắp
•	Lưng PC cứng trong không bị ố vàng, nhám nên hạn chế vân tay
•	Thương hiệu : RZANTS 
•	Viền Camera Nhô 0.3mm cao Bảo Vệ
•	Viền mặt trước cao hơn màn hình chống trày đc màn hình khi úp điện thoại
•	Ôm khít máy và bo tròn các góc cạnh


', 49, N'RZANTS', 1, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (8, N'Ốp lưng cho Xiaomi Redmi Note 9S Rzants Carbon', 1, CAST(80000 AS Decimal(18, 0)), N'•	Ốp lưng dùng cho máy Xiaomi
•	Kiểu dán Carbon Cá tính
•	Viền nhựa TPU dẻo nên dễ dàng tháo lắp
•	Lưng PC cứng trong không bị ố vàng, nhám nên hạn chế vân tay
•	Thương hiệu : RZANTS 
•	Viền Camera Nhô 0.3mm cao Bảo Vệ
•	Viền mặt trước cao hơn màn hình chống trày đc màn hình khi úp điện thoại
•	Ôm khít máy và bo tròn các góc cạnh


', 49, N' RZANTS', 1, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (9, N'Ốp lưng cho Xiaomi Poco M3 Rzants Carbon', 1, CAST(80000 AS Decimal(18, 0)), N'•	Ốp lưng dùng cho máy Xiaomi
•	Kiểu dán Carbon Cá tính
•	Viền nhựa TPU dẻo nên dễ dàng tháo lắp
•	Lưng PC cứng trong không bị ố vàng, nhám nên hạn chế vân tay
•	Thương hiệu : RZANTS 
•	Viền Camera Nhô 0.3mm cao Bảo Vệ
•	Viền mặt trước cao hơn màn hình chống trày đc màn hình khi úp điện thoại
•	Ôm khít máy và bo tròn các góc cạnh


', 50, N'RZANTS', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (10, N'Ốp lưng cho Xiaomi Mi 10T Lite - Redmi Note 9 Pro 5G nhám viền màu che camera', 1, CAST(70000 AS Decimal(18, 0)), N'•	Ốp lưng cho Mi 10T Lite - Redmi Note 9 Pro 5G xài chung
•	Có 8 màu lựa chọn : Đỏ nút đen , xanh rêu nút cam , xám nút xanh , đen nút đỏ , xanh dương nút xanh lá , xanh lá nút cam , tím nút xanh , xanh ngọc nút xanh lá
•	Ốp nhựa lưng nhám hạn chế vân tay
•	3 màu nhám trắng : Tím , Xám , Xanh ngọc
•	5 màu nhám đen : Đỏ , Đen , Xanh lá , Xanh dương , Xanh rêu 
•	Mặt Lưng PC Cứng Nhám
•	Viền Màu TPU Dẻo
•	Mẫu mã đơn giản nhưng sử dụng rất nổi bật
•	Vừa khích, ôm full máy
•	Phần camera được che toàn bộ 
•	Nút bấm rời ,có thể tháo được 
•	Dễ dàng tháo / lắp

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (11, N'Ốp lưng cho Xiaomi Black Shark 3 - 3 Pro Rzants rằn ri', 1, CAST(80000 AS Decimal(18, 0)), N'•	Ốp lưng dùng cho máy Xiaomi Black Shark 3 và Black Shark 3 Pro
•	Kiểu dán rằn ri mạnh mẻ
•	Viền nhựa TPU dẻo nên dễ dàng tháo lắp
•	Lưng PC cứng trong không bị ố vàng, nhám nên hạn chế vân tay
•	Thương hiệu : RZANTS 
•	Viền Camera Nhô cao Bảo Vệ
•	Viền mặt trước cao hơn màn hình chống trày đc màn hình khi úp điện thoại
•	Ôm khít máy và bo tròn các góc cạnh


', 50, N'RZANTS', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (12, N'Ốp lưng cho Xiaomi Rzants rằn ri

', 1, CAST(80000 AS Decimal(18, 0)), N'•	Ốp lưng dùng cho máy Xiaomi 
•	Kiểu dán rằn ri mạnh mẻ
•	Viền nhựa TPU dẻo nên dễ dàng tháo lắp
•	Lưng PC cứng trong không bị ố vàng, nhám nên hạn chế vân tay
•	Thương hiệu : RZANTS 
•	Viền Camera Nhô cao Bảo Vệ
•	Viền mặt trước cao hơn màn hình chống trày đc màn hình khi úp điện thoại
•	Ôm khít máy và bo tròn các góc cạnh

', 50, N'RZANTS ', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (13, N'Ốp lưng cho Xiaomi Mi 10T - Mi 10T Pro 5G - K30S Trong Suốt Chống Sốc iRing Viền Màu', 1, CAST(70000 AS Decimal(18, 0)), N'•	Ốp lưng dùng Xiaomi Mi 10T - Mi 10T Pro 5G - K30S Trong Suốt Chống Sốc iRing Viền Màu
•	Có 3 màu lựa chọn: Đen, Đỏ, Xanh
•	Mặt kính trong suốt không bị lỗ liti
•	Kèm iRing đa năng tiện dụng
•	Iring có thể làm giá đỡ, móc vào tay hoặc có thể hít trên xe hơi
•	4 góc dày chống sốc
•	Viền ốp nhô cao 0.3mm bảo vệ Camera
•	Ốp mặt lưng kính viền nhựa TPU dẻo
•	Viền nhựa dẻo có lớp Carbon nổi bật, chống trơn tay khi cầm
•	Ốp ôm Full từ sau lên trước, nhô cao hơn màn hình 0.5mm, chống trầy khi màn hình tiếp xúc với mặt phẳng
•	Ốp vừa khít với máy
•	Khoét các chi tiết trên viền chính xác
•	Phím ấn nhô lên, cho cảm giấc bấm cực nhẹ
•	Dễ dàng tháo/lắp

', 49, N'No Brand', 1, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (14, N'Ốp lưng cho Xiaomi nhám viền màu WLONS

', 1, CAST(90000 AS Decimal(18, 0)), N'•	Ốp lưng cho Xiaomi Redmi 9T - Redmi Note 9 4G - Poco M3
•	Có 4 màu lựa chọn : Đen , xanh , đỏ , xanh rêu
•	Mặt Lưng PC Cứng Nhám , hạn chế vân tay
•	Viền Màu TPU Dẻo , Dễ dàng tháo / lắp
•	Vừa khích, ôm full máy
•	Viền camera cào hơn camera nhô 0.3mm , viền ốp mặt trước cao hơn màn hình nhô 0.5mm bảo vệ được màn hình
•	Ốp 2 mảnh riêng biệt, mặt lưng và viền có thể tháo rời
•	Phím âm lượng bấm nhẹ không bị cứng tay
•	4 gốc nhô cao chống sốc. 

', 50, N'WLONS', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (15, N'Ốp lưng Xiaomi nhám viền màu in hình

', 1, CAST(70000 AS Decimal(18, 0)), N'•	Ốp lưng Xiaomi Redmi Note 8 Pro nhám viền màu in hình
•	3 màu viền lựa chọn, đen , xanh lá , xanh rêu
•	Mẫu in hình ngẫu hứng với người ngoài hành tinh với nhiều dòng chữ sắp xếp lộn xộn
•	Nút bấm âm lượng và nguồn tháo rời được, nên thao tác bấm cực nhẹ
•	Mặt lưng PC cứng nhám, viền TPU dẻo màu 
•	Dễ dàng tháo / lắp , vừa khít với máy Redmi Note 8 Pro

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (16, N'Ốp lưng cho Xiaomi, giả JEAN viền TPU dẻo

', 1, CAST(60000 AS Decimal(18, 0)), N'•	Ốp lưng dùng cho máy Xiaomi 
•	Có 4 màu lựa chọn
•	Bảo vệ tránh va đập trày xước, bụi bẩn
•	Ôm full máy bo tròn sát máy
•	Ốp không biến dạng 
•	Dễ dàng tháo / lắp
•	Chống sốc cao
•	Ốp lưng nhựa giả Jean

', 49, N'No Brand', 1, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (17, N'Ốp lưng cho Xiaomi chống sốc Carbon Auto Focus

', 1, CAST(70000 AS Decimal(18, 0)), N'•	Ốp lưng dùng cho máy Xiaomi 
•	Có 3 màu lựa chọn , Đen - Xanh - Nâu
•	Kiểu dáng vân Carbon Auto Focus
•	Bảo vệ tránh va đập trày xước, bụi bẩn
•	Phần camera nhô lên 0.3mm bảo vệ 
•	Ôm full máy bo tròn sát máy
•	Ốp không biến dạn 
•	Dễ dàng tháo / lắp
•	Ốp lưng chống sốc Carbon Auto Focus

', 50, N'Auto Focus', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (18, N'Ốp lưng cho Xiaomi - iRON - MAN IRING TRONG SUỐT Nhựa PC cứng viền dẻo chống sốc

', 1, CAST(70000 AS Decimal(18, 0)), N'•	Mẫu chống sốc của iRON - MAN Iring Trong suốt
•	Viền nhựa cứng PC tháo rời được có 3 màu lựa chọn
•	ỐP bên trong nhựa PC cứng , viền ngoài dẻo
•	4 Góc chống sốc
•	Ôm full 360 viền lên mặt trước không lo trầy màn hình
•	Trong Suốt giữa thân ốp
•	Phần camera nhô 0.3mm bảo vệ
•	Chống vân tay
•	Ốp dùng cho máy Xiaomi Redmi Note 9 - Redmi 10X 4G
•	Giá đỡ ở mặt sau có thể xoay 360''

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (19, N'Ốp lưng cho Xiaomi iRON - MAN Nhựa PC cứng viền dẻo chống sốc

', 1, CAST(70000 AS Decimal(18, 0)), N'•	Ốp lưng dùng cho Xiaomi Redmi Note 9 - Redmi 10X 4G
•	Ốp Có 3màu lựa chọn Đen , Đỏ , Xanh 
•	Ốp trong nhựa PC Cứng - Viền Dẻo
•	Mẫu chống sốc của iRON - MAN
•	Viền nhựa cứng PC tháo rời được
•	ỐP bên trong nhựa PC cứng , viền ngoài dẻo
•	Ôm full 360 viền lên mặt trước không lo trầy màn hình
•	Phần camera nhô 0.2mm bảo vệ
•	Có giá đỡ mặt sau
•	Chống bám vân tay
•	Thiết kế vừa vặn, chuẩn xác và chắc chắn cho điện thoại của bạn
•	Chân dựng máy để xem phim, gập lại nhẹ nhàng và gọn gàng
•	Đơn giản , thời trang , phong cách áo giáp 


', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (20, N'Ốp lưng cho Xiaomi, da hươu 4 gốc chống sốc TPU dẻo

', 1, CAST(70000 AS Decimal(18, 0)), N'•	Ốp lưng cho máy Xiaomi 
•	5 màu lựa chọn, đen, nâu, xám, xanh lá, xanh dương
•	Mặt lưng da mịn, viền và mặt trong TPU dẻo đen không biến dạng
•	4 gốc được làm dày chống sốc
•	Phần loa được che bảo vệ tránh bụi và âm thanh được đưa lên phía trên, tiện cho lúc khi chơi game, tay bạn sẽ không che mất âm thanh. 
•	Hình con hươu và chữ được in chìm. 
•	Dễ dàng tháo lắp với máy

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (21, N'Ốp lưng giả da con hươu DEER - Nhựa dẻo TPU', 2, CAST(70000 AS Decimal(18, 0)), N'•	Có 4 màu lựa chọn
•	Kiểu dán hình Deer ( Con Hươu ) trên nền giả da
•	Mặt lưng không bám vân tay
•	Bảo vệ tránh va đập trày xước, bụi bẩn
•	Ôm full máy bo tròn sát máy
•	Ốp không biến dạng
•	Dễ dàng tháo / lắp

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (22, N'Ốp lưng cho Oppo nhám viền màu trượt camera', 3, CAST(60000 AS Decimal(18, 0)), N'•	Ốp lưng cho Oppo 
•	Mặt lưng nhựa PC cứng nhám viền TPU màu dẻo
•	5 màu viền lựa chọn, đen, đỏ, xanh dương, xanh ngọc, xanh rêu
•	Lưng nhám hạn chế vân tay
•	Viền dẻo giúp tháp / lắp ốp dễ dàng hơn
•	Phần camera được thiết kế thêm miếng trượt lên xuống bảo vệ toàn diện
•	Kiểu dán phá cách, khác biệt với tất cả ốp lưng còn lại

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (23, N'Ốp lưng cho Oppo trong viền màu che camera 4 Gốc chống sốc

', 3, CAST(70000 AS Decimal(18, 0)), N'•	Có 6 màu lựa chọn : Đen , Trong , Đỏ , Xanh rêu , Xanh lá , Xanh dương
•	4 Góc chống sốc , Che Full camera bảo vệ tốt
•	Chất liệu PC nhựa cứng trong, viền TPU dẻo màu
•	Ốp vào điện thoại nhìn rất sang
•	Viền ốp vân lốp xe lòi , giúp bám tay dễ dàng cầm hơn
•	Nút bấm âm lương có màu và có Gờ nhẹ nhàng không bị cứng khi dùng ốp , có thể tháo rời , khác màu với viền ốp
•	Dễ dàng tháo / lắp viền dẻo không sợ bị trầy máy

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (24, N'Ốp lưng cho Realme iRON - MAN IRING Nhựa PC cứng viền dẻo chống sốc

', 2, CAST(70000 AS Decimal(18, 0)), N'•	Mẫu chống sốc của iRON - MAN Iring
•	Viền nhựa cứng PC tháo rời được có 3 màu lựa chọn
•	ỐP bên trong nhựa PC cứng , viền ngoài dẻo đen
•	Ôm full 360 viền lên mặt trước không lo trầy màn hình
•	Phần camera nhô 0.3mm bảo vệ
•	Hạn chế vân tay
•	Ốp dùng cho máy Realme 
•	Giá đỡ ở mặt sau có thể xoay 360''

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (25, N'Ốp lưng cho OPPO A52 - A92 trong nhám viền màu', 3, CAST(60000 AS Decimal(18, 0)), N'•	Ốp lưng OPPO A52 - A92 trong nhám viền màu
•	Có 5 màu lựa chọn
•	Ốp nhựa lưng nhám không bám vân tay
•	Hỗ trợ sạc không dây
•	4 Góc chống sốc
•	Ốp nhựa cứng viền màu
•	Mẫu mã đơn giản nhưng sử dụng rất nổi bật
•	Vừa khí với máy
•	Nút bấm nhẹ nhàng không bị cứng khi dùng ốp
•	Dễ dàng tháo / lắp

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (26, N'Ốp lưng cho OPPO A5 - A3S iRON - MAN IRING Nhựa PC cứng viền dẻo chống sốc', 3, CAST(70000 AS Decimal(18, 0)), N'•	Mẫu chống sốc của iRON - MAN Iring
•	Viền nhựa cứng PC tháo rời được có 3 màu lựa chọn
•	ỐP bên trong nhựa PC cứng , viền ngoài dẻo
•	Ôm full 360 viền lên mặt trước không lo trầy màn hình
•	Phần camera nhô cao bảo vệ
•	Chống vân tay
•	Ốp dùng cho máy OPPO A5 - A3S
•	Giá đỡ ở mặt sau có thể xoay 360''

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (27, N'Ốp lưng cho Realme chống sốc Rằn Ri RZANTS

', 2, CAST(90000 AS Decimal(18, 0)), N'•	Ốp lưng dùng cho máy Realme 
•	Ốp viền nhựa TPU dẻo
•	Nhựa PC cứng Không bị ố vàng 
•	Thương hiệu : RZANTS 
•	Viền Camera Nhô cao Bảo Vệ
•	Viền ốp cao hơn màn hình
•	Ốp lưng RZANTS Rằn Ri Trong Suốt 
•	Ôm khít máy và bo tròn các góc cạnh
•	Các vân rằn ri được thiết kế khác nhau, không ốp nào giống ốp nào
•	Dễ dàng tháo/lắp
•	Hạn chế bám vân tay
', 50, N'RZANTS', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (28, N'Ốp lưng cho Realme trong nhám viền màu

', 2, CAST(60000 AS Decimal(18, 0)), N'•	Ốp lưng Realme trong nhám viền màu
•	Có 6 màu lựa chọn
•	Ốp nhựa lưng nhám không bám vân tay
•	Hỗ trợ sạc không dây
•	4 Góc chống sốc
•	Ốp nhựa cứng viền màu
•	Mẫu mã đơn giản nhưng sử dụng rất nổi bật
•	Vừa khí với máy
•	Nút bấm nhẹ nhàng không bị cứng khi dùng ốp
•	Dễ dàng tháo / lắp

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (29, N'Ốp lưng cho Realme trong nhám viền màu 4 Gốc

', 2, CAST(60000 AS Decimal(18, 0)), N'•	Ốp lưng dùng cho máy Realme 
•	Có 5 màu lựa chọn
•	Ốp nhựa lưng nhám không bám vân tay
•	Hỗ trợ sạc không dây
•	4 Góc chống sốc
•	Ốp nhựa cứng viền màu
•	Mẫu mã đơn giản nhưng sử dụng rất nổi bật
•	Vừa khí với máy
•	Nút bấm nhẹ nhàng không bị cứng khi dùng ốp
•	Dễ dàng tháo / lắp

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (30, N'Ốp lưng cho Oppo K5 trong nhám viền màu

', 3, CAST(70000 AS Decimal(18, 0)), N'•	Ốp lưng Oppo K5 trong nhám viền màu
•	Có 6 màu lựa chọn
•	Ốp nhựa lưng nhám không bám vân tay
•	Hỗ trợ sạc không dây
•	4 Góc chống sốc
•	Ốp nhựa cứng viền màu
•	Mẫu mã đơn giản nhưng sử dụng rất nổi bật
•	Vừa khí với máy
•	Nút bấm nhẹ nhàng không bị cứng khi dùng ốp
•	Dễ dàng tháo / lắp

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (31, N'Ốp lưng cho Realme 6 Pro chống sốc iRing Auto Focus', 2, CAST(90000 AS Decimal(18, 0)), N'•	Ốp lưng dành cho máy Realme 6 Pro
•	Mẫu chóng sốc Auto Focus
•	Kèm iRing xoay 360 độ, hít đc trên giá đỡ nam châm trên xe hơi
•	3 màu lựa chọn, iring kim loại theo màu ốp
•	Nhựa TPU dẻo không biến dạng không bám vân tay
•	4 gốc được làm dày chống sốc cao
•	Trước giờ ốp kèm iRing đều là nhựa PC cứng , nay nhựa TPU dẻo đã có mẫu kèm Ring.

', 50, N'Auto Focus', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (32, N'Ốp lưng cho Oppo A5 2020 / A9 2020 / A11X iRON - MAN - Nhựa PC cứng viền dẻo chống sốc VER 2', 3, CAST(70000 AS Decimal(18, 0)), N'•	Mẫu chống sốc của iRON - MAN Ver 2 
•	Viền nhựa cứng PC tháo rời được có 3 màu lựa chọn
•	ỐP bên trong nhựa PC cứng , viền ngoài dẻo
•	Ôm full 360 viền lên mặt trước không lo trầy màn hình
•	Phần camera nhô 0.3mm bảo vệ
•	Chống vân tay
•	Ốp dùng cho máy Oppo A5 2020 / A9 2020 / A11X 

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (33, N'Ốp lưng cho Realme - iRON - MAN - Nhựa PC cứng viền dẻo chống sốc VER 2

', 2, CAST(70000 AS Decimal(18, 0)), N'•	Mẫu chống sốc của iRON - MAN Ver 2 
•	Viền nhựa cứng PC tháo rời được có 3 màu lựa chọn
•	ỐP bên trong nhựa PC cứng , viền ngoài dẻo
•	Ôm full 360 viền lên mặt trước không lo trầy màn hình
•	Phần camera nhô 0.3mm bảo vệ
•	Chống vân tay
•	Ốp dùng cho máy  Realme

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (34, N'Ốp lưng giả da con hươu DEER - Nhựa dẻo TPU cho các dòng máy Oppo A9 (2020) - A5 (2020) - A11X', 3, CAST(70000 AS Decimal(18, 0)), N'•	Ốp lưng cho tất cả dòng Oppo 
•	Có 4 màu lựa chọn
•	Kiểu dán hình Deer ( Con Hươu ) trên nền giả da
•	Mặt lưng không bám vân tay
•	Bảo vệ tránh va đập trày xước, bụi bẩn
•	Ôm full máy bo tròn sát máy
•	Ốp không biến dạng
•	Dễ dàng tháo / lắp

', 50, N'Deer', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (35, N'Ốp lưng Oppo Realme 5 - Realme 5 Pro Trong nhám viền màu', 2, CAST(60000 AS Decimal(18, 0)), N'•	Có 5 màu lựa chọn
•	Ốp nhựa lưng nhám không bám vân tay
•	4 Góc chống sốc
•	Ốp nhựa cứng viền màu
•	Mẫu mã đơn giản nhưng sử dụng rất nổi bật
•	Vừa khí với máy
•	Nút bấm nhẹ nhàng không bị cứng khi dùng ốp
•	Dễ dàng tháo / lắp

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (36, N'Ốp lưng cho Apple iPhone 6 Plus / 7 / 7 Plus / X-XR / XS Max / iPhone 11 / iPhone 11 Pro / iPhone 11 Pro Max iRON - MAN - Nhựa PC cứng viền dẻo chống sốc VER 2', 4, CAST(70000 AS Decimal(18, 0)), N'•	Mẫu chống sốc của iRON - MAN Ver 2 
•	Viền nhựa cứng PC tháo rời được có 3 màu lựa chọn
•	ỐP bên trong nhựa PC cứng , viền ngoài dẻo
•	Ôm full 360 viền lên mặt trước không lo trầy màn hình
•	Phần camera nhô 0.3mm bảo vệ
•	Chống vân tay
•	Ốp dùng cho máy Apple iPhone 6 Plus / 7 / 7 Plus / X-XR / XS Max / iPhone 11 / iPhone 11 Pro / iPhone 11 Pro Max

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (37, N'Ốp lưng Camo rằn ri lính cho các dòng máy iPhone Xs Max / X / Xs / 8 Plus / 7 Plus / 8 / 7 / 6 /6s', 4, CAST(50000 AS Decimal(18, 0)), N'•	Ốp lưng dành cho các dòng máy iPhone
•	Nhựa TPU dẻo không biến dạng
•	Ốp ôm full 360 máy , viền đen
•	Kiếu dán camo rằn ri lính
•	Viền camera nhô bảo vệ chống trày
•	Dễ dàng tháo / lắp

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (38, N'Ốp lưng nhựa TPU dẻo màu, mặt trong vải nhung cho Các dòng iPhone 7 Plus - 8 Plus / X - XS / XS Max , iPhone 11 / 11 Pro / 11 Pro Max', 4, CAST(60000 AS Decimal(18, 0)), N'•	Ốp lưng nhựa TPU dẻo màu, mặt trong vải nhung cho Các dòng iPhone 7 Plus - 8 Plus / X - XS / XS Max , iPhone 11 / 11 Pro / 11 Pro Max
•	Có 7 màu lựa chọn: Đen, Đỏ,Xanh Lá, Tím, Hồng, Xanh Dương,Xám
•	Ốp nhựa TPU dẻo không biến dạng
•	Hạn chế bán dấu vân tay, vết bẩn
•	Viền Camera nhô cao
•	Có thể dùng ốp khi gắn khung viền Camera
•	Các viền bo sát các góc của máy
•	Vừa khít với máy
•	Các nút bấm cực nhẹ
•	Mặt trong có 1 lớp vải Nhung, hạn chế trầy xước cho máy
•	Dễ dàng tháo/lắp
•	Chống trầy xước cho máy
', 50, N'NoBrand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (39, N'Ốp lưng iPhone 11 / 11 Pro / 11 Pro Max trong viền nhựa dẻo XunDD', 4, CAST(120000 AS Decimal(18, 0)), N'•	Ốp dùng cho máy iPhone 11 / 11 Pro / 11 Pro Max
•	Thương hiệu: XunDD
•	Có 3 màu lựa chọn : Đen, Đỏ ,Xanh
•	Chất liều nhựa TPU dẻo không biến dạng
•	Ốp mặt lưng trong suốt Full viền màu
•	Vừa khít với máy
•	Ốp có 4 góc dày chống sốc sốc, chống va đập
•	Dễ dàng tháo/lắp


', 50, N'XunDD', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (40, N'Ốp lưng iPhone 6-7-8 / 7 Plus - 8 Plus / X - Xs / XR / Xs Max / 11 / 11 Pro / 11 Pro Max trong nhám viền màu', 4, CAST(50000 AS Decimal(18, 0)), N'•	Ốp lưng dùng cho các dòng máy iPhone
•	Có 5 màu lựa chọn
•	Ốp nhựa lưng nhám không bám vân tay
•	Hỗ trợ sạc không dây
•	4 Góc chống sốc
•	Ốp nhựa cứng viền màu
•	Mẫu mã đơn giản nhưng sử dụng rất nổi bật
•	Vừa khí với máy
•	Nút bấm nhẹ nhàng không bị cứng khi dùng ốp
•	Dễ dàng tháo / lắp

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (41, N'Ốp lưng Apple giả da con hươu DEER - Nhựa dẻo TPU

', 4, CAST(70000 AS Decimal(18, 0)), N'•	Ốp lưng dành cho máy Apple iPhone 
•	Kiểu dán hình Deer ( Con Hươu ) trên nền giả da
•	Mặt lưng không bám vân tay
•	Bảo vệ tránh va đập trày xước, bụi bẩn
•	Ôm full máy bo tròn sát máy
•	Ốp không biến dạng
•	Dễ dàng tháo / lắp

', 50, N'Deer', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (42, N'Ốp lưng gương SULADA cho Apple iPhone X - XS - XS MAX', 4, CAST(140000 AS Decimal(18, 0)), N'•	Ốp dành cho máy Apple iPhone X - XS - XS MAX
•	Có 4 màu lựa chọn : Đen, Đỏ, Trắng, Hồng
•	Kiểu dáng mặt gương sang trọng mang tính thời trang rất cao
•	Mặt lưng nhựa kính cứng, mặt kính cường lực
•	Ốp mặt kính cứng, viền nhựa dẻo chống sốc cao
•	Ôm full 360 viền lên mặt trước không lo trầy màn hình
•	Phần camera nhô 0.3mm bảo vệ
•	Ốp bảo vệ, chống trầy rất tốt cho máy và còn đảm bảo được tĩnh thẩm mỹ rất cao vậy sao các bạn không nhanh tay sở hữu một cái ốp cho riêng mình.

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (43, N'Ốp lưng Apple iPhone gương 7 màu ,viền dẻo

', 4, CAST(90000 AS Decimal(18, 0)), N'•	Ốp lưng dành cho máy Apple iPhone 
•	7 mẫu lựa chọn
•	Mặt lưng kính màu viền TPU dẻo đen
•	Ôm full máy 360 bảo vệ
•	Dễ dàng tháo lắp
•	Kiểu dán sang chảnh lắp lánh 7 màu

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (44, N'Ốp lưng Apple iRON - MAN IRING Nhựa PC cứng viền dẻo chống sốc

', 4, CAST(70000 AS Decimal(18, 0)), N'•	Mẫu chống sốc của iRON - MAN Iring
•	Viền nhựa cứng PC tháo rời được có 3 màu lựa chọn
•	ỐP bên trong nhựa PC cứng , viền ngoài dẻo
•	Ôm full 360 viền lên mặt trước không lo trầy màn hình
•	Phần camera nhô 0.3mm bảo vệ
•	Chống vân tay
•	Ốp dùng cho máy Apple iPhone 
•	Giá đỡ ở mặt sau có thể xoay 360''

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (45, N'Ốp Lưng iPhone X/XS - XR - XS MAX Trong Viền Màu Baseus', 4, CAST(150000 AS Decimal(18, 0)), N'•	Ốp dùng cho iPhone X - XR - XS MAX
•	Ốp lưng mặt kính trong suốt viền ốp màu đẹp
•	Kiểu dáng mạnh mẽ, cứng cáp
•	Bảo vệ tránh va đập trày xước, bụi bẩn
•	Ôm full máy bo tròn sát máy
•	Ốp không biến dạn 
•	Dễ dàng tháo / lắp
•	Có 3 màu lựa chọn 

', 50, N' Baseus', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (46, N'Ốp lưng dùng cho máy Apple iPhone X - Hình 3D mèo thân tài - nhựa TPU dẻo', 4, CAST(60000 AS Decimal(18, 0)), N'•	Ốp lưng dùng cho	Máy Apple IPHONE X
•	Mẫu lựa chọn	8 Hình 3D đa dạng
•	Sản phẩm gồm	01 Ốp lưng IPHONE X
•	Thương hiệu	OEM
•	Chất liệu	NHỰA TPU DẺO
•	Kích thước	Mỏng 0.9mm
•	Cân nặng	10gram
•	Kiểu dán mèo thần tài may mắn
•	Bảo vệ tránh va đập trày xước, bụi bẩn
•	Phần camera nhô lên 0.3mm bảo vệ 
•	Ôm full máy bo tròn sát máy
•	Ốp không biến dạng
•	Dễ dàng tháo / lắp

', 50, N'OEM', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (47, N'Ốp lưng dành cho máy Apple IPHONE X chống sốc - Rugged Armor', 4, CAST(70000 AS Decimal(18, 0)), N'•	Ốp lưng dùng cho Máy Apple IPHONE X chống sốc - Rugged Armor
•	•	Màu lựa chọn	Đen, xanh đen, xám , đỏ
•	Sản phẩm gồm 01 Ốp IPHONE X chống sốc - Rugged Armor
•	Thương hiệu Khác
•	Chất liệu NHỰA TPU DẺO
•	Kích thước Mõng 1.5mm
•	Cân nặng 15gram
•	Kiểu dáng đơn giản, 4 màu lựa chọn
•	Thiết kế vân nhám sang trong, mạnh mẽ
•	Bảo vệ tránh va đập trày xước, bụi bẩn
•	Phần camera nhô lên 0.3mm bảo vệ 
•	Ôm full máy bo tròn sát máy
•	Ốp không biến dạng 
•	Dễ dàng tháo / lắp
•	Chống sốc cao

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (48, N'Ốp lưng iPhone chống sốc nhựa TPU dẻo Rugged Armor Giả da

', 4, CAST(70000 AS Decimal(18, 0)), N'Ốp lưng nhựa dẻo Armor bảo vệ máy dành cho iPhone 6 Plus
Ốp bo đủ các cạnh giúp chống va đập để giảm thiểu bớt thiệt hại cho bạn. 
Ốp Được làm từ nhựa giả da. 
Chống Sốc - chống vân tay - nhám - giả da
Chống chịu va đập cao
Thiết kế đẹp - sang trọng
Vật liệu nhựa cao cấp cho cảm giác cầm thoải mái - không bị cản sóng. 
Ốp lưng iPhone 6 Plus Rugged Armor
Các phím bấm như Volume, Nguồn được làm nhô ra 1 chút mang lại cảm giác bấm nhẹ nhạy, đặc biệt phím nguồn làm sần bấm thích hơn.
', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (49, N'Ốp lưng iPhone chống sốc nhựa TPU dẻo Rugged Armor

', 4, CAST(70000 AS Decimal(18, 0)), N'-Ốp được làm bằng nhựa dẻo , mặt sau của ốp nhám , chống vân tay , viền camera nhô 0.3mm để bảo vệ camera không bị trầy. Nút bấm tắt , mở rất nhẹ và êm , mặt trong của ốp có 1 màn rất mịn.
-Ôm 360 full viền độ 4 gốc, chất liệu silicon dẽo, mặt sau nhám chống trơn, kiểu dán đơn giản, chống sốc. 
 
- Các phím bấm như Volume, Nguồn được làm nhô ra 1 chút mang lại cảm giác bấm nhẹ nhạy, đặc biệt phím nguồn làm sần bấm thích hơn. 

- Ốp lưng iPhone 7 , iPhone 7 , Ốp iPhone 7.

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (50, N'Ốp lưng TPU iPhone hình 3D

', 4, CAST(65000 AS Decimal(18, 0)), N'Ốp lưng dành cho iPhone 
Chất liệu nhựa TPU dẻo , siêu mõng
Phần camera làm nhô lên bảo khỏi trày camera
Viền trong suốt , hình 3d nổi, nhám và chống vân tay
Hiện tại có 2 mẫu hình lựa chọn

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (51, N'Ốp lưng iPhone 6/6S UNIQ Tranforma', 4, CAST(150000 AS Decimal(18, 0)), N'Ốp lưng dành cho iPhone 
Chất liệu nhựa TPU dẻo , siêu mõng
Phần camera làm nhô lên bảo khỏi trày camera
Viền trong suốt , hình 3d nổi, nhám và chống vân tay
Hiện tại có 2 mẫu hình lựa chọn

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (52, N'Ốp lưng iPhone thổ cẩm hình sói trắng

', 4, CAST(65000 AS Decimal(18, 0)), N'Ốp lưng dành cho iPhone 
Chất liệu nhựa TPU dẻo , siêu mõng
Phần camera làm nhô lên bảo khỏi trày camera
Viền trong suốt , hình 3d nổi, nhám và chống vân tay
Hiện tại có 2 mẫu hình lựa chọn

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (53, N'Case cho tai nghe Airpods 1 / 2 / Pro - Hình Cây Kem - ICE CREAM', 4, CAST(90000 AS Decimal(18, 0)), N'•	Case cho tai nghe Apple Airpods 1 / 2 / Pro
•	Chất liệu dẻo, kiểu dáng dạng ví 
•	Case vừa khít với Airpods 1 / 2 / Pro
•	Khoét lỗ sạc
•	Kèm móc tiện dụng
•	Cầm ko trơn tay
•	Dễ dàng tháo/lắp
•	Lưu ý : Sản phẩm không kèm tai nghe
#Airpods #tainghebluetooth #CaseAirpods #AirpodsPro

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (54, N'Case cho tai nghe Airpods 1 / 2, Airpods Pro, PC Đen họa tiết màu', 4, CAST(90000 AS Decimal(18, 0)), N'•	Case dùng cho tai nghe Airpods 1 / 2, Airpods Pro
•	Họa tiết có 5 màu lựa chọn
•	Làm bằng chất liệu PC cứng
•	Case dùng được cho Airpods 1, Airpods 2, Airpods Pro
•	Khoét lỗ sạc
•	Cầm ko trơn tay, rửa nước được, khô nhanh k bị thấm nước sạch như mới
•	Dễ dàng tháo/lắp
•	Lưu ý : Sản phẩm không kèm tai nghe
#Airpods #tainghebluetooth #CaseAirpods #AirpodsPro

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (55, N'Case cho tai nghe Airpods Pro - Giả da PU', 4, CAST(110000 AS Decimal(18, 0)), N'•	Case cho tai nghe Apple Airpods Pro
•	Kiểu dáng giả da sang trọng
•	Có 4 Màu lựa chọn
•	Case vừa khít với Airpods Pro
•	Khoét lỗ sạc
•	Kèm theo móc tiện dụng
•	Cầm ko trơn tay
•	Dễ dàng tháo/lắp
#Airpods #tainghebluetooth #CaseAirpods #AirpodsPro

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (56, N'Case cho tai nghe Airpods Pro - Giả ví da, hình Gấu', 4, CAST(90000 AS Decimal(18, 0)), N'•	Case cho tai nghe Apple Airpods Pro
•	Chất liệu giả da, kiểu dáng dạng ví 
•	Có 3 mẫu lựa chọn
•	Case vừa khít với Airpods Pro
•	Khoét lỗ sạc
•	Kèm móc tiện dụng
•	Cầm ko trơn tay
•	Dễ dàng tháo/lắp
•	Lưu ý : Sản phẩm không kèm tai nghe
#Airpods #tainghebluetooth #CaseAirpods #AirpodsPro

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (57, N'Case cho tai nghe Airpods PRO - PC cứng hình Snoopy - Charlie', 4, CAST(90000 AS Decimal(18, 0)), N'Case cho tai nghe Apple Airpods PRO
Chất liệu dẻo, kiểu dáng dạng ví
Case vừa khít với Airpods PRO
Khoét lỗ sạc
Kèm móc tiện dụng
Cầm ko trơn tay
Dễ dàng tháo/lắp
Lưu ý : Sản phẩm không kèm tai nghe
#Airpods #tainghebluetooth #CaseAirpods #AirpodsPro

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (58, N'Case PC cứng cho tai nghe Airpods Pro nắp rời hình Đá', 4, CAST(110000 AS Decimal(18, 0)), N'•	Case cho tai nghe không dây Airpods Pro
•	Có 4 màu lựa chọn: Đen, Trắng, Xám, Xanh
•	Case vừa khít với Airpods Pro
•	Khoét lỗ sạc
•	Cầm ko trơn tay, rửa nước được, khô nhanh k bị thấm nước
•	Case bo tròn theo góc cạnh của Airpods
•	Dễ dàng tháo/lắp
#Airpods #tainghebluetooth #CaseAirpods #AirpodsPro

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (59, N'Case silicon cho tai nghe Airpods 1 / 2 mẫu Cún mắt đốm nâu', 4, CAST(90000 AS Decimal(18, 0)), N'•	Túi silicon dùng cho tai nghe Airpods 1 / 2, Airpods Pro
•	Làm bằng chất liệu nhựa dẻo, không biến dạng
•	Case silicon dùng được cho Airpods 1 / 2, Airpods Pro
•	Case vừa khít với Airpods 1 / 2, Airpods Pro
•	Khoét lỗ sạc
•	Cầm ko trơn tay, rửa nước được, khô nhanh k bị thấm nước sạch như mới
•	Dễ dàng tháo/lắp
•	Lưu ý : Sản phẩm không kèm tai nghe
#Airpods #tainghebluetooth #CaseAirpods #AirpodsPro

', 49, N'No Brand', 1, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (60, N'Case silicon cho tai nghe Airpods 1 / 2, Airpods Pro mẫu Bánh mì ốp la', 4, CAST(90000 AS Decimal(18, 0)), N'•	Túi silicon dùng cho tai nghe Airpods 1 / 2, Airpods Pro
•	Kiểu dáng dễ thương được nhiều người ưa chuộng
•	Làm bằng chất liệu nhựa dẻo, không biến dạng
•	Case silicon dùng được cho Airpods 1, Airpods 2, Airpods Pro

•	Khoét lỗ sạc
•	Kèm móc tiện dụng
•	Cầm ko trơn tay, rửa nước được, khô nhanh k bị thấm nước sạch như mới
•	Dễ dàng tháo/lắp
•	Lưu ý : Sản phẩm không kèm tai nghe
#Airpods #tainghebluetooth #CaseAirpods

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (61, N'Ốp lưng silicon màu Vsmart Aris Pro siêu mỏng', 5, CAST(60000 AS Decimal(18, 0)), N'Ốp lưng silicon màu Vsmart siêu mỏng không ố vàng, chống bám vân tay. 
Chất liệu TPU mịn, mềm, dẻo và rất mỏng, bảo vệ máy toàn diện khỏi trày xước, va đập. 
Phần camera của máy được bảo vệ khi đặt xuống bàn với thiết kế nhô lên của ốp lưng phía camera. 
Các phím bấm được làm nổi giúp thao tác dễ dàng.

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (62, N'Ốp lưng silicon dẻo trong suốt bảo vệ camera Vsmart', 5, CAST(50000 AS Decimal(18, 0)), N'Ốp lưng silicon dẻo trong suốt bảo vệ camera Vsmart. 
Chất liệu TPU mềm dẻo, có độ đàn hồi cao, có thể bóp lại, cuộn lại mà không biến dạng. 
Sản phẩm được tráng lớp chống dính lưng nên không bị loang hay dính như chất liệu silicon thường.
', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (63, N'Bao Da Clear View cho Samsung Galaxy Note 20 Ultra', 6, CAST(790000 AS Decimal(18, 0)), N'Samsung Galaxy Note 20 Ultra là siêu phẩm vừa ra mắt năm 2020 của Samsung với thiết kế tuyệt đẹp cùng với những tính năng được nâng cấp mang đến trải nghiệm ấn tượng cho người dùng. Sử dụng một chiếc siêu phẩm như thế nên người dùng luôn tìm kiếm những món phụ kiện giúp bảo vệ cho smartphone của mình một cách an toàn. Bao da cho Samsung Galaxy Note 20 Ultra Clear View sẽ là món phụ kiện tuyệt vời với thiết kế mặt trước trong suốt tiện lợi cùng chất liệu da cao cấp sang trọng.
Thiết kế mỏng nhẹ, mặt trước trong suốt hiển thị thời gian, thông báo,...
Bao da Clear View cho Samsung Galaxy Note 20 Ultra có thiết kế đơn giản nhưng vẫn vô cùng bắt mắt với những gam màu thời trang như Nâu, Trắng, Đen. Sử dụng chất liệu da cao cấp để tạo nên một món phụ kiện đẹp cùng với độ bền tốt, mềm mại nhưng vẫn đủ cứng cáp để bảo vệ cho smartphone. Với kích thước vừa vặn được thiết kế dành riêng cho Samsung Galaxy Note 20 Ultra, bao da sẽ ôm sát smartphone, tạo nên lớp bảo vệ hoàn hảo.

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (64, N'Ốp lưng Samsung Galaxy S21 Ultra Silicone kèm S-Pen', 6, CAST(1590000 AS Decimal(18, 0)), N'Ốp lưng Samsung Galaxy S21 Ultra Silicone kèm S-Pen đẹp, độc, thích ứng cao
Thêm một mẫu ốp lưng nữa cho nhà Samsung Galaxy S21 Ultra để cho khách hàng có thêm nhiều lựa chọn đó là ốp lưng Silicon có kèm S-Pen. Vậy mẫu ốp lưng Samsung Galaxy S21 Ultra Silicone kèm S-Pen này có gì đặc biệt? Hãy cùng khám phá chi tiết về sản phẩm này dưới đây nhé.
Thiết kế đẹp, độc, bảo vệ máy hoàn hảo
Ốp lưng Samsung Galaxy S21 Ultra Silicone kèm S-Pen được thiết kế đẹp, bền bỉ với chất liệu silicon cao cấp mang đến khả năng đàn hồi tốt và chống xước lưng máy. Ốp còn hạn chế tình trạng rạn vỡ lưng điện thoại nếu bị va đập trong quá trình sử dụng. Đặc biệt là các vật sắc, nhọn khi bỏ chung trong túi xách hoặc balo.
Các chi tiết của ốp đều được hoàn thiện một cách tỉ mỉ và chính xác không có một chi tiết thừa nào. Thiết kế này đảm bảo cho sự truy cập vào màn hình điện thoại nhạy và không bị cứng. Hơn nữa, ốp không hề bị ố vàng sau một thời gian sử dụng.
Ngoài ra, ốp lưng còn hỗ trợ sạc không dây thông minh, thuận tiện cho người dùng sử dụng.

', 50, N'Samsung', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (65, N'Ốp lưng SamSung Galaxy vân carbon

', 6, CAST(50000 AS Decimal(18, 0)), N'Ốp lưng Samsung Galaxy vân carbon. 
Chất liệu PU và sợi tổng hợp cao cấp thân thiện với môi trường, có khả năng đàn hồi tốt, không bị giòn và khả năng chống trầy xước tốt. Mặt sau ốp lưng được thiết kế các đường vân carbon tạo phong cách riêng cho người sử dụng, giúp ốp lưng bám vào tay tốt hơn, tránh trơn trượt và không lưu lại dấu vân tay. Ốp lưng ôm khít thân máy, giữ nguyên thiết kế máy, các chi tiết camera, volume, loa…được làm chính xác thuận tiện nhất cho người sử dụng.

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (66, N'Bao da SamSung Galaxy A52 chính hãng Nillkin QIN', 6, CAST(220000 AS Decimal(18, 0)), N'Bao da SamSung Galaxy A52 chính hãng Nillkin QIN được thiết kế dạng mở ngang giống như quyển sổ tay nhỏ cầm tay. Mặt trước và mặt sau được làm từ chất liệu da thật cao cấp với màu sắc thời trang như: nâu da bò, trắng, đỏ và đen. Bên trong bao da Nillkin QIN SamSung Galaxy A52 là lớp nhung mềm mịn giúp bảo vệ tối đa các góc cạnh của điện thoại trong những trường hợp va chạm không mong muốn, đặc biệt là mặt trước bao da có khe đựng card visit, thẻ ATM…Sản phẩm có nhiều màu.', 50, N'Nillkin', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (67, N'Bao da SamSung Galaxy chính hãng FIBCOLOR X-Level PIPILU HongKong

', 6, CAST(150000 AS Decimal(18, 0)), N'Bao da Samsung Galaxy chính hãng FIBCOLOR X-Level PIPILU HongKong. Sản phẩm được làm từ chất liệu TPU, giả da cao cấp, mịn, chất liệu tốt, độ dày vừa phải (1.3 mm) đủ để bảo vệ máy khi rơi rớt, va đập, nhẹ nhưng vẫn rất sang trọng. Thiết kế kiểu gập ngang như quyển sổ để xem phim, nghe nhạc, luớt web…Phần ốp lưng được là chất liệu nhựa dẻo cao cấp, mềm có thể bóp méo mà không bị biến dạng, bảo vệ tối đa cho chiếc máy của bạn khi va chạm. Phần lưng ôm khít toàn bộ lưng và viền máy, chỉ để hở những phần cần thiết như camera, nút nguồn, sạc, volume, loa… Sản phẩm có nhiều màu.', 50, N'FIBCOLOR', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (68, N'Bao da dạng ví SamSung Galaxy A02s hiệu Hanman có quai cài', 6, CAST(150000 AS Decimal(18, 0)), N'Bao da dạng ví SamSung Galaxy A02s hiệu Hanman có quai cài. Bao da được làm từ chất liệu da cao cấp, bền chắc, rất khó bị trầy, bong tróc và khó bám bẩn. Mặt trước bao da có ngăn đựng tiền, và các ngăn phụ để card visit, thẻ ATM….Mép viền được khâu tỉ mỉ chống bong tách, độ bền cao hơn. Phần ốp lưng làm bằng nhựa TPU mềm dẻo ôm khít viền máy. Thiết kế chắc chắn chống sốc khi va đập mà vẫn dễ dàng tháo lắp. Đặc điểm nổi bật nữa của sản phẩm là mặt trước bao da có quai gài nam châm hút vào màn hình rất gọn, không bị bung ra lỏng lẻo gây trầy xước màn hình khi để chung với các vật dụng khác. Bao da thiết kế có thể dựng máy để xem phim, nghe nhạc, luớt web…Sản phẩm có nhiều màu.', 50, N'Hanman', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (69, N'Ốp lưng silicon dẻo trong suốt chống sốc Samsung Galaxy S21 chính hãng Nillkin Nature', 6, CAST(100000 AS Decimal(18, 0)), N'Ốp lưng silicon dẻo trong suốt chống sốc Samsung Galaxy S21 chính hãng Nillkin Nature, bảo vệ camera lồi của điện thoại (phía lưng phần tiếp xúc camera thiết kế nhô cao để  tránh trầy xước camera khi đặt xuống bàn). 
Chất liệu TPU cao cấp, mềm dẻo, có độ đàn hồi cao, có thể bóp, uốn mà không biến dạng, bảo vệ toàn bộ lưng và viền máy. Điểm đặc biệt khác với chất liệu silicon thường là phía trong ốp lưng thiết kế các ô kẻ caro rất nhỏ và tráng lớp tránh dính lưng. 
Ốp lưng được thiết kế với 4 góc dày dặn hơn (hầu hết khi rơi máy các góc sẽ va chạm đầu tiến), kết hợp với phần khung viền từ nhựa dẻo TPU cao cấp khá dầy dặn, phần tiếp xúc với cạnh máy có làm thêm các đường gân không những giúp cho ốp cầm chắc tay hơn mà còn tăng khả năng đàn hồi, bảo vệ toàn bộ máy luôn an toàn trước mọi va chạm. 
Mọi chi tiết hoàn thiện của ốp lưng đều làm rất đẹp, các vết cắt mịn, đều. Các phím bấm được làm nổi giúp thao tác dễ dàng.

', 50, N'Nillkin', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (70, N'Ốp lưng chống sốc Iron Man SamSung Galaxy S21 Ultra', 6, CAST(100000 AS Decimal(18, 0)), N'Ốp lưng silicon dẻo trong suốt chống sốc Samsung Galaxy S21 chính hãng Nillkin Nature, bảo vệ camera lồi của điện thoại (phía lưng phần tiếp xúc camera thiết kế nhô cao để  tránh trầy xước camera khi đặt xuống bàn). 
Chất liệu TPU cao cấp, mềm dẻo, có độ đàn hồi cao, có thể bóp, uốn mà không biến dạng, bảo vệ toàn bộ lưng và viền máy. Điểm đặc biệt khác với chất liệu silicon thường là phía trong ốp lưng thiết kế các ô kẻ caro rất nhỏ và tráng lớp tránh dính lưng. 
Ốp lưng được thiết kế với 4 góc dày dặn hơn (hầu hết khi rơi máy các góc sẽ va chạm đầu tiến), kết hợp với phần khung viền từ nhựa dẻo TPU cao cấp khá dầy dặn, phần tiếp xúc với cạnh máy có làm thêm các đường gân không những giúp cho ốp cầm chắc tay hơn mà còn tăng khả năng đàn hồi, bảo vệ toàn bộ máy luôn an toàn trước mọi va chạm. 
Mọi chi tiết hoàn thiện của ốp lưng đều làm rất đẹp, các vết cắt mịn, đều. Các phím bấm được làm nổi giúp thao tác dễ dàng.

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (71, N'Ốp lưng SamSung Galaxy S21+ Plus chính hãng Nillkin dạng sần', 6, CAST(120000 AS Decimal(18, 0)), N'Ốp lưng chống sốc Iron Man cho SamSung Galaxy S21 Ultra. 
Chất liệu kết hợp giữa PC cứng cáp và TPU dẻo dai, giúp chống sốc và bảo vệ SamSung Galaxy S21 Ultra một cách hoàn hảo nhất. 
Ý tưởng thiết kế dựa trên bộ áo giáp trong bộ phim nổi tiếng Iron Man. 
Cấu tạo với ốp lưng cứng bên ngoài và lớp viền mềm bên trong chống xây xước máy, không làm dầy như đại đa số các loại ốp lưng có 2 lớp khác; đi kèm chân chống ở giữa lưng hỗ trợ dựng ngang máy xem phim, nghe nhac, chơi game, lướt web,…. Sản phẩm có nhiều màu.

', 50, N'Nillkin', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (72, N'Bao da dạng ví SamSung Galaxy', 6, CAST(150000 AS Decimal(18, 0)), N'Bao da dạng ví SamSung Galaxy  Luxury Leather. 
Bao da được làm từ chất liệu da cao cấp, bền chắc, rất khó bị trầy, bong tróc và khó bám bẩn. Mặt trước bao da có ngăn đựng tiền, và các ngăn phụ để card visit, thẻ ATM….
Mép viền được khâu tỉ mỉ chống bong tách, độ bền cao hơn. 
Phần ốp lưng làm bằng nhựa TPU mềm dẻo ôm khít viền máy. Thiết kế chắc chắn chống sốc khi va đập mà vẫn dễ dàng tháo lắp. 
Đặc điểm nổi bật nữa của sản phẩm là mặt trước bao da có nam châm hút vào màn hình rất gọn, không bị bung ra lỏng lẻo gây trầy xước màn hình khi để chung với các vật dụng khác, khi gập lại phía sau cũng có nam châm hút chắc chắn. 
Bao da thiết kế có thể dựng máy để xem phim, nghe nhạc, luớt web…Sản phẩm có nhiều màu.

', 50, N'Luxury Leather', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (73, N'Ốp lưng chống bẩn silicon Samsung Galaxy Note', 6, CAST(100000 AS Decimal(18, 0)), N'Ốp lưng chống bẩn silicon Samsung Galaxy Note  thiết kế để bảo vệ tốt nhất cho điện thoại của bạn, hình thức vỏ silicon vừa khít với các nút âm lượng, nút bên cạnh và đường cong của. 
Phía trong ốp là lớp lót microfiber mềm ở bên trong giúp bảo vệ khỏi trầy xước và bụi bẩn chiếc điện thoại của bạn. 
Ở bên ngoài, lớp vỏ mềm mượt của lớp vỏ silicon tạo cảm giác tuyệt vời trong tay bạn. Điểm nổi bật của sản phẩm là chống va đập tốt, khả năng chống bụi bẩn tuyệt vời (không dính mực, không dính bụi bẩn, mồ hôi tay…). 
Bạn có thể viết, vẽ lên ốp lưng mà lau đi vẫn sạch. Sản phẩm có màu đen và xanh đen
', 50, N'Samsung', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (74, N'Ốp lưng chống bẩn silicon Samsung Galaxy S20 FE', 6, CAST(100000 AS Decimal(18, 0)), N'Ốp lưng chống bẩn silicon Samsung Galaxy S20 FE thiết kế để bảo vệ tốt nhất cho điện thoại của bạn, hình thức vỏ silicon vừa khít với các nút âm lượng, nút bên cạnh và đường cong của. 
Phía trong ốp là lớp lót microfiber mềm ở bên trong giúp bảo vệ khỏi trầy xước và bụi bẩn chiếc điện thoại của bạn. 
Ở bên ngoài, lớp vỏ mềm mượt của lớp vỏ silicon tạo cảm giác tuyệt vời trong tay bạn.
 Điểm nổi bật của sản phẩm là chống va đập tốt, khả năng chống bụi bẩn tuyệt vời (không dính mực, không dính bụi bẩn, mồ hôi tay…). 
Bạn có thể viết, vẽ lên ốp lưng mà lau đi vẫn sạch. Sản phẩm có màu nhiều màu

', 50, N'Samsung', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (75, N'Ốp lưng chống bẩn silicon Samsung Galaxy S10 5G', 6, CAST(100000 AS Decimal(18, 0)), N'Ốp lưng chống bẩn silicon Samsung Galaxy S10 5G thiết kế để bảo vệ tốt nhất cho điện thoại của bạn, hình thức vỏ silicon vừa khít với các nút âm lượng, nút bên cạnh và đường cong của. 
Phía trong ốp là lớp lót microfiber mềm ở bên trong giúp bảo vệ khỏi trầy xước và bụi bẩn chiếc điện thoại của bạn. 
Ở bên ngoài, lớp vỏ mềm mượt của lớp vỏ silicon tạo cảm giác tuyệt vời trong tay bạn. 
Điểm nổi bật của sản phẩm là chống va đập tốt, khả năng chống bụi bẩn tuyệt vời (không dính mực, không dính bụi bẩn, mồ hôi tay…). 
Bạn có thể viết, vẽ lên ốp lưng mà lau đi vẫn sạch. Sản phẩm có màu nhiều màu

', 50, N'Samsung', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (76, N'Ốp lưng vải Samsung Galaxy M51 kèm Ring chính hãng DLONS', 6, CAST(150000 AS Decimal(18, 0)), N'Ốp lưng vải Samsung Galaxy M51 kèm Ring chính hãng DLONS được làm từ chất liệu vải phía lưng, khay là silicon dẻo. 
Chất liệu vải cao cấp, thiết kết đơn giản nhưng nổi bật cá tính, khay lưng ôm vào thân máy là chất liệu silicon dẻo, ôm sát, bảo vệ 4 góc máy, tạo cảm giác nhẹ nhàng, không quá dày khi cầm lên tay. 
Đặc biệt phía sau lưng ốp lưng còn được gắn thêm Ring có thể sử dụng làm giá đỡ điện thoại để bạn có thể xem phim, xem video thật thoải mái mà không bị mỏi tay, nó cũng có thể sử dụng để xỏ ngón tay vào để không làm rơi điện thoại. Sảm phẩm có nhiều màu.

', 50, N'DLONS', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (77, N'Ốp lưng SamSung Galaxy silicon giả da Auto Focus

', 6, CAST(70000 AS Decimal(18, 0)), N'Ốp lưng SamSung Galaxy A11 silicon giả da Auto Focus. 
Chất liệu TPU dẻo, dày dặn, bảo vệ toàn bộ lưng và viền máy, chống va đập. 
Phía trong thiết kế có những gân tản nhiệt, giúp máy bớt nóng khi chơi game, xem phim, … 
Phần lưng thiết kế vân da, rất giống da thật, cầm bám tay, không bám mồ hôi, vân tay, không mờ, không ố vàng trong quá trình sử dụng. 
Sản phẩm thiết kế vừa vặn với các chi tiết của máy, khi ốp vào SamSung Galaxy A11 rất tinh tế, sang trọng. Sản phẩm có nhiều màu.
', 50, N'Auto Focus', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (78, N'Bao da dạng ví SamSung Galaxy hiệu Hanman có quai cài

', 6, CAST(150000 AS Decimal(18, 0)), N'Bao da dạng ví SamSung Galaxy M11 hiệu Hanman có quai cài. 
Bao da được làm từ chất liệu da cao cấp, bền chắc, rất khó bị trầy, bong tróc và khó bám bẩn. 
Mặt trước bao da có ngăn đựng tiền, và các ngăn phụ để card visit, thẻ ATM….Mép viền được khâu tỉ mỉ chống bong tách, độ bền cao hơn. 
Phần ốp lưng làm bằng nhựa TPU mềm dẻo ôm khít viền máy. 
Thiết kế chắc chắn chống sốc khi va đập mà vẫn dễ dàng tháo lắp. Đặc điểm nổi bật nữa của sản phẩm là mặt trước bao da có quai gài nam châm hút vào màn hình rất gọn, không bị bung ra lỏng lẻo gây trầy xước màn hình khi để chung với các vật dụng khác. 
Bao da thiết kế có thể dựng máy để xem phim, nghe nhạc, luớt web…Sản phẩm có nhiều màu. 


', 50, N'Hanman', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (79, N'Bao da dạng ví SamSung Galaxy M11 Luxury Leather', 6, CAST(150000 AS Decimal(18, 0)), N'Bao da dạng ví SamSung Galaxy M11 Luxury Leather. 
Bao da được làm từ chất liệu da cao cấp, bền chắc, rất khó bị trầy, bong tróc và khó bám bẩn. Mặt trước bao da có ngăn đựng tiền, và các ngăn phụ để card visit, thẻ ATM….
Mép viền được khâu tỉ mỉ chống bong tách, độ bền cao hơn. 
Phần ốp lưng làm bằng nhựa TPU mềm dẻo ôm khít viền máy. 
Thiết kế chắc chắn chống sốc khi va đập mà vẫn dễ dàng tháo lắp. 
Đặc điểm nổi bật nữa của sản phẩm là mặt trước bao da có nam châm hút vào màn hình rất gọn, không bị bung ra lỏng lẻo gây trầy xước màn hình khi để chung với các vật dụng khác, khi gập lại phía sau cũng có nam châm hút chắc chắn. 
Bao da thiết kế có thể dựng máy để xem phim, nghe nhạc, luớt web…Sản phẩm có nhiều màu. 

', 50, N'Luxury Leather', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (80, N'Ốp lưng silicon dẻo màu Samsung Galaxy M31', 6, CAST(90000 AS Decimal(18, 0)), N'Ốp lưng silicon dẻo màu Samsung Galaxy M31. 
Thiết kế gọn nhẹ, làm từ chất liệu TPU, nhựa dẻo cao cấp bám chặt tay khi cầm, tao nhã kiểu dáng hợp thời trang. 
Các chi tiết nút nguồn, nút âm lượng được làm nổi chuẩn với các chi tiết của máy, giúp bạn dễ dàng thao tác. Phần bề mặt ốp lưng được làm mịn chống bám vân tay rất tốt.

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (81, N'Bao da dạng ví Huawei Luxury Leather

', 7, CAST(150000 AS Decimal(18, 0)), N'Bao da dạng ví Huawei  Luxury Leather. 
Bao da được làm từ chất liệu da cao cấp, bền chắc, rất khó bị trầy, bong tróc và khó bám bẩn. Mặt trước bao da có ngăn đựng tiền, và các ngăn phụ để card visit, thẻ ATM.... 
Mép viền được khâu tỉ mỉ chống bong tách, độ bền cao hơn. 
Phần ốp lưng làm bằng nhựa TPU mềm dẻo ôm khít viền máy. Thiết kế chắc chắn chống sốc khi va đập mà vẫn dễ dàng tháo lắp. 
Đặc điểm nổi bật nữa của sản phẩm là mặt trước bao da có nam châm hút vào màn hình rất gọn, không bị bung ra lỏng lẻo gây trầy xước màn hình khi để chung với các vật dụng khác, khi gập lại phía sau cũng có nam châm hút chắc chắn. 
Bao da thiết kế có thể dựng máy để xem phim, nghe nhạc, luớt web…Sản phẩm có nhiều màu. 

', 50, N'Luxury Leather', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (82, N'Ốp lưng Huawei chính hãng Nillkin dạng sần

', 7, CAST(100000 AS Decimal(18, 0)), N'Ốp lưng Huawei P40 Pro chính hãng Nillkin dạng sần. 
Chất liệu PC có khả năng đàn hồi tốt, không bị giòn và khả năng chống trầy xước tốt. 
Mặt sau ốp lưng được làm dạng sần với các ô ca rô nhỏ, thiết kế tiện lợi này giúp ốp lưng bám vào tay tốt hơn, tránh trơn trượt và không lưu lại dấu vân tay. 
Ốp lưng nillkin rất mỏng, chỉ khoảng 0.9mm, ôm khít thân máy, giữ nguyên thiết kế máy, các chi tiết camera, volume, loa…được làm chính xác thuận tiện nhất cho người sử dụng. 
Sản phẩm có nhiều màu và tặng kèm giá đỡ điện thoại tiện dụng.

', 50, N'Nillkin', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (83, N'Ốp lưng chống sốc Iron Man cho Huawei Mate 30 Pro', 7, CAST(100000 AS Decimal(18, 0)), N'Ốp lưng chống sốc Iron Man cho Huawei Mate 30 Pro. 
Chất liệu kết hợp giữa PC cứng cáp và TPU dẻo dai, giúp chống sốc và bảo vệ Huawei Mate 30 Pro một cách hoàn hảo nhất. 
Ý tưởng thiết kế dựa trên bộ áo giáp trong bộ phim nổi tiếng Iron Man. 
Cấu tạo với ốp lưng cứng bên ngoài và lớp viền mềm bên trong chống xây xước máy, không làm dầy như đại đa số các loại ốp lưng có 2 lớp khác; đi kèm chân chống ở giữa lưng hỗ trợ dựng ngang máy xem phim, nghe nhac, chơi game, lướt web,…. Sản phẩm có nhiều màu.

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (84, N'Ốp lưng silicon dẻo màu Huawei Y9s', 7, CAST(40000 AS Decimal(18, 0)), N'Ốp lưng silicon dẻo màu Huawei Y9s.
Thiết kế gọn nhẹ, làm từ chất liệu TPU, nhựa dẻo cao cấp bám chặt tay khi cầm, tao nhã kiểu dáng hợp thời trang. 
Các chi tiết nút nguồn, nút âm lượng được làm nổi chuẩn với các chi tiết của máy, giúp bạn dễ dàng thao tác. 
Phần bề mặt ốp lưng được làm mịn chống bám vân tay rất tốt. 

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (85, N'Ốp lưng silicon dẻo trong suốt Huawei Nova 7i', 7, CAST(40000 AS Decimal(18, 0)), N'Ốp lưng silicon dẻo trong suốt Huawei Nova 7i siêu mỏng 0.6 mm. 
Chất liệu TPU chỉ mỏng 0.6 mm, mềm dẻo, trong suốt, có độ đàn hồi cao, có thể bóp lại, cuộn lại mà không biến dạng. 
Sản phẩm được tráng lớp chống dính lưng nên không bị loang hay dính như chất liệu silicon thường. 
Đây là sản mẫu ốp dẻo, trong suốt, mỏng nhất dành cho Huawei Nova 7i.

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (86, N'Ốp lưng silicon màu Huawei Nova 6 SE siêu mỏng', 7, CAST(40000 AS Decimal(18, 0)), N'Ốp lưng silicon màu Huawei Nova 6 SE siêu mỏng không ố vàng, chống bám vân tay. 
Chất liệu TPU mịn, mềm, dẻo và rất mỏng, bảo vệ máy toàn diện khỏi trày xước, va đập. 
Phần camera của máy được bảo vệ khi đặt xuống bàn với thiết kế nhô lên của ốp lưng phía camera. 
Các phím bấm được làm nổi giúp thao tác dễ dàng. 

', 50, N'No Brand', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (87, N'Ốp lưng Huawei P30 Lite silicon giả da Auto Focus', 7, CAST(70000 AS Decimal(18, 0)), N'Ốp lưng silicon giả da, chống sốc Auto Focus cho Huawei P30 Lite. 
Chất liệu TPU dẻo, dày dặn, bảo vệ toàn bộ lưng và viền máy, chống va đập. Phía trong thiết kế có những gân tản nhiệt, giúp máy bớt nóng khi chơi game, xem phim, ... 
Phần lưng thiết kế vân da, rất giống da thật, cầm bám tay, không bám mồ hôi, vân tay, không mờ, không ố vàng trong quá trình sử dụng. 
Sản phẩm thiết kế vừa vặn với các chi tiết của máy, khi ốp vào Huawei P30 Lite rất tinh tế, sang trọng. Sản phẩm có nhiều màu.

', 50, N'Auto Focus', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (88, N'Ốp lưng 3 mảnh Plastic 360 cho Huawei Y9 2019', 7, CAST(80000 AS Decimal(18, 0)), N'Ốp lưng 3 mảnh Plastic 360 cho Huawei Y9 2019. Sản phẩm được làm bằng chất liệu Poly cao cấp, 2 đầu mạ kẽm sáng bóng, ôm khít, bo kín toàn bộ lưng và viền máy. 
Ốp Plastic không làm yếu sóng khi lắp vào máy, cầm rất êm tay và sang trọng. Sản phẩm có nhiều màu.

', 50, N'No Brand', 0, CAST(N'2021-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (89, N'Ốp lưng Huawei P30 chính hãng Nillkin dạng sần', 7, CAST(120000 AS Decimal(18, 0)), N'Ốp lưng Huawei P30 chính hãng Nillkin dạng sần. 
Chất liệu PC có khả năng đàn hồi tốt, không bị giòn và khả năng chống trầy xước tốt. Mặt sau ốp lưng được làm dạng sần với các ô ca rô nhỏ, thiết kế tiện lợi này giúp ốp lưng bám vào tay tốt hơn, tránh trơn trượt và không lưu lại dấu vân tay. 
Ốp lưng nillkin rất mỏng, chỉ khoảng 0.9mm, ôm khít thân máy, giữ nguyên thiết kế máy, các chi tiết camera, volume, loa…được làm chính xác thuận tiện nhất cho người sử dụng. 
Sản phẩm có nhiều màu và tặng kèm giá đỡ điện thoại tiện dụng.

', 50, N'Nillkin', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[product] ([idproduct], [name], [idphonebrand], [price], [desciption], [amount], [casebrand], [sold], [dateadded]) VALUES (90, N'Bao da dạng ví Huawei P30 Pro Luxury Leather', 7, CAST(150000 AS Decimal(18, 0)), N'Bao da dạng ví Huawei P30 Pro Luxury Leather. 
Bao da được làm từ chất liệu da cao cấp, bền chắc, rất khó bị trầy, bong tróc và khó bám bẩn. Mặt trước bao da có ngăn đựng tiền, và các ngăn phụ để card visit, thẻ ATM.... 
Mép viền được khâu tỉ mỉ chống bong tách, độ bền cao hơn. 
Phần ốp lưng làm bằng nhựa TPU mềm dẻo ôm khít viền máy. Thiết kế chắc chắn chống sốc khi va đập mà vẫn dễ dàng tháo lắp. 
Đặc điểm nổi bật nữa của sản phẩm là mặt trước bao da có nam châm hút vào màn hình rất gọn, không bị bung ra lỏng lẻo gây trầy xước màn hình khi để chung với các vật dụng khác, khi gập lại phía sau cũng có nam châm hút chắc chắn. 
Bao da thiết kế có thể dựng máy để xem phim, nghe nhạc, luớt web…Sản phẩm có nhiều màu.

', 50, N'Luxury Leather', 0, CAST(N'2021-05-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[product] OFF
GO
ALTER TABLE [dbo].[color]  WITH CHECK ADD  CONSTRAINT [FK_color_case] FOREIGN KEY([idproduct])
REFERENCES [dbo].[product] ([idproduct])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[color] CHECK CONSTRAINT [FK_color_case]
GO
ALTER TABLE [dbo].[device]  WITH CHECK ADD  CONSTRAINT [FK_device_Phone] FOREIGN KEY([idphone])
REFERENCES [dbo].[Phone] ([idphone])
GO
ALTER TABLE [dbo].[device] CHECK CONSTRAINT [FK_device_Phone]
GO
ALTER TABLE [dbo].[device]  WITH CHECK ADD  CONSTRAINT [FK_device_product] FOREIGN KEY([idproduct])
REFERENCES [dbo].[product] ([idproduct])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[device] CHECK CONSTRAINT [FK_device_product]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD  CONSTRAINT [FK_history_DeliveryStatus] FOREIGN KEY([IdStatusDelivery])
REFERENCES [dbo].[DeliveryStatus] ([idStatus])
GO
ALTER TABLE [dbo].[history] CHECK CONSTRAINT [FK_history_DeliveryStatus]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD  CONSTRAINT [FK_history_methodpayment] FOREIGN KEY([IdMethod])
REFERENCES [dbo].[methodpayment] ([IdMethod])
GO
ALTER TABLE [dbo].[history] CHECK CONSTRAINT [FK_history_methodpayment]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD  CONSTRAINT [FK_history_orders] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[orders] ([IdOrder])
GO
ALTER TABLE [dbo].[history] CHECK CONSTRAINT [FK_history_orders]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD  CONSTRAINT [FK_history_PaymentStatus] FOREIGN KEY([IdStatusPayment])
REFERENCES [dbo].[PaymentStatus] ([idStatus])
GO
ALTER TABLE [dbo].[history] CHECK CONSTRAINT [FK_history_PaymentStatus]
GO
ALTER TABLE [dbo].[image]  WITH CHECK ADD  CONSTRAINT [FK_image_case1] FOREIGN KEY([idproduct])
REFERENCES [dbo].[product] ([idproduct])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[image] CHECK CONSTRAINT [FK_image_case1]
GO
ALTER TABLE [dbo].[infoorder]  WITH CHECK ADD  CONSTRAINT [FK_infoorder_orders] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[orders] ([IdOrder])
GO
ALTER TABLE [dbo].[infoorder] CHECK CONSTRAINT [FK_infoorder_orders]
GO
ALTER TABLE [dbo].[infoorder]  WITH CHECK ADD  CONSTRAINT [FK_infoorder_Phone] FOREIGN KEY([Phone])
REFERENCES [dbo].[Phone] ([idphone])
GO
ALTER TABLE [dbo].[infoorder] CHECK CONSTRAINT [FK_infoorder_Phone]
GO
ALTER TABLE [dbo].[infoorder]  WITH CHECK ADD  CONSTRAINT [FK_infoorder_product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[product] ([idproduct])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[infoorder] CHECK CONSTRAINT [FK_infoorder_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_case_phonebrand] FOREIGN KEY([idphonebrand])
REFERENCES [dbo].[phonebrand] ([idphonebrand])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_case_phonebrand]
GO
