
cd %~dp0

net stop "MsDtsServer110"
gacutil.exe /u "ICSharpCode.SharpZipLib"
gacutil.exe /u ProgettoMultimedia.TaskUnZip_2012
rem gacutil.exe /u Microsoft.SqlServer.DTSRuntimeWrap

copy "ICSharpCode.SharpZipLib.dll" "%ProgramFiles%\Microsoft SQL Server\110\DTS\Tasks\" /Y
copy "ProgettoMultimedia.TaskUnZip_2012.*" "%ProgramFiles%\Microsoft SQL Server\110\DTS\Tasks\" /Y

copy "ICSharpCode.SharpZipLib.dll" "%ProgramFiles% (x86)\Microsoft SQL Server\110\DTS\Tasks\" /Y
copy "ProgettoMultimedia.TaskUnZip_2012.*" "%ProgramFiles% (x86)\Microsoft SQL Server\110\DTS\Tasks\" /Y

gacutil.exe /f /i "%ProgramFiles%\Microsoft SQL Server\110\DTS\Tasks\ICSharpCode.SharpZipLib.dll"
gacutil.exe /f /i "%ProgramFiles%\Microsoft SQL Server\110\DTS\Tasks\ProgettoMultimedia.TaskUnZip_2012.dll"
net start "MsDtsServer110"
pause


