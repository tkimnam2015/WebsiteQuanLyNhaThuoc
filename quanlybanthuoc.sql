USE [QuanLyBanThuoc]
GO
/****** Object:  Table [dbo].[CTHD]    Script Date: 2/8/2022 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHD](
	[MaHD] [int] NOT NULL,
	[MaThuoc] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGiaBan] [decimal](10, 2) NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 2/8/2022 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [nchar](10) NULL,
	[MaNV] [nchar](10) NULL,
	[NgayLapHD] [datetime] NULL,
	[NgayGiaoHang] [datetime] NULL,
 CONSTRAINT [PK_Hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 2/8/2022 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nchar](10) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[DienThoai] [nchar](10) NULL,
	[Fax] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiThuoc]    Script Date: 2/8/2022 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThuoc](
	[MaLoaiThuoc] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiThuoc] [nvarchar](200) NULL,
 CONSTRAINT [PK_LoaiThuoc] PRIMARY KEY CLUSTERED 
(
	[MaLoaiThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 2/8/2022 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nchar](10) NOT NULL,
	[HoNV] [nvarchar](50) NULL,
	[Ten] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[DienThoai] [char](10) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thuoc]    Script Date: 2/8/2022 8:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thuoc](
	[MaThuoc] [int] IDENTITY(1,1) NOT NULL,
	[TenThuoc] [nvarchar](200) NULL,
	[DonViTinh] [nvarchar](50) NULL,
	[DonGia] [decimal](10, 2) NULL,
	[MaLoaiThuoc] [int] NULL,
	[HinhThuoc] [nvarchar](max) NULL,
 CONSTRAINT [PK_Thuoc] PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH01      ', N'Anh Hang', N'120 Ha Ton Quyen', N'8171717   ', N'084088171717', N'hang@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH02      ', N'Bong Hong', N'24 Ky Con', N'          ', N'084088800256', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH03      ', N'Em Anh', N'6 Ky Hoa', N'          ', N'084088852258', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH04      ', N'Ho Han', N'8 Pham van Khoe', N'8430156   ', N'084088430156', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH05      ', N'Koko Company', N'90 An Duong Vuong', N'8250102   ', N'', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH06      ', N'Queen Cozinha', N'891 An Duong Vuong', N'          ', N'', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH07      ', N'Quoc Cuong', N'10 Tan Da', N'8950203   ', N'', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH08      ', N'Suoi Tra', N'2817 Minh Phung', N'8356210   ', N'084088356210', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH09      ', N'Song Trang', N'187 Lao Tu', N'9450210   ', N'', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH10      ', N'Vinh Vien', N'45 Su Van hanh', N'          ', N'084088654790', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH11      ', N'TRần Vĩnh Viễn', N'87 Trần Hưng Đạo', N'8855464   ', N'', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH12      ', N'Lý Văn Trung', N'123 Tân Tẩn', N'          ', N'', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH13      ', N'Cty Minh Hằng', N'456 Công Hòa', N'          ', N'', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH14      ', N'Cty Nghĩa Đường', N'12 Lý chính Thắng', N'9874564   ', N'', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH15      ', N'Minh Anh', N'15/1 Hậu Giang', N'6548797   ', N'', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH16      ', N'Trần Tùng', N'12/15 Hậu Nghĩa', N'6547898   ', N'', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH17      ', N'Cty Vĩnh Lợi', N'1812 TRần Quang Khải', N'          ', N'', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH18      ', N'Cty Thái Bình Dương', N'145 Nguyễn Huệ', N'6548797   ', N'', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH19      ', N'Cty Thần Tài', N'14 Lê Lợi', N'6523154   ', N'', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH20      ', N'Cty Trần Văn Thời', N'45 Nguyễn Thị Minh Khai', N'4561234   ', N'', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH21      ', N'Công ty Thành Lợi', N'Q1 TP.HCM', N'0913123   ', N'0913123456', N'hung@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH22      ', N'Trần Hùng', N'Công ty TNHH Thành Lợi', N'0913123   ', N'0913123456', N'hung@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [DienThoai], [Fax], [Email]) VALUES (N'KH23      ', N'aaa', N'aaa', N'0913123   ', N'0913123456', N'hung@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[LoaiThuoc] ON 

INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (1, N'Gây mê')
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (2, N'Trị đau nhức')
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (3, N'Chống dị ứng và phản vệ')
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (4, N'Chống giải độc và các chất độc khác')
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (5, N'Chống co giật')
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (6, N'Chống bênh truyền nhiễm')
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (7, N'Tim mạch')
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (8, N'Da liễu')
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (9, N'Sát trùng')
INSERT [dbo].[LoaiThuoc] ([MaLoaiThuoc], [TenLoaiThuoc]) VALUES (10, N'Dạ dày')
SET IDENTITY_INSERT [dbo].[LoaiThuoc] OFF
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'1         ', N'Lê văn', N'Tâm', N'45 Trần Phú', N'8663447   ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'10        ', N'Lê Thế', N'Bảo', N'12 Lê Quý Đôn', N'          ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'11        ', N'Lê Dũng', N'Nguyễn', N'321 Lê Lợi', N'6987456   ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'12        ', N'Nguyễn Thị', N'Thủy', N'654 Nguyễn Huệ', N'9998745   ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'13        ', N'Nguyễn Thu', N'Hồng', N'987 Lê Lợi', N'9874561   ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'14        ', N'Trần Thị Thủy', N'Tiên', N'6543 Nguyễn Huệ', N'          ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'15        ', N'Lê Thị', N'Hiền', N'654 Mai Xuân Thời', N'          ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'16        ', N'Trần Văn', N'Thanh', N'Tân Bình', N'123456    ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'17        ', N'Trần Văn', N'Thành', N'Tân Bình', N'12345     ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'2         ', N'Trần thị', N'An', N'15 Nguyễn Trãi', N'          ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'3         ', N'Tạ Thành', N'Tâm', N'20 Võ thị Sáu', N'8565666   ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'4         ', N'Ngô Thành', N'Sơn', N'122 Trần Phú', N'          ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'5         ', N'Lê thị', N'Thuỷ', N'25 Ngô Quyền', N'9767677   ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'6         ', N'Nguyễn Hữu', N'An', N'12 Lê Thánh Tôn', N'          ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'7         ', N'Thái Chí', N'An', N'97 Võ văn Tần', N'          ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'8         ', N'Trần Văn', N'Thanh', N'25 Trần Văn Đang', N'0918158   ')
INSERT [dbo].[NhanVien] ([MaNV], [HoNV], [Ten], [DiaChi], [DienThoai]) VALUES (N'9         ', N'Nguyễn Dũng', N'Nghi', N'65 Trần Văn Thời', N'          ')
GO
SET IDENTITY_INSERT [dbo].[Thuoc] ON 

INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (1, N'Halothane', N'Chai', CAST(20000.00 AS Decimal(10, 2)), 1, N'Images/Halothane.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (2, N'Isoflurane', N'Chai', CAST(30000.00 AS Decimal(10, 2)), 1, N'Images/Isoflurane.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (3, N'Bupivacaine', N'Chai', CAST(25000.00 AS Decimal(10, 2)), 1, N'Images/Bupivacaine.png')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (4, N'Lidocaine', N'Hộp', CAST(100000.00 AS Decimal(10, 2)), 1, N'Images/Lidocaine.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (5, N'Atropine', N'Chai', CAST(30000.00 AS Decimal(10, 2)), 1, N'Images/Atropine.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (6, N'Midazolam', N'Hộp', CAST(50000.00 AS Decimal(10, 2)), 1, N'Images/Midazolam.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (7, N'Morphine', N'Chai', CAST(45000.00 AS Decimal(10, 2)), 1, N'Images/Morphine.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (8, N'Ibuprofen', N'Hộp', CAST(35000.00 AS Decimal(10, 2)), 2, N'Images/Ibuprofen.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (9, N'Acetylsalicylic acid (aspirin)', N'Hộp', CAST(65000.00 AS Decimal(10, 2)), 2, N'Images/Acetylsalicylic acid (aspirin).jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (10, N'Amitriptyline', N'Hộp', CAST(40000.00 AS Decimal(10, 2)), 2, N'Images/Amitriptyline.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (11, N'Cyclizine', N'Hộp', CAST(38000.00 AS Decimal(10, 2)), 2, N'Images/Cyclizine.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (12, N'Dexamethasone', N'Hộp', CAST(55000.00 AS Decimal(10, 2)), 2, N'Images/Dexamethasone.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (13, N'Diazepam', N'Hộp', CAST(48000.00 AS Decimal(10, 2)), 2, N'Images/Diazepam.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (14, N'Fluoxetine', N'Hộp', CAST(32000.00 AS Decimal(10, 2)), 2, N'Images/Fluoxetine.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (15, N'Haloperidol', N'Hộp', CAST(42000.00 AS Decimal(10, 2)), 2, N'Images/Haloperidol.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (16, N'Epinephrine (adrenaline)', N'Chai', CAST(20000.00 AS Decimal(10, 2)), 3, N'Images/Epinephrine (adrenaline).jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (17, N'Hydrocortisone', N'Chai', CAST(45000.00 AS Decimal(10, 2)), 3, N'Images/Hydrocortisone.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (18, N'Prednisolone', N'Chai', CAST(30000.00 AS Decimal(10, 2)), 3, N'Images/Prednisolone.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (19, N'Loratadin', N'Hộp', CAST(45000.00 AS Decimal(10, 2)), 3, N'Images/Loratadin.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (20, N'Acetylcysteine', N'Hộp', CAST(30000.00 AS Decimal(10, 2)), 4, N'Images/Acetylcysteine.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (21, N'Calcium gluconate', N'Chai', CAST(46000.00 AS Decimal(10, 2)), 4, N'Images/Calcium gluconate.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (22, N'Naloxone', N'Hộp', CAST(50000.00 AS Decimal(10, 2)), 4, N'Images/Naloxone.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (23, N'Penicillamine', N'Hộp', CAST(24000.00 AS Decimal(10, 2)), 4, N'Images/Penicillamine.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (24, N'Natri nitrite', N'Chai', CAST(50000.00 AS Decimal(10, 2)), 4, N'Images/Natri nitrite.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (25, N'Deferoxamine', N'Chai', CAST(38000.00 AS Decimal(10, 2)), 4, N'Images/Deferoxamine.jpg')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (26, N'Dimercaprol', N'Hộp', CAST(70000.00 AS Decimal(10, 2)), 4, N'Images/Dimercaprol.png')
INSERT [dbo].[Thuoc] ([MaThuoc], [TenThuoc], [DonViTinh], [DonGia], [MaLoaiThuoc], [HinhThuoc]) VALUES (27, N'Fomepizole', N'Hộp', CAST(50000.00 AS Decimal(10, 2)), 4, N'Images/Fomepizole.jpg')
SET IDENTITY_INSERT [dbo].[Thuoc] OFF
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_Hoadon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_Hoadon]
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_Thuoc] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[Thuoc] ([MaThuoc])
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_Thuoc]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_Hoadon_Khachhang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_Hoadon_Khachhang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_Hoadon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_Hoadon_NhanVien]
GO
ALTER TABLE [dbo].[Thuoc]  WITH CHECK ADD  CONSTRAINT [FK_Thuoc_LoaiThuoc1] FOREIGN KEY([MaLoaiThuoc])
REFERENCES [dbo].[LoaiThuoc] ([MaLoaiThuoc])
GO
ALTER TABLE [dbo].[Thuoc] CHECK CONSTRAINT [FK_Thuoc_LoaiThuoc1]
GO
