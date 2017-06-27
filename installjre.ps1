mkdir c:\temp
$wc = New-Object System.Net.WebClient
$wc.DownloadFile("https://xecmsfdc.blob.core.windows.net/installmedia/jre-8u66-windows-x64.exe?sr=b&sv=2016-05-31&ss=b&srt=o&sp=r&se=2018-05-26T21:12:10Z&st=2017-05-26T13:12:10Z&spr=https&sig=nWcCh76qWjyoGB6uOfIprdNe9hw2HJ5c5bpRc6Y7HBw%3D","C:\temp\jre-8u66-windows-x64.exe")
$proc1 = Start-Process -FilePath "C:\temp\jre-8u66-windows-x64.exe" -ArgumentList "/s REBOOT=ReallySuppress" -Wait -PassThru
$proc1.waitForExit()
[Environment]::SetEnvironmentVariable("JRE_HOME", "c:\program files\java\jre1.8.0_66")