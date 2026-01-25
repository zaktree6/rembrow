#!/bin/bash

echo ""
echo "=========================================="
echo "🚀 Starting Cool VL Viewer..."
echo "=========================================="
echo ""

# Wait for desktop environment to be ready
sleep 5

# Start Cool VL Viewer
if [ -d "/workspaces/cool_vl_viewer" ]; then
    cd /workspaces/cool_vl_viewer
    DISPLAY=:1 ./cool_vl_viewer &
    
    echo "✓ Cool VL Viewer is starting!"
    echo ""
    echo "📺 Click 'Open in Browser' on port 6080 to access the viewer"
    echo "🔑 VNC Password: coolvl"
    echo ""
    echo "⏱️  IMPORTANT: Stop your Codespace when done!"
    echo "   Run: ./stop-codespace.sh"
    echo "   Or: gh codespace stop"
    echo ""
    echo "=========================================="
else
    echo "❌ ERROR: Cool VL Viewer not found!"
    echo "Try rebuilding the container."
fi
