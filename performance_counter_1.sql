select * from sys.dm_os_memory_clerks where name like '%plan%' 

select * from sys.dm_os_performance_counters where counter_name like '%page%'

select * from sys.dm_os_wait_stats order by wait_time_ms desc

select * from sys.dm_exec_sessions where session_id=1