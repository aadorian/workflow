#!/bin/bash

# Setup script to install cwltool and build RO-Crate

set -e

echo "Setting up CWL workflow environment..."

# Check if cwltool is installed
if ! python3 -m cwltool --version >/dev/null 2>&1; then
    echo "Installing cwltool..."
    pip3 install --user cwltool
else
    echo "cwltool is already installed"
fi

# Build RO-Crate
echo "Building RO-Crate..."
npm run ro-crate:build

echo "✅ Setup complete!"

