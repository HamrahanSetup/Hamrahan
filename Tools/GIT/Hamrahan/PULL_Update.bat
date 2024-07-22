@d:
@mkdir HS_BBU
@sqlcmd -S . -U AccessTable -P 123 -d master -i %USERPROFILE%\U.sql
@sqlcmd -S .\GOHAR -U AccessTable -P 123 -d master -i %USERPROFILE%\U.sql
@sqlcmd -S .\HAMRAHANSYSTEM -U AccessTable -P 123 -d master -i %USERPROFILE%\U.sql
@TASKKILL /F /IM HamrahanSystem.exe
@d:
@cd D:\Data\Costumer\HS_Kasra\Exe && takeown /F PULL_Update.bat
@cd D:\Data\Costumer\HS_Kasra\Exe && git pull 
@cd D:\Data\Costumer\HS_Kasra\Exe && start update_hamrahan.exe
