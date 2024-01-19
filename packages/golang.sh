#!/bin/bash

# Define the Go version
GO_VERSION="1.17.6"
ARCH="linux-amd64"

echo "Removing existing Go installation..."
# Remove existing Go installation
sudo rm -rf /usr/local/go

echo "Installing Go..."

# Download Go
curl -LO https://golang.org/dl/go$GO_VERSION.$ARCH.tar.gz

# Extract and install Go
sudo tar -C /usr/local -xvf go$GO_VERSION.$ARCH.tar.gz

# Check if installation was successful
if command -v go &> /dev/null; then
    echo "Go $GO_VERSION installed successfully."
else
    echo "Failed to install Go. Please check the installation steps."
    exit 1
fi

# Clean up downloaded archive
rm go$GO_VERSION.$ARCH.tar.gz

echo "Finished installing Go."
