

--INTERSECT: İki sorgunun ortak satırlarını döndürür (kesişim).
--EXCEPT: Birinci sorgudaki satırlardan ikinci sorguda olmayan satırları döndürür (fark).

use WorkShopDB

select UserId from Registrations
where WorkshopId = 1 

Intersect -- İki sorgunun ortak satırının döndürdü . 

select UserId from Registrations
where WorkshopId = 2



select UserId from Users

except -- Farkı döndürdü .

select distinct UserId from Registrations



-- UNION, iki veya daha fazla SELECT sorgusunun sonuçlarını tek bir sonuç kümesinde birleştirir
-- ve tekrarlayan (duplicate) satırları otomatik olarak kaldırır.

-- UNION ALL, UNION ile aynıdır ama duplicate (tekrarlayan) kayıtları da korur.
-- Yani herhangi bir “distinct” işlemi yapmaz.


select UserId from Registrations where WorkshopId = 1
--union all
union
select UserId from Registrations where WorkshopId = 2



select FullName, 'Student' as Role from Users where IsStudent = 1
union 
select FullName, 'Non-Student' as Role from Users where IsStudent = 0



------------------------------------------------------------------------

-- DECLARE Kavramı :
-- SQL Server’da DECLARE ifadesi, değişken tanımlamak (oluşturmak) için kullanılır.
-- Yani DECLARE, T-SQL (Transact-SQL) içinde değer tutan geçici bir değişken oluşturmanı sağlar.



declare @FullName nvarchar(100)

select @FullName = FullName from Users where UserId = 6

print 'Kullanici: ' + @FullName


----------------------------------------------------------------------

-- Transaction Nedir ? 

-- SQL’de TRANSACTION (işlem) kavramı, bir grup SQL komutunu tek bir bütün (atomik işlem) olarak çalıştırmayı sağlar.

-- Yani bir transaction (işlem) içindeki tüm adımlar ya tamamen yapılır (commit),
-- ya da hiç yapılmamış gibi geri alınır (rollback).

-- Bir transaction, veritabanında yapılan bir veya birden fazla SQL işlemini (INSERT, UPDATE, DELETE vs.)
-- tek bir mantıksal bütün olarak yürütür.

-- Eğer bu işlemlerden biri başarısız olursa, hepsi geri alınır → veri tutarlılığı korunur.


use WorkShopDB
begin transaction 

begin TRY 
   insert into Users(FullName,Email,Phone)
   values ('Mustafa Karadeniz','mustafa@karadeniz.com',05065456167)

   declare @NewUserId int = SCOPE_IDENTITY()

   insert into Registrations(UserId,WorkshopId,IsApproved)
   values (@NewUserId,1,1)

   update Workshops
   set Capacity = Capacity - 1
   where WorkshopId = 1


   commit 
end try
   
Begin catch
   ROLLBACK
   print 'Bir hata oluştu' + ERROR_MESSAGE()
end catch















