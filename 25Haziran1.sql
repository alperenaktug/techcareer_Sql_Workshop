

-- DDL Komutlar� :
-- (Data Definition Language (Veri Tan�mlama Dili))

-- DDL, veritaban� nesnelerinin yap�s�n� (�emas�n�) olu�turmak, de�i�tirmek ve silmek i�in kullan�lan SQL komutlar�n� kapsar.
-- Yani, bir veritaban�n�n iskeletini kurmak i�in kullan�l�rlar


-- CREATE : 
-- Bu komut, veritaban�nda yeni bir nesne olu�turmak i�in kullan�l�r.
-- Bu nesneler veritaban�n�n kendisi, tablolar, g�r�n�mler (view) veya dizinler (index) olabilir.

-- ALTER : 
-- Var olan bir veritaban� nesnesinin yap�s�n� de�i�tirmek i�in kullan�l�r. 
-- Bu komutla bir tabloya yeni bir s�tun ekleyebilir, mevcut bir s�tunu silebilir veya �zelliklerini de�i�tirebilirsiniz.

-- DROP : 
-- Bu komut, bir veritaban� nesnesini tamamen siler.
-- Bir tabloyu veya veritaban�n� DROP etti�inizde, hem yap�s� hem de i�erisindeki t�m veriler kal�c� olarak silinir.
-- Bu y�zden dikkatli kullan�lmas� gereken bir komuttur.

-- TRUNCATE :
-- Bir tablodaki t�m verileri h�zl� bir �ekilde silerken, tablonun yap�s�n� (s�tunlar�, k�s�tlamalar� vb.) korur. 
-- DELETE komutundan daha h�zl�d�r ��nk� her sat�r� tek tek silmek yerine, tablonun i�eri�ini tamamen bo�alt�r.

-------------------------------------------------------------------------------------------------------------------------------------------
--  Say�sal Veri Tipleri : 

-- INT (Integer): En yayg�n kullan�lan tam say� tipidir. Genellikle -2 milyar ile +2 milyar aras�nda de�erleri saklar.
-- ID numaralar�, adet gibi tam say� de�erleri i�in idealdir. Farkl� boyutlarda alt t�rleri de bulunur: TINYINT, SMALLINT, BIGINT.

-- DECIMAL(p, s) / NUMERIC(p, s): Hassas ondal�kl� say�lar i�in kullan�l�r. p (precision), toplam basamak say�s�n�;
-- s (scale) ise ondal�k k�s�mdaki basamak say�s�n� belirtir. �rne�in, DECIMAL(5, 2) toplam 5 basamak (virg�lden sonra 2 basamak) tutabilir.
-- Finansal veriler ve para birimleri i�in en g�venilir tiptir.

-- FLOAT / REAL: Ondal�kl� say�lar� saklamak i�in kullan�l�r, ancak DECIMAL kadar kesin de�ildir.
-- Bu tipler, bilimsel hesaplamalar gibi hassasiyetin �ok kritik olmad��� durumlarda kullan�l�r.


--  Metin Veri Tipleri : 

-- CHAR(n): Sabit uzunluklu karakter dizisidir. n, karakter say�s�n� belirtir. Tan�mlanan n uzunlu�u ne olursa olsun, girilen veri daha k�sa bile olsa,
-- bellekten her zaman n karakterlik yer ay�r�r. �rne�in, CHAR(10) olarak tan�mlanan bir s�tuna "Merhaba" yazarsan�z, yine de 10 karakterlik yer kaplar.
-- TC kimlik numaras� gibi uzunlu�u her zaman ayn� olan veriler i�in uygundur.

-- VARCHAR(n): De�i�ken uzunluklu karakter dizisidir. n, maksimum karakter say�s�n� belirtir. Girilen verinin uzunlu�u kadar yer kaplar.
-- Bu y�zden depolama a��s�ndan daha verimlidir. �rne�in, VARCHAR(255) olarak tan�mlanan bir s�tuna "Ahmet" yazarsan�z, yaln�zca 5 karakterlik yer kaplar.
-- �sim, soyisim, adres gibi de�i�ken uzunluklu metinler i�in idealdir. ( nvarcahar da unicode deste�i vard�r farkl� dilleri destekler.)

