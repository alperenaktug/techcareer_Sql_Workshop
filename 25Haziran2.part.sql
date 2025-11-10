
insert into Users (FullName,Email,Phone,IsStudent)
   values ('Alperen Al', 'alperen@al.com',05078656214,1)

insert into Workshops (Title,Description,StartDate,EndDate,Capacity,Price)
  values ('Python Temelleri',
          'Programlama Diline giriþ',
		  '2025-08-03',
		  '2025-08-07',
		  40,
		  299.90
		  )

insert into Instructors (FullName,Bio,Email)
  values ('Ahmet Kaya',
          'Yazýlým eðitmenidir.',
		  'ahmet@kaya.com'
		  ) 


insert into Registrations (UserId,WorkshopId)
  values(2,2)


  update Users  -- Users tablosundaki telefon numaralarýný deðiþtir.Belirli bir koþula göre 
  set Phone = '05333333333' -- Eðer koþul vermezse tüm kayýtlarý ayný numarayla deðiþtirir.
  where Email = 'alperen@al.com'

  delete from Users --Users tablosunda email i bu olan kiþi silindi. Yeni kayýt eklendiðinde ýd no bunu atlayýp bir sonraki
  where Email = 'alperen@al.com' -- rakanmla devam edecek ve delete iþleminde feedback durumu var.


  select Title,Description from Workshops
  where InstructorId = 1

  -- SQL DML Filtreme Ýþlemleri 

   -- iki koþulunda ayný anda doðrulanmasý lazým ki veri gelsin(AND) .
  select * from Users
  where IsStudent = 0 AND Phone Is Not Null


  -- Ýki koþuldan birinin doðru olmasý yeterli verinin gelmesi için(OR) .
  select * from Users 
  where IsStudent = 0 OR Phone Is Not Null


   -- Aradýðýmýz þeyin tam ismini bilmediðimizde birkaç desenle ulaþmaya çalýþtýðýmýz komut(LIKE).
  select * from Users  
  where FullName LIKE '%ak%' -- '%xx%' içinde xx olan kayýtlarý getir . 

  select * from Users
  where FullName LIKE '%dog' -- '%xx' sonu xx ile biteni getir .
 
 select * from Users
  where FullName LIKE 'cer%' -- 'xx%' baþý xx ile baþlayaný getir. 


  select * from Users
  where IsStudent = 1 AND (FullName LIKE '%ek' And Email LIKE '%com')


  -- Deðeri belirtilen deðerlerin herhangi bir listede olup olmadýðýna bakar(IN)
  select * from Workshops -- Workshops tablosunda capacity si 20 30 40 olan deðerler var mý diye bakar .
  where Capacity IN (20 , 30 , 40)


  select * from Users -- IsStudent deðeri 1 olamyan deðerli getir demek için kullanýlýr.
  where NOT IsStudent = 1


  -- Belirli bir deðer aralýðýndaki deðerleri getirir(BETWEEN) .
  select * from Workshops -- WorkShops tablosundaki price ý 50 ile 300 arasýnda olan kurslarý getir dedik .
  where price BETWEEN 50 AND 300 -- 50 ile 300 dahildir.


  -- Bir sorgu sonucunda tekrarlayan (ayný) deðerleri kaldýrmak yani benxersiz kayýtlarý listelemek için kullanýlýr .  
  select distinct title from Workshops -- Biz kaç baþlýkta eðitim veriyoruz bunu gösterir .



  -- (Order By ) Select sorgularýnda kullanýlýr ve elde edilen kayýtlarýn sýralanmasýnda rol oynar .

  select FullName from Users -- Users tablosundaki isimleri büyükten küçüðe sýrala .
   order by FullName desc

   select FullName from Users -- Users tablosundaki isimleri küçükten büyüðe  sýrala .
   order by FullName asc



