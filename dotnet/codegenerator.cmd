#Generate a web api controller which bind to model and dbcontext.

dotnet aspnet-codegenerator controller -name WeatherController -async -api -m WebApi.Models.WeatherForecast -dc WebApi.Data.ApiDbContext -outdir Controllers
