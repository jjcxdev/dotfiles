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
mkdir -p "$ZSHRC_BACKUP" "$NVIM_BACKUP" "$WEZTERM_BACKUP" "$KITTY_BACKUP" "$SCRIPTS_BACKUP"

# Backup .zshrc config
cp "$ZSHRC_CONFIG" "$ZSHRC_BACKUP/.zshrc" || { echo "Failed to backup .zshrc"; exit 1; }

# Sync Neovim config
rsync -avh --delete "$NVIM_CONFIG/" "$NVIM_BACKUP" || { echo "Failed to sync Neovim config"; exit 1; }

# Sync WezTerm config
cp "$WEZTERM_CONFIG" "$WEZTERM_BACKUP/.wezterm.lua" || { echo "Failed to backup WezTerm config"; exit 1; }

# Sync Kitty config
rsync -avh --delete "$KITTY_SRC/" "$KITTY_BACKUP" || { echo "Failed to sync Kitty config"; exit 1; }

# Sync dotfile scripts
rsync -avh --delete "$SCRIPTS_SRC/" "$SCRIPTS_BACKUP" || { echo "Failed to sync dotfile scripts"; exit 1; }

# Navigate to backup directory
cd "$BACKUP_DIR" || { echo "Failed to navigate to backup directory"; exit 1; }

# Git operations with check for changes
if [[ -n $(git status --porcelain) ]]; then
    git add .
    git commit -m "Auto-Updated configs backup"
    git push origin main || { echo "Failed to push changes to Git"; exit 1; }
else
    echo "No changes to commit."
fi
