FROM mcr.microsoft.com/devcontainers/universal:2

# Install .NET Runtime (Adjust version if 0.9.3.0 specifically requires an older one like 6.0)
USER root
RUN apt-get update && apt-get install -y dotnet-sdk-8.0

# Ensure the script is executable when the container builds
COPY . /workspaces/rembrow
RUN chmod +x /workspaces/rembrow/start_osgrid.sh

USER codespace