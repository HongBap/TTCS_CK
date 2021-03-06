USE [master]
GO
/****** Object:  Database [ChungKhoan]    Script Date: 16/04/2022 11:04:24 CH ******/
CREATE DATABASE [ChungKhoan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChungKhoan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ChungKhoan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChungKhoan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ChungKhoan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ChungKhoan] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChungKhoan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChungKhoan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChungKhoan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChungKhoan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChungKhoan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChungKhoan] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChungKhoan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChungKhoan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChungKhoan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChungKhoan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChungKhoan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChungKhoan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChungKhoan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChungKhoan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChungKhoan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChungKhoan] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ChungKhoan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChungKhoan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChungKhoan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChungKhoan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChungKhoan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChungKhoan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChungKhoan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChungKhoan] SET RECOVERY FULL 
GO
ALTER DATABASE [ChungKhoan] SET  MULTI_USER 
GO
ALTER DATABASE [ChungKhoan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChungKhoan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChungKhoan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChungKhoan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChungKhoan] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ChungKhoan', N'ON'
GO
ALTER DATABASE [ChungKhoan] SET QUERY_STORE = OFF
GO
USE [ChungKhoan]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ChungKhoan]
GO
/****** Object:  Table [dbo].[BangGiaTrucTuyen]    Script Date: 16/04/2022 11:04:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangGiaTrucTuyen](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaCK] [nvarchar](7) NULL,
	[GiaMua1] [float] NULL,
	[SoLuongMua1] [int] NULL,
	[GiaMua2] [float] NULL,
	[SoLuongMua2] [int] NULL,
	[GiaMua3] [float] NULL,
	[SoLuongMua3] [int] NULL,
	[GiaKhop] [float] NULL,
	[SoLuongKhop] [int] NULL,
	[GiaBan1] [float] NULL,
	[SoLuongBan1] [int] NULL,
	[GiaBan2] [float] NULL,
	[SoLuongBan2] [int] NULL,
	[GiaBan3] [float] NULL,
	[SoLuongBan3] [int] NULL,
	[Tongso] [int] NULL,
 CONSTRAINT [PK__BangGiaT__3214EC27A6F9BC1C] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LenhDat]    Script Date: 16/04/2022 11:04:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LenhDat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaCoPhieu] [nvarchar](7) NULL,
	[NgayDat] [datetime] NULL,
	[LoaiGiaoDich] [nvarchar](1) NULL,
	[LoaiLenh] [nchar](10) NULL,
	[SoLuong] [int] NULL,
	[GiaDat] [float] NULL,
	[TrangThai] [nvarchar](255) NULL,
 CONSTRAINT [PK__LenhDat__3213E83F23B1A6AB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LenhKhop]    Script Date: 16/04/2022 11:04:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LenhKhop](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[NgayKhop] [datetime] NULL,
	[SoLuongKhop] [int] NULL,
	[GiaKhop] [float] NULL,
	[idLenhDat] [int] NULL,
 CONSTRAINT [PK__LenhKhop__3213E83F6DA7EF47] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BangGiaTrucTuyen] ON 

INSERT [dbo].[BangGiaTrucTuyen] ([ID], [MaCK], [GiaMua1], [SoLuongMua1], [GiaMua2], [SoLuongMua2], [GiaMua3], [SoLuongMua3], [GiaKhop], [SoLuongKhop], [GiaBan1], [SoLuongBan1], [GiaBan2], [SoLuongBan2], [GiaBan3], [SoLuongBan3], [Tongso]) VALUES (1, N'IOH', NULL, 2000, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3000, NULL, NULL, 0)
INSERT [dbo].[BangGiaTrucTuyen] ([ID], [MaCK], [GiaMua1], [SoLuongMua1], [GiaMua2], [SoLuongMua2], [GiaMua3], [SoLuongMua3], [GiaKhop], [SoLuongKhop], [GiaBan1], [SoLuongBan1], [GiaBan2], [SoLuongBan2], [GiaBan3], [SoLuongBan3], [Tongso]) VALUES (2, N'RTG', 2000, 3000, 1000, 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[BangGiaTrucTuyen] ([ID], [MaCK], [GiaMua1], [SoLuongMua1], [GiaMua2], [SoLuongMua2], [GiaMua3], [SoLuongMua3], [GiaKhop], [SoLuongKhop], [GiaBan1], [SoLuongBan1], [GiaBan2], [SoLuongBan2], [GiaBan3], [SoLuongBan3], [Tongso]) VALUES (3, N'NJI', 3000, 2000, 1000, 2000, 3000, 20000, 2000, 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangGiaTrucTuyen] ([ID], [MaCK], [GiaMua1], [SoLuongMua1], [GiaMua2], [SoLuongMua2], [GiaMua3], [SoLuongMua3], [GiaKhop], [SoLuongKhop], [GiaBan1], [SoLuongBan1], [GiaBan2], [SoLuongBan2], [GiaBan3], [SoLuongBan3], [Tongso]) VALUES (4, N'YHV', 2000, 100, 3000, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangGiaTrucTuyen] ([ID], [MaCK], [GiaMua1], [SoLuongMua1], [GiaMua2], [SoLuongMua2], [GiaMua3], [SoLuongMua3], [GiaKhop], [SoLuongKhop], [GiaBan1], [SoLuongBan1], [GiaBan2], [SoLuongBan2], [GiaBan3], [SoLuongBan3], [Tongso]) VALUES (5, N'COB', 2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BangGiaTrucTuyen] ([ID], [MaCK], [GiaMua1], [SoLuongMua1], [GiaMua2], [SoLuongMua2], [GiaMua3], [SoLuongMua3], [GiaKhop], [SoLuongKhop], [GiaBan1], [SoLuongBan1], [GiaBan2], [SoLuongBan2], [GiaBan3], [SoLuongBan3], [Tongso]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[BangGiaTrucTuyen] OFF
GO
SET IDENTITY_INSERT [dbo].[LenhDat] ON 

INSERT [dbo].[LenhDat] ([id], [MaCoPhieu], [NgayDat], [LoaiGiaoDich], [LoaiLenh], [SoLuong], [GiaDat], [TrangThai]) VALUES (1, N'AAA', CAST(N'2022-04-14T00:00:00.000' AS DateTime), N'k', N'LO        ', 3000, 10000, N'Chờ Khớp')
INSERT [dbo].[LenhDat] ([id], [MaCoPhieu], [NgayDat], [LoaiGiaoDich], [LoaiLenh], [SoLuong], [GiaDat], [TrangThai]) VALUES (2, N'AAA', CAST(N'2022-04-14T00:00:00.000' AS DateTime), N'B', N'LO        ', 2000, 5000, N'Chờ Khớp')
INSERT [dbo].[LenhDat] ([id], [MaCoPhieu], [NgayDat], [LoaiGiaoDich], [LoaiLenh], [SoLuong], [GiaDat], [TrangThai]) VALUES (3, N'BBB', CAST(N'2022-04-14T00:00:00.000' AS DateTime), N'M', N'LO        ', 6000, 2000, N'Chờ khớp')
SET IDENTITY_INSERT [dbo].[LenhDat] OFF
GO
ALTER TABLE [dbo].[LenhKhop]  WITH CHECK ADD  CONSTRAINT [FK__LenhKhop__idLenh__267ABA7A] FOREIGN KEY([idLenhDat])
REFERENCES [dbo].[LenhDat] ([id])
GO
ALTER TABLE [dbo].[LenhKhop] CHECK CONSTRAINT [FK__LenhKhop__idLenh__267ABA7A]
GO
/****** Object:  Trigger [dbo].[trg_LenhDat]    Script Date: 16/04/2022 11:04:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_LenhDat] ON [dbo].[LenhDat]
For insert, update
As
begin
	if EXISTS (select MaCK from BangGiaTrucTuyen where MaCK = (select MaCoPhieu from inserted)) -- kiem tra mack trong bang inserted co ton tai trong bang gia truc tuyen
	begin
		declare @CursorVariable Cursor, --khaiBao các biến
				@MaCK nvarchar(7),
				@giamua1 float,
				@soluongmua1 int,
				@giamua2 float,
				@soluongmua2 int,
				@giamua3 float,
				@soluongmua3 int,
				@giaban1 float,
				@soluongban1 int,
				@giaban2 float,
				@soluongban2 int,
				@giaban3 float,
				@soluongban3 int
		Set @CursorVariable = cursor for select distinct MaCoPhieu from LenhDat --cho cursor trỏ tới các MaCoPhieu khong trung nhau trong LenhDat (select distinct la chỉ lấy những phần tử không trùng nhau)
		open @CursorVariable						--mở 1 cursor
		Fetch next from @CursorVariable into @MaCK		--cursor trỏ tới MaCK đầu tiên 
		while @@FETCH_STATUS =0	
		begin
			--set gia mua và số lượng mua theo quy tắc giá mua 1 cao nhất, giá mua1 >giá mua2 > giá mua 3
			set @giamua1 = (select Max(GiaDat) from LenhDat where MaCoPhieu = @MaCK and LoaiGiaoDich = 'M' and SoLuong>0 and CAST(NgayDat as date) = CAST(GETDATE() as date))
			set @soluongmua1 = (select SUM(SoLuong) from LenhDat where MaCoPhieu = @MaCK and LoaiGiaoDich = 'M' and SoLuong>0 and CAST(NgayDat as date) = CAST(GETDATE() as date) and GiaDat = @giamua1)
			set @giamua2 = (select Max(GiaDat) from LenhDat where  MaCoPhieu = @MaCK and LoaiGiaoDich = 'M' and SoLuong>0 and CAST(NgayDat as date) = CAST(GETDATE() as date) and GiaDat < @giamua1)
			set @soluongmua2 = (select Sum(SoLuong) from LenhDat where MaCoPhieu = @MaCK and LoaiGiaoDich = 'M' and SoLuong > 0 and CAST(NgayDat as date) = CAST(GETDATE() as date) and GiaDat = @giamua2)
			set @giamua3 = (select Max(GiaDat) from LenhDat where  MaCoPhieu = @MaCK and LoaiGiaoDich = 'M' and SoLuong>0 and CAST(NgayDat as date) = CAST(GETDATE() as date) and GiaDat < @giamua2)
			set @soluongmua3 = (select Sum(SoLuong) from LenhDat where MaCoPhieu = @MaCK and LoaiGiaoDich = 'M' and SoLuong > 0 and CAST(NgayDat as date) = CAST(GETDATE() as date) and GiaDat = @giamua3)
			--set gia Bán và số lượng bán theo quy tắc giá mua 1 Thấp nhất, giá bán 3>giá bán 2 > giá bán 1
			set @giaban1 = (select Min(GiaDat) from LenhDat where  MaCoPhieu = @MaCK and LoaiGiaoDich = 'B' and SoLuong>0 and CAST(NgayDat as date) = CAST(GETDATE() as date))
			set @soluongban1 = (select Sum(SoLuong) from LenhDat where MaCoPhieu = @MaCK and LoaiGiaoDich = 'B' and SoLuong > 0 and CAST(NgayDat as date) = CAST(GETDATE() as date) and GiaDat = @giaban1)
			set @giaban2 = (select Min(GiaDat) from LenhDat where  MaCoPhieu = @MaCK and LoaiGiaoDich = 'B' and SoLuong>0 and CAST(NgayDat as date) = CAST(GETDATE() as date) and GiaDat > @giaban1)
			set @soluongban2 = (select Sum(SoLuong) from LenhDat where MaCoPhieu = @MaCK and LoaiGiaoDich = 'B' and SoLuong > 0 and CAST(NgayDat as date) = CAST(GETDATE() as date) and GiaDat = @giaban2)
			set @giaban3 = (select Min(GiaDat) from LenhDat where  MaCoPhieu = @MaCK and LoaiGiaoDich = 'B' and SoLuong>0 and CAST(NgayDat as date) = CAST(GETDATE() as date)and GiaDat > @giaban2)
			set @soluongban3 = (select Sum(SoLuong) from LenhDat where MaCoPhieu = @MaCK and LoaiGiaoDich = 'B' and SoLuong > 0 and CAST(NgayDat as date) = CAST(GETDATE() as date) and GiaDat = @giaban3)
			
			update BangGiaTrucTuyen set --Câu lệnh update vào BangGiaTrucTuyen
										GiaMua1 = @giamua1, 
										SoLuongMua1 = @soluongmua1,
										GiaMua2 = @giamua2,
										SoLuongMua2 = @soluongmua2,
										GiaMua3 = @giamua3,
										SoLuongMua3 = @soluongmua3,
										GiaBan1 = @giaban1,
										SoLuongBan1 = @soluongban1,
										GiaBan2 = @giaban2,
										SoLuongBan2 = @soluongban2,
										GiaBan3 = @giaban3,
										SoLuongBan3 = @soluongban3
										where MaCK = @MaCK
			Fetch next from @CursorVariable into @MaCK	--cursor trỏ đến MaCK tiếp theo
		end
		CLOSE @CursorVariable --đóng cursor
		DEALLOCATE @CursorVariable	-- cái này thì chịu :<<
	end
	else -- nếu các MaCoPhieu được thêm vào trong lệnh đặt mà ko có trong BangGiaTrucTuyen
		begin
			
			declare @ma nvarchar(7)
			set @ma = (select MaCoPhieu from inserted)
			set @giamua1 = (select Max(GiaDat) from LenhDat where MaCoPhieu = @ma and LoaiGiaoDich = 'M' and SoLuong > 0 and cast(NgayDat as date) = cast(GETDATE() as date))
			set @soluongmua1 = (select Sum(SoLuong) from LenhDat where MaCoPhieu = @ma and LoaiGiaoDich = 'M' and SoLuong>0 and CAST(NgayDat as date) = CAST(GETDATE() as date) and GiaDat = @giamua1)
			set @giaban1 = (select Min(GiaDat) from LenhDat where  MaCoPhieu = @ma and LoaiGiaoDich = 'B' and SoLuong>0 and CAST(NgayDat as date) = CAST(GETDATE() as date))
			set @soluongban1 = (select Sum(SoLuong) from LenhDat where MaCoPhieu = @ma and LoaiGiaoDich = 'B' and SoLuong > 0 and CAST(NgayDat as date) = CAST(GETDATE() as date) and GiaDat = @giaban1)
			INSERT INTO BangGiaTrucTuyen(MaCK, GiaMua1, SoLuongMua1, GiaBan1, SoLuongBan1,Tongso)
			VALUES(@ma, @giamua1, @soluongmua1, @giaban1, @soluongban1,0)
			--(vì đã set giá trị bằng null nên có thể set các giá trị chưa thêm vào bằng null)
			-- ví dụ thêm 1 lệnh mua thì giá bán 1 và số lượng bán 1 sẽ là null
			-- Cái tổng số là tổng số lượng đã Khớp Mà lệnh mới thêm vào nên Tổng số luông = 0
		end
end
GO
ALTER TABLE [dbo].[LenhDat] ENABLE TRIGGER [trg_LenhDat]
GO
/****** Object:  Trigger [dbo].[trg_LenhKhop]    Script Date: 16/04/2022 11:04:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_LenhKhop] ON [dbo].[LenhKhop]
For insert, update
AS
begin
	declare @macp nvarchar(7)
	set @macp = (select a.MaCoPhieu from LenhDat a, inserted b where a.id = b.idLenhDat)
	update BangGiaTrucTuyen
	set GiaKhop = (select GiaKhop from inserted),
		SoLuongKhop = (select SoLuongKhop from inserted),
		Tongso = Tongso + (select SoLuongKhop from inserted)
	where BangGiaTrucTuyen.MaCK = @macp
		
end
GO
ALTER TABLE [dbo].[LenhKhop] ENABLE TRIGGER [trg_LenhKhop]
GO
USE [master]
GO
ALTER DATABASE [ChungKhoan] SET  READ_WRITE 
GO
