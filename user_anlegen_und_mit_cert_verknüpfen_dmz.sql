use master
go
-- Login anlegen, um sich an der DB anmelden zu können
create login mirroring_sqlsrv_dmz with password='<password>'
go
-- User in dessen Kontext das Mirroring ausgeführt wird
create user mirroring_sqlsrv_dmz for login mirroring_sqlsrv_dmz
go
-- Import des Zertifikats vom anderen Host und Verbinden des Users mit dem Zertifikat
-- Nutzer darf jetzt dieses Zertifikat nutzen
create certificate cert_sqlsrv_dmz authorization mirroring_sqlsrv_dmz from file='z:\cert_sqlsrv_dmz.crt'
go
-- beide Zertifikate sollten jetzt in der Liste stehen
select * from sys.certificates
go
-- User wird Recht eingeräumt sich mit dem Endpoint zu verbinden
grant connect on endpoint::mirroring to mirroring_sqlsrv_dmz