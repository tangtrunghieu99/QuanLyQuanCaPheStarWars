USE [master]
GO
/****** Object:  Database [QLCoffee]    Script Date: 12/10/2019 9:25:45 AM ******/
CREATE DATABASE [QLCoffee]
GO
ALTER DATABASE [QLCoffee] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLCoffee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLCoffee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLCoffee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLCoffee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLCoffee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLCoffee] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLCoffee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLCoffee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLCoffee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLCoffee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLCoffee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLCoffee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLCoffee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLCoffee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLCoffee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLCoffee] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLCoffee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLCoffee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLCoffee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLCoffee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLCoffee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLCoffee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLCoffee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLCoffee] SET RECOVERY FULL 
GO
ALTER DATABASE [QLCoffee] SET  MULTI_USER 
GO
ALTER DATABASE [QLCoffee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLCoffee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLCoffee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLCoffee] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLCoffee] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLCoffee', N'ON'
GO
USE [QLCoffee]
GO
/****** Object:  Table [dbo].[ChiNhanh]    Script Date: 12/10/2019 9:25:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiNhanh](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[UrlTitle] [varchar](250) NULL,
	[Description] [nvarchar](1000) NULL,
	[Image] [varchar](250) NULL,
	[Address] [nvarchar](500) NULL,
 CONSTRAINT [PK_ChiNhanh] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 12/10/2019 9:25:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Topic] [nvarchar](50) NULL,
	[ContentContact] [ntext] NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/10/2019 9:25:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](250) NULL,
	[NgaySinh] [datetime] NULL,
	[DienThoai] [varchar](15) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[TenDN] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Image] [varchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DatHang]    Script Date: 12/10/2019 9:25:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL,
	[CustomerID] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[State] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Other] [nvarchar](250) NULL,
	[Town] [nvarchar](100) NULL,
	[Passcode] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[TotalPrice] [decimal](18, 0) NULL,
	[Papyment] [nvarchar](150) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_DatHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 12/10/2019 9:25:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDCustomer] [int] NULL,
	[Name] [nvarchar](150) NULL,
	[ContentFeedback] [nvarchar](250) NULL,
	[Image] [varchar](250) NULL,
	[Type] [nvarchar](50) NULL,
	[Browser] [bit] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiThucDon]    Script Date: 12/10/2019 9:25:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThucDon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiThucDon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiThucUong]    Script Date: 12/10/2019 9:25:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiThucUong](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[UrlTitle] [varchar](250) NULL,
	[SeoTitle] [varchar](250) NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_LoaiThucUong] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/10/2019 9:25:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Dissplayname] [nvarchar](100) NULL,
	[Password] [varchar](50) NOT NULL,
	[Gender] [nvarchar](10) NULL,
	[Phone] [varchar](15) NULL,
	[Address] [nvarchar](500) NULL,
	[Ngaysinh] [datetime] NULL,
	[Image] [varchar](250) NULL,
	[TypeAccount] [varchar](10) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThongTinDatHang]    Script Date: 12/10/2019 9:25:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinDatHang](
	[OrderID] [int] NOT NULL,
	[FoodID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ThongTinDatHang] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThucDon]    Script Date: 12/10/2019 9:25:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThucDon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](250) NULL,
	[Link] [varchar](250) NULL,
	[Target] [varchar](50) NOT NULL,
	[TypeID] [int] NULL,
	[Status] [bit] NULL,
	[Submenu] [int] NULL,
	[Multilevel] [bit] NULL,
 CONSTRAINT [PK_ThucDon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThucUong]    Script Date: 12/10/2019 9:25:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThucUong](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[UrlTitle] [varchar](250) NULL,
	[IDCaterogy] [int] NULL,
	[Code] [varchar](50) NULL,
	[Description] [nvarchar](1000) NULL,
	[Image] [varchar](250) NULL,
	[MoreImage] [xml] NULL,
	[Price] [decimal](18, 0) NULL,
	[Quality] [int] NULL,
	[Detail] [ntext] NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_ThucUong] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ChiNhanh] ON 

INSERT [dbo].[ChiNhanh] ([ID], [Name], [UrlTitle], [Description], [Image], [Address]) VALUES (4, N'StarWars New World', NULL, NULL, N'/Images/files/2ca_phe_16_zing.jpg', N'76 Lê Lai , Quận 1 , TPHCM')
INSERT [dbo].[ChiNhanh] ([ID], [Name], [UrlTitle], [Description], [Image], [Address]) VALUES (5, N'StarWars President Place', NULL, NULL, N'/Images/files/30.jpg', N'93 Nguyễn Du, Quận 1, TP.HCM')
INSERT [dbo].[ChiNhanh] ([ID], [Name], [UrlTitle], [Description], [Image], [Address]) VALUES (6, N'Starwars Rex', NULL, NULL, N'/Images/files/DSCN30042-outside-of-Starbucks-in-Pandora-City.jpg', N'141 Nguyễn Huệ, Quận 1, TP.HCM')
INSERT [dbo].[ChiNhanh] ([ID], [Name], [UrlTitle], [Description], [Image], [Address]) VALUES (7, N'Starwars  Đông Du', NULL, NULL, N'/Images/files/st_1.jpg', N' 38 Đông Du, Phường Bến Nghé, Quận 1, TP.HCM')
INSERT [dbo].[ChiNhanh] ([ID], [Name], [UrlTitle], [Description], [Image], [Address]) VALUES (8, N'Starwars Đề Thám', NULL, NULL, N'/Images/files/star2.jpg', N'191-193 Đề Thám, Phường Phạm Ngũ Lão, Quận 1, TP.HCM')
INSERT [dbo].[ChiNhanh] ([ID], [Name], [UrlTitle], [Description], [Image], [Address]) VALUES (9, N'StarWars Phan Xích Long', NULL, NULL, N'/Images/files/starbucks-coffee-phan-xich-long-19.jpg', N'214-216 Phan Xích Long, Phường 2, Phú Nhuận, TP.HCM')
INSERT [dbo].[ChiNhanh] ([ID], [Name], [UrlTitle], [Description], [Image], [Address]) VALUES (10, N'Starwars Panorama', NULL, NULL, N'/Images/files/starbucks-vietnam.jpg', N'208 Trần Văn Trà, Quận 7, TP.HCM')
SET IDENTITY_INSERT [dbo].[ChiNhanh] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([ID], [Ten], [NgaySinh], [DienThoai], [DiaChi], [GioiTinh], [TenDN], [MatKhau], [Email], [Image]) VALUES (1, N'Bảo Bờm', CAST(N'1999-04-18 00:00:00.000' AS DateTime), N'0921156883', N'Phú Giáo', N'Nam', N'baobom123', N'R9K1hUpnN8U=', N'baobom12@gmail.com', NULL)
INSERT [dbo].[Customer] ([ID], [Ten], [NgaySinh], [DienThoai], [DiaChi], [GioiTinh], [TenDN], [MatKhau], [Email], [Image]) VALUES (2, N'hoaibom', CAST(N'1999-03-06 00:00:00.000' AS DateTime), N'0921156447', N'Bạc Liêu', N'Nam', N'hoaibom123', N'R9K1hUpnN8U=', N'hoaibom@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[DatHang] ON 

INSERT [dbo].[DatHang] ([ID], [CreateDate], [CustomerID], [FirstName], [LastName], [Phone], [State], [Address], [Other], [Town], [Passcode], [Email], [TotalPrice], [Papyment], [Status]) VALUES (1, CAST(N'2019-11-28 16:05:14.363' AS DateTime), 1, NULL, N'Đông ', N'12435465689', NULL, N'123 Trần Hưng Đạo', NULL, NULL, NULL, NULL, NULL, N'Thanh toán khi nhận hàng', NULL)
INSERT [dbo].[DatHang] ([ID], [CreateDate], [CustomerID], [FirstName], [LastName], [Phone], [State], [Address], [Other], [Town], [Passcode], [Email], [TotalPrice], [Papyment], [Status]) VALUES (2, CAST(N'2019-11-28 16:07:58.370' AS DateTime), 1, NULL, N'Đông ', N'12435465689', NULL, N'123 Trần Hưng Đạo', NULL, NULL, NULL, NULL, NULL, N'Thanh toán khi nhận hàng', NULL)
INSERT [dbo].[DatHang] ([ID], [CreateDate], [CustomerID], [FirstName], [LastName], [Phone], [State], [Address], [Other], [Town], [Passcode], [Email], [TotalPrice], [Papyment], [Status]) VALUES (3, CAST(N'2019-11-28 16:15:06.863' AS DateTime), 1, NULL, N'Đông ', N'12435465689', NULL, N'123 Trần Hưng Đạo', NULL, NULL, NULL, NULL, NULL, N'Thanh toán khi nhận hàng', NULL)
INSERT [dbo].[DatHang] ([ID], [CreateDate], [CustomerID], [FirstName], [LastName], [Phone], [State], [Address], [Other], [Town], [Passcode], [Email], [TotalPrice], [Papyment], [Status]) VALUES (4, CAST(N'2019-11-30 08:09:37.320' AS DateTime), 1, NULL, N'Bảo', N'12435465688', NULL, N'Phú Giáo', NULL, NULL, NULL, NULL, NULL, N'Thanh toán khi nhận hàng', NULL)
SET IDENTITY_INSERT [dbo].[DatHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiThucDon] ON 

INSERT [dbo].[LoaiThucDon] ([ID], [Name]) VALUES (1, N'Chinh')
INSERT [dbo].[LoaiThucDon] ([ID], [Name]) VALUES (2, N'Phu')
SET IDENTITY_INSERT [dbo].[LoaiThucDon] OFF
SET IDENTITY_INSERT [dbo].[LoaiThucUong] ON 

INSERT [dbo].[LoaiThucUong] ([ID], [Name], [UrlTitle], [SeoTitle], [ShowOnHome]) VALUES (1, N'Bánh', N'/banh', NULL, NULL)
INSERT [dbo].[LoaiThucUong] ([ID], [Name], [UrlTitle], [SeoTitle], [ShowOnHome]) VALUES (2, N'Cà Phê ', N'/ca-phe', NULL, NULL)
INSERT [dbo].[LoaiThucUong] ([ID], [Name], [UrlTitle], [SeoTitle], [ShowOnHome]) VALUES (3, N'Trà', N'/tra', NULL, NULL)
INSERT [dbo].[LoaiThucUong] ([ID], [Name], [UrlTitle], [SeoTitle], [ShowOnHome]) VALUES (4, N'Đá xay', N'/da-xay', NULL, NULL)
SET IDENTITY_INSERT [dbo].[LoaiThucUong] OFF
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([ID], [Username], [Dissplayname], [Password], [Gender], [Phone], [Address], [Ngaysinh], [Image], [TypeAccount]) VALUES (1, N'trunghieu2108', N'Trung Hiếu', N'R9K1hUpnN8U=', N'Nam', N'0921156997', N'Dĩ An', CAST(N'1999-08-21 00:00:00.000' AS DateTime), NULL, N'1')
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
INSERT [dbo].[ThongTinDatHang] ([OrderID], [FoodID], [Quantity], [Price]) VALUES (1, 9, 1, CAST(40000 AS Decimal(18, 0)))
INSERT [dbo].[ThongTinDatHang] ([OrderID], [FoodID], [Quantity], [Price]) VALUES (2, 12, 1, CAST(60000 AS Decimal(18, 0)))
INSERT [dbo].[ThongTinDatHang] ([OrderID], [FoodID], [Quantity], [Price]) VALUES (3, 27, 1, CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[ThongTinDatHang] ([OrderID], [FoodID], [Quantity], [Price]) VALUES (4, 11, 1, CAST(50000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ThucDon] ON 

INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (1, N'THỰC ĐƠN', N'/THUC-DON', N'_self', 1, 1, NULL, 0)
INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (2, N'Bánh', N'/banh', N'_self', 2, 1, 1, 0)
INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (3, N'Cà phê', N'/ca-phe', N'_self', 2, 1, 1, 0)
INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (4, N'Đá xay', N'/da-xay', N'_self', 2, 1, 1, 0)
INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (5, N'Trà', N'/tra', N'_self', 2, 1, 1, 0)
INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (6, N'QUÁN CÀ PHÊ', N'/QUAN-CA-PHE', N'_self', 1, 1, NULL, 0)
INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (7, N'Chi Nhánh', N'/chi-nhanh', N'_self', 2, 1, 6, 0)
INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (8, N'Nhân Viên', N'/nhan-vien', N'_self', 2, 1, 6, 0)
INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (9, N'VỀ CHÚNG TÔI', N'/VE-CHUNG-TOI', N'_self', 1, 1, NULL, 0)
INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (10, N'Di Sản', N'/di-san', N'_self', 2, 1, 9, 0)
INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (11, N'Cơ hội nghề nghiệp', N'/co-hoi-nghe-nghiep', N'_self', 2, 1, 9, 0)
INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (12, N'THẺ', N'/THE', N'_self', 1, 1, NULL, 1)
INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (16, N'Đăng nhập', N'/dang-nhap', N'_self', 2, 1, 12, 0)
INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (17, N'Đăng ký', N'/dang-ky', N'_self', 2, 1, 12, 0)
INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (18, N'Tên KH', N'/', N'_self', 1, 1, NULL, 1)
INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (19, N'Đăng xuất ', N'/dang-xuat', N'_self', 2, 1, 18, 0)
INSERT [dbo].[ThucDon] ([ID], [Text], [Link], [Target], [TypeID], [Status], [Submenu], [Multilevel]) VALUES (20, N'TRANG CHỦ', N'/trang-chu', N'_target', NULL, 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[ThucDon] OFF
SET IDENTITY_INSERT [dbo].[ThucUong] ON 

INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (1, N'Hazelnut Machiatto', N'/hazelnut-machiatto', 2, NULL, NULL, N'/Images/files/hazelnut-macchiato_tcm90-24778_w1024_n.jpg', NULL, CAST(90000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (2, N'Ristretto', N'/ristretto', 2, NULL, NULL, N'/Images/files/ristretto-bianco_tcm90-24779_w1024_n.jpg', NULL, CAST(80000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (3, N'Americano', N'/americano', 2, NULL, NULL, N'/Images/files/Caffe-Americano_tcm90-2059_w1024_n.jpg', NULL, CAST(70000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (4, N'Coffee with Milk', N'/coffee-with-milk', 2, NULL, NULL, N'/Images/files/caffee-latte_tcm90-2062_w1024_n.jpg', NULL, CAST(70000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (5, N'Mocha', N'/mocha', 2, NULL, NULL, N'/Images/files/caffee-mocha_tcm90-24781_w1024_n.jpg', NULL, CAST(80000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (6, N'Cappucino', N'/cappucino', 2, NULL, NULL, N'/Images/files/Cappuccino_tcm90-2066_w1024_n.jpg', NULL, CAST(90000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (7, N'Caramel Machiatto', N'/caramel-machiatto', 2, NULL, NULL, N'/Images/files/caramel-macchiato-thumb_tcm90-11384_w1024_n.jpg', NULL, CAST(80000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (8, N'Espresso', N'/espresso', 2, NULL, NULL, N'/Images/files/Espresso_tcm90-2090_w1024_n.jpg', NULL, CAST(70000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (9, N'Bánh nhân thịt', N'/banh-nhan-thit', 1, NULL, NULL, N'/Images/files/Pate-Chaud_tcm90-24785_w1024_n.jpg', NULL, CAST(40000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (10, N'Croitssan Hạnh nhân', N'/croitssan-hanh-nhan', 1, NULL, NULL, N'/Images/files/Almond-Croissant_tcm90-24786_w1024_n.jpg', NULL, CAST(70000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (11, N'Bánh cuốn nho', N'/banh-cuon-nho', 1, NULL, NULL, N'/Images/files/Raisin-Rolls_tcm90-24787_w1024_n.jpg', NULL, CAST(50000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (12, N'Bánh Đào Danish', N'/banh-dao-danish', 1, NULL, NULL, N'/Images/files/Apricot-Danish_tcm90-24788_w1024_n.jpg', NULL, CAST(60000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (13, N'Bánh Dứa Danish', N'/banh-dua-danish', 1, NULL, NULL, N'/Images/files/Pineapple-Danish_tcm90-24789_w1024_n.jpg', NULL, CAST(60000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (14, N'Croitssan Bơ', N'/croitssan-bo', 1, NULL, NULL, N'/Images/files/Butter-Croissant_tcm90-24790_w1024_n.jpg', NULL, CAST(45000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (15, N'Croitssan Chocolate', N'/croitssan-chocolate', 1, NULL, NULL, N'/Images/files/Chocolate-Croissant_tcm90-24791_w1024_n.jpg', NULL, CAST(80000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (16, N'Quiche Nấm', N'/quiche-nam', 1, NULL, NULL, N'/Images/files/Quiche-Bacon-Onion_tcm90-24792_w1024_n.jpg', NULL, CAST(70000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (17, N'Trà Chai', N'/tra-chai', 3, NULL, NULL, N'/Images/files/Asset-Chai-Tea_tcm90-1367_w1024_n.jpg', NULL, CAST(80000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (18, N'Trà Sữa Chai', N'/tra-sua-chai', 3, NULL, NULL, N'/Images/files/Asset-Chai-Tea-Latte_tcm90-1369_w1024_n.jpg', NULL, CAST(90000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (19, N'Trà Hoa Cúc ', N'/tra-hoa-cuc', 3, NULL, NULL, N'/Images/files/tea-chamomile-blend-asset_tcm90-11104_w1024_n.jpg', NULL, CAST(70000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (20, N'English Tea', N'/english-tea', 3, NULL, NULL, N'/Images/files/english_breakfast_tcm90-9942_w1024_n.jpg', NULL, CAST(80000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (21, N'Trà Bạc Hà ', N'/tra-bac-ha', 3, NULL, NULL, N'/Images/files/tea-mint-blend-asset_tcm90-11102_w1024_n.jpg', NULL, CAST(70000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (23, N'Trà EarlGrey', N'/tra-earlgrey', 3, NULL, NULL, N'/Images/files/drinks-earl-gray-brewed-tea-menu-asset_tcm90-9939_w1024_n.jpg', NULL, CAST(60000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (24, N'Black Shaken Tea', N'/black-shaken-tea', 3, NULL, NULL, N'/Images/files/iced-tea-black-menu-asset_tcm90-9906_w1024_n.jpg', NULL, CAST(50000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (25, N'Caramel Frappucino', N'/caramel-frappucino', 4, NULL, NULL, N'/Images/files/Caramel-Frappuccino-Blended-Beverage-Thumb_tcm90-22140_w1024_n.jpg', NULL, CAST(80000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (26, N'Light Blended', N'/light-blended', 4, NULL, NULL, N'/Images/files/Caramel-Frappuccino-Light-Blended-Beverage-Thumb_tcm90-22141_w1024_n.jpg', NULL, CAST(100000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (27, N'Creme Frappucino', N'/creme-frappucino', 4, NULL, NULL, N'/Images/files/Chocolate-Creme-Frappuccino-blended-beverage_tcm90-22382_w1024_n.jpg', NULL, CAST(90000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (28, N'Mocha Frappucino', N'/mocha-frappucino', 4, NULL, NULL, N'/Images/files/drinks-mocha-frappuccino_tcm90-10995_w1024_n.jpg', NULL, CAST(70000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (29, N'Java Chip', N'/java-chip', 4, NULL, NULL, N'/Images/files/Java-Chip-Frappuccino-Blended-Coffee_tcm90-3771_w1024_n.jpg', NULL, CAST(80000 AS Decimal(18, 0)), NULL, NULL, NULL)
INSERT [dbo].[ThucUong] ([ID], [Name], [UrlTitle], [IDCaterogy], [Code], [Description], [Image], [MoreImage], [Price], [Quality], [Detail], [ViewCount]) VALUES (30, N' Vanilla Cream', N'/vanilla-cream', 4, NULL, NULL, N'/Images/files/Vanilla-Bean-Creme-Frappuccino-Blended-Creme_tcm90-3791_w1024_n.jpg', NULL, CAST(70000 AS Decimal(18, 0)), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ThucUong] OFF
/****** Object:  Index [IX_ThongTinDatHang]    Script Date: 12/10/2019 9:25:46 AM ******/
CREATE NONCLUSTERED INDEX [IX_ThongTinDatHang] ON [dbo].[ThongTinDatHang]
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DatHang]  WITH CHECK ADD  CONSTRAINT [FK_DatHang_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[DatHang] CHECK CONSTRAINT [FK_DatHang_Customer]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Customer] FOREIGN KEY([IDCustomer])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Customer]
GO
ALTER TABLE [dbo].[ThongTinDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinDatHang_DatHang] FOREIGN KEY([OrderID])
REFERENCES [dbo].[DatHang] ([ID])
GO
ALTER TABLE [dbo].[ThongTinDatHang] CHECK CONSTRAINT [FK_ThongTinDatHang_DatHang]
GO
ALTER TABLE [dbo].[ThongTinDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinDatHang_ThucUong] FOREIGN KEY([FoodID])
REFERENCES [dbo].[ThucUong] ([ID])
GO
ALTER TABLE [dbo].[ThongTinDatHang] CHECK CONSTRAINT [FK_ThongTinDatHang_ThucUong]
GO
ALTER TABLE [dbo].[ThucDon]  WITH CHECK ADD  CONSTRAINT [FK_ThucDon_LoaiThucDon] FOREIGN KEY([TypeID])
REFERENCES [dbo].[LoaiThucDon] ([ID])
GO
ALTER TABLE [dbo].[ThucDon] CHECK CONSTRAINT [FK_ThucDon_LoaiThucDon]
GO
ALTER TABLE [dbo].[ThucUong]  WITH CHECK ADD  CONSTRAINT [FK_ThucUong_LoaiThucUong] FOREIGN KEY([IDCaterogy])
REFERENCES [dbo].[LoaiThucUong] ([ID])
GO
ALTER TABLE [dbo].[ThucUong] CHECK CONSTRAINT [FK_ThucUong_LoaiThucUong]
GO
USE [master]
GO
ALTER DATABASE [QLCoffee] SET  READ_WRITE 
GO
