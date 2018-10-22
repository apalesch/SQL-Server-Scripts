-- alle Befehle m�ssen am Principal ausgef�hrt werden!!

-- synchrones Mirroring
alter database mirror_test set partner safety full

-- asynchrones Mirroring
alter database mirror_test set partner safety off 

-- failover wird durchgef�hrt
alter database mirror_test set partner failover 

-- mirroring anhalten (BSP: Updates, SPs etc)
alter database mirror_test set partner suspend

 -- mirroring fortsetzen (BSP: Updates, SPs etc)
alter database mirror_test set partner resume

-- mirroring abschalten
alter database mirror_test set partner off 

-- mirroring-timeout auf 20s setzen
alter database mirror_test set partner timeout 20 

