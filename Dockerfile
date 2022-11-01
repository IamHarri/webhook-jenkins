# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /source
RUN apt-get install curl -y
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update -y && apt-get install nodejs -y
# copy csproj and restore as distinct layers
COPY QuickApp/*.sln .
COPY QuickApp/DAL/*.csproj ./DAL/
COPY QuickApp/QuickApp/*.csproj ./QuickApp/
RUN dotnet restore

# copy everything else and build app
COPY QuickApp/QuickApp/. ./QuickApp/
COPY QuickApp/DAL/. ./DAL/
RUN dotnet publish QuickApp.sln --configuration Release --output ./WebApi
RUN dotnet dev-certs https -ep /https/aspnetapp.pfx -p B@oL0ng@123456
RUN dotnet dev-certs https --trust

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build-env /source/WebApi .
COPY --from=build-env /https/aspnetapp.pfx /https/aspnetapp.pfx
ENTRYPOINT ["dotnet", "QuickApp.dll"]
