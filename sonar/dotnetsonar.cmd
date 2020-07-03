cd csproj
dotnet sonarscanner  begin /key:"GrpcService" /name:"GrpcService" /version:"1.0"
dotnet build
dotnet sonarscanner end
pause