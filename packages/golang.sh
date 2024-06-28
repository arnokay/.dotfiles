#!/bin/bash

GO_VERSION="1.21.6"
ARCH="linux-amd64"

echo "Removing existing Go installation..."
sudo rm -rf /usr/local/go

echo "Installing Go..."

curl -LO https://golang.org/dl/go$GO_VERSION.$ARCH.tar.gz

sudo tar -C /usr/local -xvf go$GO_VERSION.$ARCH.tar.gz

if command -v go &> /dev/null; then
    echo "Go $GO_VERSION installed successfully."
else
    echo "Failed to install Go. Please check the installation steps."
    exit 1
fi

rm go$GO_VERSION.$ARCH.tar.gz

echo "Finished installing Go."
