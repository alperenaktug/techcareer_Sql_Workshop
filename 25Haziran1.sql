

-- DDL Komutlarý :
-- (Data Definition Language (Veri Tanýmlama Dili))

-- DDL, veritabaný nesnelerinin yapýsýný (þemasýný) oluþturmak, deðiþtirmek ve silmek için kullanýlan SQL komutlarýný kapsar.
-- Yani, bir veritabanýnýn iskeletini kurmak için kullanýlýrlar


-- CREATE : 
-- Bu komut, veritabanýnda yeni bir nesne oluþturmak için kullanýlýr.
-- Bu nesneler veritabanýnýn kendisi, tablolar, görünümler (view) veya dizinler (index) olabilir.

-- ALTER : 
-- Var olan bir veritabaný nesnesinin yapýsýný deðiþtirmek için kullanýlýr. 
-- Bu komutla bir tabloya yeni bir sütun ekleyebilir, mevcut bir sütunu silebilir veya özelliklerini deðiþtirebilirsiniz.

-- DROP : 
-- Bu komut, bir veritabaný nesnesini tamamen siler.
-- Bir tabloyu veya veritabanýný DROP ettiðinizde, hem yapýsý hem de içerisindeki tüm veriler kalýcý olarak silinir.
-- Bu yüzden dikkatli kullanýlmasý gereken bir komuttur.

-- TRUNCATE :
-- Bir tablodaki tüm verileri hýzlý bir þekilde silerken, tablonun yapýsýný (sütunlarý, kýsýtlamalarý vb.) korur. 
-- DELETE komutundan daha hýzlýdýr çünkü her satýrý tek tek silmek yerine, tablonun içeriðini tamamen boþaltýr.

-------------------------------------------------------------------------------------------------------------------------------------------
--  Sayýsal Veri Tipleri : 

-- INT (Integer): En yaygýn kullanýlan tam sayý tipidir. Genellikle -2 milyar ile +2 milyar arasýnda deðerleri saklar.
-- ID numaralarý, adet gibi tam sayý deðerleri için idealdir. Farklý boyutlarda alt türleri de bulunur: TINYINT, SMALLINT, BIGINT.

-- DECIMAL(p, s) / NUMERIC(p, s): Hassas ondalýklý sayýlar için kullanýlýr. p (precision), toplam basamak sayýsýný;
-- s (scale) ise ondalýk kýsýmdaki basamak sayýsýný belirtir. Örneðin, DECIMAL(5, 2) toplam 5 basamak (virgülden sonra 2 basamak) tutabilir.
-- Finansal veriler ve para birimleri için en güvenilir tiptir.

-- FLOAT / REAL: Ondalýklý sayýlarý saklamak için kullanýlýr, ancak DECIMAL kadar kesin deðildir.
-- Bu tipler, bilimsel hesaplamalar gibi hassasiyetin çok kritik olmadýðý durumlarda kullanýlýr.


--  Metin Veri Tipleri : 

-- CHAR(n): Sabit uzunluklu karakter dizisidir. n, karakter sayýsýný belirtir. Tanýmlanan n uzunluðu ne olursa olsun, girilen veri daha kýsa bile olsa,
-- bellekten her zaman n karakterlik yer ayýrýr. Örneðin, CHAR(10) olarak tanýmlanan bir sütuna "Merhaba" yazarsanýz, yine de 10 karakterlik yer kaplar.
-- TC kimlik numarasý gibi uzunluðu her zaman ayný olan veriler için uygundur.

-- VARCHAR(n): Deðiþken uzunluklu karakter dizisidir. n, maksimum karakter sayýsýný belirtir. Girilen verinin uzunluðu kadar yer kaplar.
-- Bu yüzden depolama açýsýndan daha verimlidir. Örneðin, VARCHAR(255) olarak tanýmlanan bir sütuna "Ahmet" yazarsanýz, yalnýzca 5 karakterlik yer kaplar.
-- Ýsim, soyisim, adres gibi deðiþken uzunluklu metinler için idealdir. ( nvarcahar da unicode desteði vardýr farklý dilleri destekler.)

