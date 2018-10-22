select *
from sys.dm_os_memory_clerks
where name like '%plan%'



select *,wait_time_ms/1000.0 as wait_time_sec
from sys.dm_os_wait_stats
order by wait_time_ms desc 

select *
from sys.dm_os_performance_counters
