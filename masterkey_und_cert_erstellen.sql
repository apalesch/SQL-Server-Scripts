use master
go 
-- Master-Key fuer Master-Datenbank erzeugen
-- wird benutzt um nachfolgendes Zertifikat zu verschluesseln
create master key encryption by password='01F25D63-8992-4E69-B22A-48CE9FD8AD12'

-- Zeritifkat fuer Mirroring erstellen
create certificate cert_sqlsrv_dmz with subject='Host-Zertifikat fuer Mirroring auf Server sqlsrv_dmz'

-- Anzeigen aller Zertifikate / cert_sqlsrv_dmz muss in Liste auftauchen !!
select * from sys.certificates

-- neuen Endpunkt generieren fuer Mirroring
-- Authentifizierung laeuft ueber vorher generiertes Zertifikat
CREATE ENDPOINT [Mirroring] 
	STATE=STARTED
	AS TCP (LISTENER_PORT = 5022, LISTENER_IP = ALL)
	FOR DATA_MIRRORING (ROLE = ALL, AUTHENTICATION = Certificate cert_sqlsrv_dmz, ENCRYPTION = REQUIRED ALGORITHM RC4)
GO

-- Backup vom erstellten Zertifikat
backup certificate cert_sqlsrv_dmz to file='z:\cert_sqlsrv_dmz.crt'