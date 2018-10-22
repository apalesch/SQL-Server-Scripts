--
dbcc freeproccache()

--
dbcc sqlperf('sys.dm_os_wait_stats',clear)

select * from sys.dm_os_wait_stats

select * from sys.dm_os_memory_clerks where name like '%plan%'