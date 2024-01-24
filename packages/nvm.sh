#!/bin/bash

echo "Installing NVM..."

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

if command -v nvm &> /dev/null; then
    echo "NVM installed successfully."
else
    echo "Failed to install NVM. Please check the installation steps."
    exit 1
fi

echo "Finished installing NVM."