-- TEXT: Çok büyük metin verilerini saklamak için kullanýlýr. VARCHAR'ýn aksine, maksimum bir uzunluk belirtmenize gerek kalmaz ve çok uzun yazýlarý 
-- (blog yazýsý, ürün açýklamasý vb.) depolamak için uygundur


-- Tarih ve Saat Veri Tipleri :

-- DATE: Yalnýzca tarihi (YYYY-MM-DD formatýnda) saklar.
-- TIME: Yalnýzca saati (HH:MM:SS formatýnda) saklar.
-- DATETIME: Hem tarihi hem de saati (YYYY-MM-DD HH:MM:SS formatýnda) saklar.

-- Diðer Veri Tipleri : 

-- BOOLEAN (veya BIT): Sadece True (Doðru) veya False (Yanlýþ) gibi mantýksal deðerleri saklar. BIT, 0 veya 1 deðerlerini tutar.
-- BINARY / VARBINARY: Ýkili verileri (resim, ses dosyasý vb.) saklamak için kullanýlýr.
-- UUID (Universally Unique Identifier): Veritabaný içinde benzersiz bir kimlik oluþturmak için kullanýlýr.Genellikle 36 karakterlik özel bir formatý vardýr.



-----------------------------------------------------------------------------------------------------------------------------------

-- NULL Kavramý : 

-- SQL'de NULL, bir deðerin bilinmediði, mevcut olmadýðý veya uygulanamadýðý anlamýna gelen özel bir iþaretleyicidir. 
-- Sýfýr veya boþ bir karakter dizisi (string) deðildir; aslýnda herhangi bir deðerin yokluðunu temsil eder.

------------------------------------------------------------------------------------------------------------------------------------


create DATABASE WorkShopDB  -- Veritabaný yaratýldý.
use WorkShopDB              -- Kullanýcý olarak bundan sonra yapýlan iþlemler bu veritabaný için dendi.

create table Students (     -- Students adaýnda tablo oluþturuldu. 
     StudentID int primary key identity(1,1),  -- Id primary key olarak verildi. primary key unique br deðer benzersiz bir kimlik gibi düþünebiliriz. 
	                                            -- identity ise 1 den baþlayýp 1 er 1 er artmasý için (1,1) verildi.
	 FirstName nvarchar(50),    --  FirstName alaný verildi nvarchar(50) olarak.
	 LastName nvarchar(50),
	 BirthDate Date,
	 Email nvarchar(100)
)

alter table Students add PhoneNumber nvarchar(20)  -- Tablo üzerine PhoneNumber ekleme iþlemi yapýldý. 

alter table Students drop column PhoneNumber    -- Tablo üzerinde PhoneNumber silme iþlemi yapýldý.

drop table Students     -- Veritanýnda Students tablosu içindekilerler beraber geri bir daha dönülemez þekilde silindi.



---------------------------------------------------------------------------------------------------------------------------


create table Users(
   UserId int primary key identity (1,1),  -- UserId primary key þeklinde 1 den baþlayaýp 1 er 1 er artacak þekilde oluþturuldu.
   FullName nvarchar(100) NOT NULL,   -- FullName nvarchar þekliden tanýmlandý ve NOT NULL olacak þekilde yani boþ býrakýlamaz þekilde oluþturuldu.
   Email nvarchar(100) UNIQUE NOT NULL,   -- Email nvarchar þeklinde tanýmlandý . UNIQUE olarak ayarlandý yani daha önceden kayýtlý olmayan bir email hesabý                                  
   Phone nvarchar(20) NOT NULL,
   IsStudent BIT default 1,  -- IsStudent deðeri BIT ile default olarak true dendi ve oluþturuldu.
   RegisteredAt DATETIME default GETDATE() -- RegisteredAt deðeri DATETIME ollarak oluþturuldu ve default deðeri olarak ise kayýt olduðu aný GETDATE() ile aldýk.
)


create table Workshops(
  WorkshopId int primary key identity(1,1),
  Title nvarchar(150) NOT NULL,
  Description nvarchar(max), -- Burada max ile bir sýnýr yok bittiði yere kadar al denmekte.
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  Capacity int NOT NULL,
  Price DECIMAL(10,2) default 0
)


