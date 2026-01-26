#!/bin/bash
set -e

echo "=========================================="
echo "Installing Singularity Viewer dependencies..."
echo "=========================================="

# Install required dependencies
sudo apt-get update
sudo apt-get install -y \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libglu1-mesa \
    libegl1-mesa \
    libegl1 \
    libglvnd0 \
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
    libvorbisfile3 \
    libvorbis0a \
    libvorbisenc2 \
    libgtk2.0-0 \
    mesa-utils \
    wget \
    xterm

# Download Singularity Viewer if not already present
if [ ! -d "/workspaces/Singularity_1_8_9_8338_x86_64" ]; then
    echo "Downloading Singularity Viewer v1.8.9.8338..."
    cd /workspaces
    wget -q https://github.com/singularity-viewer/SingularityViewer/releases/download/sv-1.8.9.8338-release/Singularity_1_8_9_8338_x86_64.tar.xz
    
    echo "Extracting Singularity Viewer..."
    tar -xf Singularity_1_8_9_8338_x86_64.tar.xz
    rm -f Singularity_1_8_9_8338_x86_64.tar.xz
    
    echo "✓ Singularity Viewer installed successfully!"
else
    echo "✓ Singularity Viewer already installed, skipping download"
fi

echo "=========================================="
echo "Setup complete!"
echo "=========================================="
fi

echo "=========================================="
echo "Setup complete!"
echo "=========================================="
