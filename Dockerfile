FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 5184
ENV ASPNETCORE_URLS=http://+:5291

RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["OpenChessEngineAPI/OpenChessEngineAPI.csproj", "OpenChessEngineAPI/"]
RUN dotnet restore "OpenChessEngineAPI/OpenChessEngineAPI.csproj"
COPY . .
WORKDIR "/src/OpenChessEngineAPI"
RUN dotnet build "OpenChessEngineAPI.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "OpenChessEngineAPI.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "OpenChessEngineAPI.dll"]