-- TEXT: �ok b�y�k metin verilerini saklamak i�in kullan�l�r. VARCHAR'�n aksine, maksimum bir uzunluk belirtmenize gerek kalmaz ve �ok uzun yaz�lar� 
-- (blog yaz�s�, �r�n a��klamas� vb.) depolamak i�in uygundur


-- Tarih ve Saat Veri Tipleri :

-- DATE: Yaln�zca tarihi (YYYY-MM-DD format�nda) saklar.
-- TIME: Yaln�zca saati (HH:MM:SS format�nda) saklar.
-- DATETIME: Hem tarihi hem de saati (YYYY-MM-DD HH:MM:SS format�nda) saklar.

-- Di�er Vrei Tipleri : 

-- BOOLEAN (veya BIT): Sadece True (Do�ru) veya False (Yanl��) gibi mant�ksal de�erleri saklar. BIT, 0 veya 1 de�erlerini tutar.
-- BINARY / VARBINARY: �kili verileri (resim, ses dosyas� vb.) saklamak i�in kullan�l�r.
-- UUID (Universally Unique Identifier): Veritaban� i�inde benzersiz bir kimlik olu�turmak i�in kullan�l�r.Genellikle 36 karakterlik �zel bir format� vard�r.



-----------------------------------------------------------------------------------------------------------------------------------

-- NULL Kavram� : 

-- SQL'de NULL, bir de�erin bilinmedi�i, mevcut olmad��� veya uygulanamad��� anlam�na gelen �zel bir i�aretleyicidir. 
-- S�f�r veya bo� bir karakter dizisi (string) de�ildir; asl�nda herhangi bir de�erin yoklu�unu temsil eder.

------------------------------------------------------------------------------------------------------------------------------------


create DATABASE WorkShopDB  -- Veritaban� yarat�ld�.
use WorkShopDB              -- Kullan�c� olarak bundan sonra yap�lan i�lemler bu veritaban� i�in dendi.

create table Students (     -- Students ada�nda tablo olu�turuldu. 
     StudentID int primary key identity(1,1),  -- Id primary key olarak verildi. primary key unique br de�er benzersiz bir kimlik gibi d���nebiliriz. 
	                                            -- identity ise 1 den ba�lay�p 1 er 1 er artmas� i�in (1,1) verildi.
	 FirstName nvarchar(50),    --  FirstName alan� verildi nvarchar(50) olarak.
	 LastName nvarchar(50),
	 BirthDate Date,
	 Email nvarchar(100)
)

alter table Students add PhoneNumber nvarchar(20)  -- Tablo �zerine PhoneNumber ekleme i�lemi yap�ld�. 

alter table Students drop column PhoneNumber    -- Tablo �zerinde PhoneNumber silme i�lemi yap�ld�.

drop table Students     -- Veritan�nda Students tablosu i�indekilerler beraber geri bir daha d�n�lemez �ekilde silindi.



---------------------------------------------------------------------------------------------------------------------------


create table Users(
   UserId int primary key identity (1,1),  -- UserId primary key �eklinde 1 den ba�laya�p 1 er 1 er artacak �ekilde olu�turuldu.
   FullName nvarchar(100) NOT NULL,   -- FullName nvarchar �ekliden tan�mland� ve NOT NULL olacak �ekilde yani bo� b�rak�lamaz �ekilde olu�turuldu.
   Email nvarchar(100) UNIQUE NOT NULL,   -- Email nvarchar �eklinde tan�mland� . UNIQUE olarak ayarland� yani daha �nceden kay�tl� olmayan bir email hesab�                                  
   Phone nvarchar(20) NOT NULL,
   IsStudent BIT default 1,  -- IsStudent de�eri BIT ile default olarak true dendi ve olu�turuldu.
   RegisteredAt DATETIME default GETDATE() -- RegisteredAt de�eri DATETIME ollarak olu�turuldu ve default de�eri olarak ise kay�t oldu�u an� GETDATE() ile ald�k.
)


