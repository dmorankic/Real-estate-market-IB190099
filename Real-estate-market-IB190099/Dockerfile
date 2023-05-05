#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Real-estate-market-IB190099/Real-estate-market-IB190099.csproj", "Real-estate-market-IB190099/"]
RUN dotnet restore "Real-estate-market-IB190099/Real-estate-market-IB190099.csproj"
COPY . .
WORKDIR "/src/Real-estate-market-IB190099"
RUN dotnet build "Real-estate-market-IB190099.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Real-estate-market-IB190099.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Real-estate-market-IB190099.dll"]