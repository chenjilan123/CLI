cd csproj

SonarScanner.MSBuild begin /key:"GrpcService" /name:"GrpcService" /version:"1.0"

MSBuild.exe /t:rebuild

SonarScanner.MSBuild end

pause