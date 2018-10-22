use master
go
alter database mirror_test set partner='TCP://sql05hosting.dilax.com:5022'
alter database mirror_test set partner off