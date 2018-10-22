
-- Analyse Nonclustered Indizes
select o.name as Tabelle, i.name as Indexname,i.type_desc,(us.user_seeks+us.user_scans) as Zugriffe,us.*
from sys.dm_db_index_usage_stats as us inner join sys.indexes as i
											on us.object_id = i.object_id
												and us.index_id = i.index_id
									   inner join sys.objects as o
											on i.object_id = o.object_id
where o.is_ms_shipped=0 and i.index_id>1
order by Zugriffe asc

-- Analyse Tablescansselect o.name as Tabelle, i.name as Indexname,i.type_desc,(us.user_seeks+us.user_scans) as Zugriffe,us.*
select o.name as Tabelle, i.name as Indexname,i.type_desc,(us.user_seeks+us.user_scans) as Zugriffe,us.*
from sys.dm_db_index_usage_stats as us inner join sys.indexes as i
											on us.object_id = i.object_id
												and us.index_id = i.index_id
									   inner join sys.objects as o
											on i.object_id = o.object_id
where o.is_ms_shipped=0 and i.index_id<=1
order by user_scans desc 

