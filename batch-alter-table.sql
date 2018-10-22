
declare @Rowcount int = 1

while @RowCount > 1
 begin
	update top(10000) T
	set F= Wert
	where F is null
	
	set @RowCount = @@RowCount
end 



