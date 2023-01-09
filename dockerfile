FROM ubuntu:jammy
COPY . /etc/funcapp
WORKDIR /etc/funcapp
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    wget && \
    wget "https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb" -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y \
    aspnetcore-runtime-6.0=6.0.8-1 \
    azure-functions-core-tools-4 \
    dotnet-apphost-pack-6.0=6.0.8-1 \
    dotnet-host=6.0.8-1 \
    dotnet-hostfxr-6.0=6.0.8-1 \
    dotnet-runtime-6.0=6.0.8-1 \
    dotnet-sdk-6.0=6.0.400-1 \
    dotnet-targeting-pack-6.0=6.0.8-1 && \
    dotnet restore
CMD ["func", "host", "start"]