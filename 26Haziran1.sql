use WorkShopDB

-- alias bir tabloya veya sütuna geçici isim vermek için kullanýlýr .
select FullName as Tam_Ad , Email from Users

-- Kdv eklenmiþ halleri alias ile eklendi .
select Title,Price, Price * 1.18 as PriceWithVat from Workshops 

-- Kapasitenin % 75 i dolduðunda ki durumu getirir . 
select Title, Capacity , capacity * 0.75 as ExpectedAttendance from Workshops

-- Toplam kapasiteye göre toplam elde edilecek gelirleri getirir . 
select Title , Capacity * Price as PotantielRevenue from WorkShops


---------------------------------------------------------------------------------------------


-- Group by :  Tabloda yer alan verileri belirli sütunlara göre gruplamak için kullanýlýr . 
-- Genellikle Aggregate fonksiyonlarýyla kullanýlýr (sum  -> toplama , avg -> ortalama alma , count -> sayma vb.)
-- Having group by dan sonra filtreleme iþlemi yapmak için kullanýlýr . 
-- Where gruplama öncesi filtreleme yapar .


select WorkshopId , count(*) as TotalApplications from Registrations
group by WorkshopId

-- Workshop lardan toplam elde edilen ücret .
select WorkshopId , Sum(Price) as TotalRevenue from Workshops
group by WorkshopId

-- en az 1 kere baþvuruda bulunmuþ kayýtlarý getirir .
select WorkshopId , count(*) as TotalApplications 
from Registrations
group by WorkshopId
having count(*) > 0

------------------------------------------------------

-- Tarih Filtreleme Ýþlemleri 

-- DATEADD() donksiyonu belirli bir tarihe belirli bir zaman (gün,ay,yýl,saat vb.) eklemek veya çýkarmak için kullanýlýr .

-- Son 1 ay içindeki kayýtlarý getir .
select FullName,Email,RegisteredAt from Users
where RegisteredAt >= DATEADD(MONTH,-1,GETDATE())

-- Gelecekte planlanan eðitimleri getirir .
select title,startDate from Workshops
where StartDate >= GETDATE()

-- Cast() fonksiyonu bir veri tipini baþka bir veri tipine dönüþtürme iþlemi yapýyor .

-- Bugün olan bir eðitimi getirir . 
select title,StartDate from Workshops
where CAST(StartDate as Date) = CAST(GETDATE() as date)


--DATEDIFF() Ýki tarih arasýndaki farký alýr . 

-- Eðitimlerin kaç gün sürdüðünü gösterir .
select Title,DATEDIFF(DAY,StartDate,EndDate) as DurationInDays
from Workshops




---------------------------------------------------------------------

-- Subquery(alt sorgular) : Bir sorgunun içinde yer alan baþka bir sorgudur .
-- subquery bir deðeri , bir listeyi yada geçici bir tabloyu ana sorguya saðlamak için kullanýlýr .

-- 1. Tek Satýr Döndüren Alt Sorgu
-- Bir alt sorgu tek bir deðer döndürüyorsa genellikle =, <, > gibi karþýlaþtýrma operatörleriyle kullanýlýr.

-- SELECT first_name, salary
-- FROM Employees
-- WHERE salary = (SELECT MAX(salary) FROM Employees);


-- 2. Çok Satýr Döndüren Alt Sorgu
-- Bir alt sorgu birden fazla satýr döndürüyorsa, IN, ANY, ALL gibi operatörler kullanýlýr.

-- SELECT first_name
-- FROM Employees
-- WHERE department_id IN (
--    SELECT department_id
--    FROM Departments
--    WHERE city IN ('Ýstanbul', 'Ankara') );



--En pahalý workshop'ý ve en pahalý workshop'un adýný istiyorum .
select Title,Price as MaxPrice from Workshops
where Price = (select max(price) from Workshops)


select FullName,Email from Users
where UserId IN (select distinct UserId from Registrations)


--------------------------------------------------------------

-- Join Kavramý : Ýki veya daha fazla tabloyu ortak bir sütun üzerinde birleþtirir.


-- Inner Join : Sadece eþleþen kayýtlarý getirir yani iki tabloda orta olanlarý .
-- Left Join : Sol (birinci) tablodaki tüm kayýtlarý getirir, sað tabloda eþleþme yoksa NULL döner.
-- Right Join : Sað (ikinci) tablodaki tüm kayýtlarý getirir, sol tabloda eþleþme yoksa NULL döner.
-- Full outer Join : Hem saðdan hem soldan tüm verileri getirir. 

select U.FullName,
       W.Title as WorkshopTitle,
	   R.AppliedAt
from Registrations R
inner join Users U on R.UserId = U.UserId
inner join Workshops W on R.WorkshopId = W.WorkshopId

select U.FullName,
       W.Title as WorkshopTitle,
	   R.AppliedAt
from Registrations R
left join Users U on R.UserId = U.UserId
left join Workshops W on R.WorkshopId = W.WorkshopId

select U.FullName,
       W.Title as WorkshopTitle,
	   R.AppliedAt
from Registrations R
right join Users U on R.UserId = U.UserId
right join Workshops W on R.WorkshopId = W.WorkshopId

select U.FullName,
       W.Title as WorkshopTitle,
	   R.AppliedAt
from Registrations R
full outer join Users U on R.UserId = U.UserId
full outer join Workshops W on R.WorkshopId = W.WorkshopId
	   

