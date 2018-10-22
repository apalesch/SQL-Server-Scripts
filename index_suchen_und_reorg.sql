select db_id()
select object_id('dbo.DW_SCL_TRIP')

select * from sys.dm_db_index_physical_stats(10,546100986,null,null,'detailed')

select * from sys.indexes as i inner join sys.objects as o on i.object_id=o.object_id 
where o.name='DW_SCL_TRIP'

alter index iPointSequenceIdIdx on DW_SCL_TRIP reorganize