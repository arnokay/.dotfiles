#!/bin/bash

echo "Installing NeoVim..."

# Remove NeoVim from common locations
sudo rm -f /usr/local/bin/nvim
sudo rm -f /usr/bin/nvim
sudo rm -f /opt/nvim

# Download NeoVim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

# Make it executable
chmod u+x nvim.appimage

# Extract the AppImage
./nvim.appimage --appimage-extract

# Check if extraction was successful
if [ -d squashfs-root ]; then
    echo "NeoVim extracted successfully."
else
    echo "Failed to extract NeoVim. Please check the installation steps."
    exit 1
fi

# Optional: Display NeoVim version
./squashfs-root/AppRun --version

# Optional: Expose NeoVim globally
sudo mv squashfs-root /opt/nvim
sudo ln -s /opt/nvim/AppRun /usr/local/bin/nvim

# Check if installation was successful
if command -v nvim &> /dev/null; then
    echo "NeoVim installed successfully."
else
    echo "Failed to install NeoVim. Please check the installation steps."
    exit 1
fi

echo "Finished installing NeoVim."
