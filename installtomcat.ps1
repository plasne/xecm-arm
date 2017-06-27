
# download
$wc = New-Object System.Net.WebClient
$wc.DownloadFile("http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.15/bin/apache-tomcat-8.5.15-windows-x64.zip", "C:\temp\apache-tomcat-8.5.15-windows-x64.zip")

# unzip
$shell = New-Object -com shell.application;
$zip = $shell.NameSpace("c:\temp\apache-tomcat-8.5.15-windows-x64.zip");
$dest = $shell.NameSpace('c:\temp');
$dest.CopyHere($zip.items());

# install
cd c:\temp\apache-tomcat-8.5.15\bin
service.bat install

# startup
Start-Service -DisplayName "Apache Tomcat 8.5 Tomcat8"