#!/bin/bash

DOTFILES_PATH="$HOME/.dotfiles"
PACKAGES="$DOTFILES_PATH/packages"
REQUIREMENTS_FILE="$PACKAGES/packages.txt"
STOW_FOLDERS_FILE="stow_folders.txt"

prompt_user() {
  read -p "$1 (y/n): " response
  case "$response" in
    [yY])
      return 0 ;;
    *)
      return 1 ;;
  esac
}

execute_scripts() {
  scripts_folder="$1"

  if [ -d "$scripts_folder" ]; then
    for script in "$scripts_folder"/*.sh; do
      chmod +x "$script"
      if [ -x "$script" ]; then
        echo "Executing script: $script"
        source "$script"
      fi
    done
  fi
}

cd "$DOTFILES_PATH"


# Create symlinks using stow
if [ ! -f "$STOW_FOLDERS_FILE" ]; then
  echo "Error: $STOW_FOLDERS_FILE not found."
  exit 1
fi

while IFS= read -r folder; do
  if [ -n "$folder" ]; then
    stow -D "$folder"
    stow "$folder"
    echo "Symlinks for $folder created."
  fi
done < "$STOW_FOLDERS_FILE"

# Install required packages and tools
if [ -f "$REQUIREMENTS_FILE" ]; then
  if prompt_user "Do you want to install all required packages and tools?"; then
    while IFS= read -r package; do
      if ! command -v "$package" &> /dev/null; then
        sudo apt install -y "$package"
      else
        echo "$package is already installed."
      fi
    done < "$REQUIREMENTS_FILE"
  else
    echo "Skipping installation of required packages and tools."
  fi
else
  echo "Error: Missing requirements file."
  echo "Required file: $REQUIREMENTS_FILE"
  exit 1
fi

# Execute scripts from the 'packages' folder
if prompt_user "Do you want to execute custom package installation scripts?"; then
  execute_scripts $PACKAGES
else
  echo "Skipping execution of custom package installation"
fi

source "$HOME/.zshrc"

echo "Installation completed."
