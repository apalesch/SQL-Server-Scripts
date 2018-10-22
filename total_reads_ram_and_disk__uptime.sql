-- total reads in GB Speicher und Disk
select sum(total_logical_reads)*8192/1000000000 as total_logical_reads,sum(total_physical_reads)*8192/1000000000 as total_physical_reads
from sys.dm_exec_query_stats

-- uptime vom server
select * from sys.dm_exec_sessions where session_id=1