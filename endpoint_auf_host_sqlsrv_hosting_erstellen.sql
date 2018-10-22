use master
go 
-- Master-Key fuer Master-Datenbank erzeugen
-- wird benutzt um nachfolgendes Zertifikat zu verschluesseln
create master key encryption by password='<ultrageheimes passwort>'

-- Zeritifkat fuer Mirroring erstellen
create certificate cert_sqlsrv_hosting with subject='Host-Zertifikat fuer Mirroring auf Server sqlsrv_hosting'
, start_date='01.01.2011', expiry_date='31.12.2050'

-- Anzeigen aller Zertifikate / cert_sqlsrv_hosting muss in Liste auftauchen !!
select * from sys.certificates

-- neuen Endpunkt generieren fuer Mirroring
-- Authentifizierung laeuft ueber vorher generiertes Zertifikat
go 
CREATE ENDPOINT [Mirroring] 
	STATE=STARTED
	AS TCP (LISTENER_PORT = 5022, LISTENER_IP = ALL)
	FOR DATA_MIRRORING (ROLE = ALL, AUTHENTICATION = Certificate cert_sqlsrv_hosting, ENCRYPTION = DISABLED/*REQUIRED ALGORITHM RC4*/)
GO

-- Backup vom erstellten Zertifikat
backup certificate cert_sqlsrv_hosting to file='z:\cert_sqlsrv_hosting.crt'