create table Workshops(
  WorkshopId int primary key identity(1,1),
  Title nvarchar(150) NOT NULL,
  Description nvarchar(max), -- Burada max ile bir s�n�r yok bitti�i yere kadar al denmekte.
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

-- constraints (k�s�tlamalar) tablolar aras�ndaki ili�kileri belirlemek ve veri b�t�nl���n� sa�lamak amac�yla kullan�l�r.

  constraint FK_Registrations_Users foreign key (UserId) references Users(UserId),
  --Bu sat�r, Registrations tablosundaki UserId s�tununun, Users tablosundaki UserId s�tununa bir yabanc� anahtar olarak ba�land���n� tan�mlar.
  constraint FK_Registrations_Workshops foreign key (WorkshopId) references Workshops(WorkshopId)
)
-- IMPORTANT : 

-- Veri B�t�nl��� Sa�lan�r: Her kay�t, ge�erli bir kullan�c� ve ge�erli bir at�lyeye ba�lanmak zorundad�r.
-- Yanl�� Veri Giri�i Engellenir: Yanl��l�kla veya bilin�li olarak var olmayan bir kullan�c� veya at�lye ID'si ile 
-- kay�t olu�turulmas� engellenir.
-- �li�kisel Sorgular Kolayla��r: JOIN komutlar� kullanarak bir kayd�n detaylar�n� (kimin kaydoldu�u, hangi at�lyeye
-- kaydoldu�u vb.) kolayca alabilirsiniz. �rne�in, "Ahmet'in kat�ld��� t�m at�lye isimlerini listele" gibi bir sorgu
-- bu k�s�tlamalar sayesinde sorunsuz �al���r.


create table Instructors(
 InstructorId int primary key identity(1,1),
 FullName nvarchar(100),
 Bio nvarchar(max),
 Email nvarchar(100) UNIQUE
)

alter table Workshops add InstructorId int -- Workshops tablosuna InstructorId s�tunu eklendi.

alter table Workshops add constraint   -- Workshops tablosuyla Instructors tablosu aras�nda InstructorId foreign key olarak ili�ki kuruldu.
            FK_Workshops_Instructors foreign key (InstructorId)
	                                 references Instructors(InstructorId)



--------------------------------------------------------------------------------------------------------

-- DML Komutlar� : 
-- (Data Manipulation Language (Veri manip�lasyon dili))

-- DML komutlar�, veritaban�ndaki verileri y�netmek ve de�i�tirmek i�in kullan�l�r.
-- Bu komutlar, tablolardaki mevcut verilere eri�menizi, onlar� g�ncellemenizi, eklemenizi veya silmenizi sa�lar.

-- SELECT : 
-- Veritaban�ndan veri �ekmek i�in kullan�l�r. Bu komut, belirtilen tablodan belirli s�tunlar� veya t�m verileri
-- sorgulamaya yarar. Veritaban�n� okuyan, ancak veriyi de�i�tirmeyen tek DML komutudur.

-- INSERT : 
-- Bir tabloya yeni veri eklemek i�in kullan�l�r. Genellikle INSERT INTO yap�s�yla kullan�l�r.

-- UPDATE : 
-- Bir tablodaki mevcut verileri de�i�tirmek i�in kullan�l�r. Genellikle WHERE ko�uluyla birlikte kullan�l�r;
-- bu sayede sadece istenilen sat�rlar g�ncellenir. WHERE ko�ulu kullan�lmazsa, tablodaki t�m veriler g�ncellenir.

-- DELETE : 
-- Bir tablodan veri silmek i�in kullan�l�r. UPDATE komutuna benzer �ekilde, WHERE ko�uluyla birlikte kullan�lmas� �nemlidir.
-- Aksi takdirde, tablodaki t�m veriler silinir.



insert into Users(FullName,Email,Phone,IsStudent) -- Users tablosuna insert into ile veriler eklendi .
       values ('Eda Korkmaz','eda@korkmaz.com','05555555555',1)

insert into Workshops (Title,Description,StartDate,EndDate,Capacity,Price)
       values(
	     'SQL Temelleri',
		 'Veritaban� Y�netimi ve SQL sorgular�na giri�',
		 '2025-07-01',
		 '2025-07-03',
		 30,
		 199.90	   
	   )

insert into Instructors ()











