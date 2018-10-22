restore database Mirror_Test from disk='z:\Mirror_Test\mirror_test.bak' with norecovery, file=1
restore log Mirror_Test  from disk='z:\Mirror_Test\mirror_test.bak' with norecovery, file=2
--restore headeronly from disk='z:\Mirror_Test\mirror_test.bak'