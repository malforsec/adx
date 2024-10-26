::prereqs are lightingest and make sure the zip archives are placed in the current directory e.g logs.zip and others
Set Database=LockBit2024
Set Cluster="https://ingest-kvc-cbegp6zgnwg2jcun6m.northeurope.kusto.windows.net;Federated=true"
"c:\Program Files\7-Zip\7z.exe" e logs.zip
mkdir powershell
mkdir sysmon
mkdir terminalservices
mkdir system
mkdir security
mkdir mdatp
mkdir suricata
mdir zeek
move *powershell*zip powershell
move *sysmon*zip sysmon
move *terminalservices*zip terminalservices
move *system*zip system
move *security*zip security
move *mdatp*zip mdatp
move *alert*zip suricata
move *zeek*zip zeek
del *.zip
cd powershell
"c:\Program Files\7-Zip\7z.exe" e *.zip -pinfected
..\LightIngest %Cluster% -database:%Database% -table:zeventraw -sourcePath:. -format:json -mappingRef:eventPowershellJsonMapping -pattern:*.json -interactive:false
del *.zip
cd ..\system
"c:\Program Files\7-Zip\7z.exe" e *.zip -pinfected
..\LightIngest %Cluster% -database:%Database% -table:zeventraw -sourcePath:. -format:json -mappingRef:eventSystemJsonMapping -pattern:*.json -interactive:false
del *.zip
cd ..\security
"c:\Program Files\7-Zip\7z.exe" e *.zip -pinfected
..\LightIngest %Cluster% -database:%Database% -table:zeventraw -sourcePath:. -format:json -mappingRef:eventSecurityJsonMapping -pattern:*.json -interactive:false
del *.zip
cd ..\terminalservices
"c:\Program Files\7-Zip\7z.exe" e *.zip -pinfected
..\LightIngest %Cluster% -database:%Database% -table:zeventraw -sourcePath:. -format:json -mappingRef:eventSecurityJsonMapping -pattern:*.json -interactive:false
del *.zip
cd ..\sysmon
"c:\Program Files\7-Zip\7z.exe" e *.zip -pinfected
..\LightIngest %Cluster% -database:%Database% -table:zsysmonraw -sourcePath:. -format:json -mappingRef:sysmonJsonMapping -pattern:*.json -interactive:false
del *.zip
cd ..\mdatp
"c:\Program Files\7-Zip\7z.exe" e *.zip -pinfected
..\LightIngest %Cluster% -database:%Database% -table:zmdatpraw -sourcePath:. -format:csv -mappingRef:mdatpCsvMapping -pattern:*.csv -additionalProperties:ignoreFirstRecord=true -interactive:false
del *.zip
cd ..\suricata
"c:\Program Files\7-Zip\7z.exe" e *.zip -pinfected
..\LightIngest %Cluster% -database:%Database% -table:zsuricataraw -sourcePath:. -format:json -mappingRef:suricataJsonMapping -pattern:*.json -interactive:false
del *.zip
