
# create the temp directory
mkdir c:\temp

# download JRE
$wc = New-Object System.Net.WebClient
$wc.DownloadFile("https://xecmsfdc.blob.core.windows.net/installmedia/jre-8u66-windows-x64.exe?sr=b&sv=2016-05-31&ss=b&srt=o&sp=r&se=2018-05-26T21:12:10Z&st=2017-05-26T13:12:10Z&spr=https&sig=nWcCh76qWjyoGB6uOfIprdNe9hw2HJ5c5bpRc6Y7HBw%3D","C:\temp\jre-8u66-windows-x64.exe")

# install the JRE
$proc1 = Start-Process -FilePath "C:\temp\jre-8u66-windows-x64.exe" -ArgumentList "/s REBOOT=ReallySuppress" -Wait -PassThru
$proc1.waitForExit()

# set the JRE_HOME
[Environment]::SetEnvironmentVariable("JRE_HOME", "c:\program files\java\jre1.8.0_66")

# download Tomcat 8
$wc = New-Object System.Net.WebClient
$wc.DownloadFile("http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.15/bin/apache-tomcat-8.5.15-windows-x64.zip", "C:\temp\apache-tomcat-8.5.15-windows-x64.zip")

# unzip Tomcat
$shell = New-Object -com shell.application;
$zip = $shell.NameSpace("c:\temp\apache-tomcat-8.5.15-windows-x64.zip");
$dest = $shell.NameSpace("c:\program files");
$dest.CopyHere($zip.items());

# install Tomcat
cd "c:\program files\apache-tomcat-8.5.15\bin"
service.bat install

# startup Tomcat service
Start-Service -DisplayName "Apache Tomcat 8.5 Tomcat8"