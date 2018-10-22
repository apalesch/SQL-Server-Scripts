-- Outbound Verbindung auf Principal erstellen
--
--
use master
go 
-- Master-Key fuer Master-Datenbank erzeugen
-- wird benutzt um nachfolgendes Zertifikat zu verschluesseln
-- !! jede Datenbank kann nur einen Master-Key haben !!
create master key encryption by password='<ultrageheimes passwort>'

-- Zeritifkat fuer Mirroring erstellen
-- Start und Expire-Date einstellen
create certificate cert_sqlsrv_dmz with subject='Host-Zertifikat fuer Mirroring auf Server sqlsrv_dmz'
, start_date='01.01.2011', expiry_date='31.12.2050'

-- Anzeigen aller Zertifikate / cert_sqlsrv_dmz muss in Liste auftauchen !!
select * from sys.certificates

-- neuen Endpunkt generieren fuer Mirroring
-- Authentifizierung laeuft ueber vorher generiertes Zertifikat
-- Port muss offen sein
go 
CREATE ENDPOINT [Mirroring] 
	STATE=STARTED
	AS TCP (LISTENER_PORT = 5022, LISTENER_IP = ALL)
	FOR DATABASE_MIRRORING (ROLE = ALL, AUTHENTICATION = Certificate cert_sqlsrv_dmz, ENCRYPTION = DISABLED /*REQUIRED ALGORITHM RC4*/)
GO

-- Backup vom erstellten Zertifikat für den Import auf der anderen Seite
backup certificate cert_sqlsrv_dmz to file='z:\cert_sqlsrv_dmz.crt'