#!/bin/bash

echo "Installing Oh My Zsh..."

if [ ! -d "$HOME/.oh-my-zsh" ]; then  
  # installing oh-my-zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  
  # updating after installation
  source "$HOME/.zshrc"
else
  echo "Skipping installation of Oh My Zsh."
fi
 
# installing plugins
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions"${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
else
  echo "zsh-autosuggestions plugin is already installed."
fi
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git"${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
else
  echo "zsh-syntax-highlighting plugin is already installed."
fi

# updating after plugins
source "$HOME/.zshrc"

echo "Finished installing Oh My Zsh."
