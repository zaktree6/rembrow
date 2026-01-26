#!/bin/bash

echo ""
echo "=========================================="
echo "🚀 Starting Singularity Viewer..."
echo "=========================================="
echo ""

# Wait for desktop environment to be ready
sleep 5

# Start Singularity Viewer
if [ -d "/workspaces/Singularity_1_8_9_8338_x86_64" ]; then
    cd /workspaces/Singularity_1_8_9_8338_x86_64
    DISPLAY=:1 ./singularity &
    
    echo "✓ Singularity Viewer is starting!"
    echo ""
    echo "📺 Click 'Open in Browser' on port 6080 to access the viewer"
    echo "🔑 VNC Password: coolvl"
    echo ""
    echo "⏱️  IMPORTANT: Codespace will auto-stop after 15 minutes of inactivity"
    echo ""
    echo "=========================================="
else
    echo "❌ ERROR: Singularity Viewer not found!"
    echo "Try rebuilding the container."
fi
