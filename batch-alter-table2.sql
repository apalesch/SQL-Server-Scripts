

create table test (id int identity(1,1),Feld  varchar(50) not null)

insert into test(Feld)
values  ('ABC'),('DEF'),('XYZ') 

alter table test add Feld2 int null -- default(4)

declare @Rowcount int = 1

while @RowCount > 0
 begin
	update top(10000) Test
	set Feld2= 4
	where Feld2 is null
	
	set @RowCount = @@RowCount
end 

alter table test alter column Feld2 int not null