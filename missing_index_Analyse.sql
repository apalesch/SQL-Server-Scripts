
select object_name(id.object_id) as tabelle,id.equality_columns,id.inequality_columns,id.included_columns,gs.*
from sys.dm_db_missing_index_details as id inner join sys.dm_db_missing_index_groups as g
										on id.index_handle = g.index_handle
										   inner join sys.dm_db_missing_index_group_stats as gs
												on g.index_group_handle = gs.group_handle
where id.database_id=db_id() 
order by user_seeks desc
