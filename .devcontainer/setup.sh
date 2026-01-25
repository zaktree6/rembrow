#!/bin/bash
set -e

echo "=========================================="
echo "Installing Cool VL Viewer dependencies..."
echo "=========================================="

# Install required dependencies
sudo apt-get update
sudo apt-get install -y \
    libgl1-mesa-glx \
    libglu1-mesa \
    libopenal1 \
    libfreetype6 \
    libxrender1 \
    libfontconfig1 \
    libxrandr2 \
    libxinerama1 \
    libxi6 \
    libxcursor1 \
    libsdl2-2.0-0 \
    libuuid1 \
    libdbus-1-3 \
    wget \
    xterm

# Download Cool VL Viewer if not already present
if [ ! -d "/workspaces/cool_vl_viewer" ]; then
    echo "Downloading Cool VL Viewer v1.32.4.19..."
    cd /workspaces
    wget -q http://sldev.free.fr/binaries/CoolVLViewer-1.32.4.19-Linux-x86_64-Setup
    chmod +x CoolVLViewer-1.32.4.19-Linux-x86_64-Setup
    
    echo "Extracting Cool VL Viewer..."
    ./CoolVLViewer-1.32.4.19-Linux-x86_64-Setup --prefix /workspaces --mode unattended
    rm -f CoolVLViewer-1.32.4.19-Linux-x86_64-Setup
    
    echo "✓ Cool VL Viewer installed successfully!"
else
    echo "✓ Cool VL Viewer already installed, skipping download"
fi

echo "=========================================="
echo "Setup complete!"
echo "=========================================="
