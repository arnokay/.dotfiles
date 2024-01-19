#!/bin/bash

echo "Installing NeoVim..."

# Remove previous NeoVim installation
sudo rm -f /usr/local/bin/nvim

# Download NeoVim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

# Make it executable
chmod u+x nvim.appimage

# Move it to a directory in your PATH
sudo mv nvim.appimage /usr/local/bin/nvim

# Check if installation was successful
if command -v nvim &> /dev/null; then
    echo "NeoVim installed successfully."
else
    echo "Failed to install NeoVim. Please check the installation steps."
    exit 1
fi

echo "Finished installing NeoVim."
