#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
reset="\e[0m"

echo "Making executables..."

# BSPWM
chmod +x config/bspwm
# POLYBAR
chmod +x config/polybar/launch.sh 
# ZSH
mv zshrc .zshrc & mv .zshrc ~
echo -e "${GREEN}Downloading zsh dependencies${reset}"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/marlonrichert/zsh-autocomplete ~/.zsh/zsh-autocomplete
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
# CONKY
chmod +c config/conkyx-start.sh
# NVIM
curl -fLo ~/.config/nvim/plugged/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo -e "vi-plug is managing nvim plugins, run :PlugInstall on vim/nvim to install them"

echo -e "${CYAN}DONE${reset}"

echo "moving files to ~/.config"
# MOVE TO ~/.CONFIG
mv config/* ~/.config

echo -e "${CYAN}DONE${reset}"
echo "Everything ready, you may now delete this folder and log in bspwm" 
