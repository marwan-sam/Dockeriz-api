FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["DotnetApiDocker.csproj", "./"]
RUN dotnet restore "DotnetApiDocker.csproj"
COPY . .
RUN dotnet build "DotnetApiDocker.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DotnetApiDocker.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DotnetApiDocker.dll"]