create table Registrations(
  RegistrationId int primary key identity(1,1),
  UserId int NOT NULL,
  WorkshopId int NOT NULL,
  AppliedAt DATETIME default GETDATE(),
  IsApproved BIT default 0

-- constraints (kýsýtlamalar) tablolar arasýndaki iliþkileri belirlemek ve veri bütünlüðünü saðlamak amacýyla kullanýlýr.

  constraint FK_Registrations_Users foreign key (UserId) references Users(UserId),
  --Bu satýr, Registrations tablosundaki UserId sütununun, Users tablosundaki UserId sütununa bir yabancý anahtar olarak baðlandýðýný tanýmlar.
  constraint FK_Registrations_Workshops foreign key (WorkshopId) references Workshops(WorkshopId)
)
-- IMPORTANT : 

-- Veri Bütünlüðü Saðlanýr: Her kayýt, geçerli bir kullanýcý ve geçerli bir atölyeye baðlanmak zorundadýr.
-- Yanlýþ Veri Giriþi Engellenir: Yanlýþlýkla veya bilinçli olarak var olmayan bir kullanýcý veya atölye ID'si ile 
-- kayýt oluþturulmasý engellenir.
-- Ýliþkisel Sorgular Kolaylaþýr: JOIN komutlarý kullanarak bir kaydýn detaylarýný (kimin kaydolduðu, hangi atölyeye
-- kaydolduðu vb.) kolayca alabilirsiniz. Örneðin, "Ahmet'in katýldýðý tüm atölye isimlerini listele" gibi bir sorgu
-- bu kýsýtlamalar sayesinde sorunsuz çalýþýr.


create table Instructors(
 InstructorId int primary key identity(1,1),
 FullName nvarchar(100),
 Bio nvarchar(max),
 Email nvarchar(100) UNIQUE
)

alter table Workshops add InstructorId int -- Workshops tablosuna InstructorId sütunu eklendi.

alter table Workshops add constraint   -- Workshops tablosuyla Instructors tablosu arasýnda InstructorId foreign key olarak iliþki kuruldu.
            FK_Workshops_Instructors foreign key (InstructorId)
	                                 references Instructors(InstructorId)



--------------------------------------------------------------------------------------------------------

-- DML Komutlarý : 
-- (Data Manipulation Language (Veri manipülasyon dili))

-- DML komutlarý, veritabanýndaki verileri yönetmek ve deðiþtirmek için kullanýlýr.
-- Bu komutlar, tablolardaki mevcut verilere eriþmenizi, onlarý güncellemenizi, eklemenizi veya silmenizi saðlar.

-- SELECT : 
-- Veritabanýndan veri çekmek için kullanýlýr. Bu komut, belirtilen tablodan belirli sütunlarý veya tüm verileri
-- sorgulamaya yarar. Veritabanýný okuyan, ancak veriyi deðiþtirmeyen tek DML komutudur.

-- INSERT : 
-- Bir tabloya yeni veri eklemek için kullanýlýr. Genellikle INSERT INTO yapýsýyla kullanýlýr.

-- UPDATE : 
-- Bir tablodaki mevcut verileri deðiþtirmek için kullanýlýr. Genellikle WHERE koþuluyla birlikte kullanýlýr;
-- bu sayede sadece istenilen satýrlar güncellenir. WHERE koþulu kullanýlmazsa, tablodaki tüm veriler güncellenir.

-- DELETE : 
-- Bir tablodan veri silmek için kullanýlýr. UPDATE komutuna benzer þekilde, WHERE koþuluyla birlikte kullanýlmasý önemlidir.
-- Aksi takdirde, tablodaki tüm veriler silinir.



insert into Users(FullName,Email,Phone,IsStudent) -- Users tablosuna insert into ile veriler eklendi .
       values ('Eda Korkmaz','eda@korkmaz.com','05555555555',1)

insert into Workshops (Title,Description,StartDate,EndDate,Capacity,Price)
       values(
	     'SQL Temelleri',
		 'Veritabaný Yönetimi ve SQL sorgularýna giriþ',
		 '2025-07-01',
		 '2025-07-03',
		 30,
		 199.90	   
	   )

insert into Instructors ()











