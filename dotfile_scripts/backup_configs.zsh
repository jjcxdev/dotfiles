#!/usr/bin/env zsh

# Define paths of existing config locations
ZSHRC_CONFIG="$HOME/.zshrc"
NVIM_CONFIG="$HOME/.config/nvim"
WEZTERM_CONFIG="$HOME/.wezterm.lua"
KITTY_SRC="$HOME/.config/kitty"
SCRIPTS_SRC="$HOME/.config/dotfile_scripts"

# Define backup locations within Git repo
BACKUP_DIR="$HOME/.config/dotfiles"
ZSHRC_BACKUP="$BACKUP_DIR/zshrc/"
NVIM_BACKUP="$BACKUP_DIR/nvim/"
WEZTERM_BACKUP="$BACKUP_DIR/wezterm/"
KITTY_BACKUP="$BACKUP_DIR/kitty/"
SCRIPTS_BACKUP="$BACKUP_DIR/dotfile_scripts/"

# Ensure backup directories exist
mkdir -p $ZSHRC_BACKUP
mkdir -p $NVIM_BACKUP
mkdir -p $WEZTERM_BACKUP
mkdir -p $KITTY_BACKUP
mkdir -p $SCRIPTS_BACKUP

# Backup .zshrc config
cp $ZSHRC_CONFIG $ZSHRC_BACKUP/.zshrc

# Sync Neovim config
rsync -avh --delete $NVIM_CONFIG/ $NVIM_BACKUP

# Sync WezTerm config
cp $WEZTERM_CONFIG $WEZTERM_BACKUP/.wezterm.lua

# Sync Kitty config
rsync -avh --delete $KITTY_SRC/ $KITTY_BACKUP

# Sync dotfile scripts
rsync -avh --delete $SCRIPTS_SRC/ $SCRIPTS_BACKUP

# Navigate to backup directory
cd $BACKUP_DIR

# Git operation
git add .
git commit -m "Auto-Updated configs backup"
git push origin main
