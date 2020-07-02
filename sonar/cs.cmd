cd csproj

SonarScanner.MSBuild begin /key:"GrpcService" /name:"GrpcService" /version:"1.0"

"C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\MSBuild.exe" /t:rebuild

SonarScanner.MSBuild end

pause