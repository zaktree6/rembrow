#!/bin/bash
# Get the current Tailscale IP
TS_IP=$(tailscale ip -4)

# Automatically update Regions.ini with the current IP
cat <<EOT > /workspaces/rembrow/opensim-0.9.3.0/bin/Regions/Regions.ini
[zakcode]
RegionUUID = 3ab6f229-fd50-4187-8e1d-a6a6181f56d9
Location = 1000,1000
InternalAddress = 0.0.0.0
InternalPort = 9000
AllowAlternatePorts = False
ExternalHostName = $TS_IP
EOT

echo "------------------------------------------"
echo "🚀 AUTO-CONFIGURED FOR YOUR LAPTOP"
echo "TAILSCALE IP: $TS_IP"
echo "VIEWER LOGIN URI: http://$TS_IP:9000"
echo "------------------------------------------"

cd /workspaces/rembrow/opensim-0.9.3.0/bin
dotnet OpenSim.dll
