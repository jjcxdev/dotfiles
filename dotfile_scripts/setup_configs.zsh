
#!/usr/bin/env zsh

# Define the path to the dotfiles repo
REPO_DIR="$HOME/.config/dotfiles/" # Corrected typo in directory name
REPO_URL="https://github.com/jjcxdev/dotfiles.git" # Ensure .git at the end for clarity

# Attempt to clone the dotfiles repo
if [[ ! -d "$REPO_DIR" ]]; then
    echo "Cloning dotfiles repo..."
    git clone $REPO_URL $REPO_DIR
else 
    echo "Dotfiles repo already exists. Pulling changes..."
    cd $REPO_DIR && git pull origin main # Corrected to use 'cd' to change directory
fi

# Function to backup and update configs
backup_and_update() {
    local src=$1
    local dest=$2 # Corrected typo 'locla' to 'local'

    # Backup existing config
    if[[ -e $dest ]]; then
        local backup_dest="${dest}.backup"
        echo "Backing up existing configs: $dest -> $backup_dest"
        mv "$dest" "$backup_dest" # Corrected missing $ before variable name
    fi

    # Update with new config
    echo "Updating config: $src -> $dest"
    cp -r "$src" "$dest"
}

# Backup and setup config
echo "Setting up zsh config..."
backup_and_update "$REPO_DIR/zshrc/.zshrc" "$HOME/.zshrc"

echo "Setting up neovim config..." # Corrected typo 'nevom' to 'neovim'
backup_and_update "$REPO_DIR/nvim" "$HOME/.config/nvim"

echo "Setting up WezTerm config..."
backup_and_update "$REPO_DIR/wezterm/.wezterm.lua" "$HOME/.wezterm.lua"

echo "Setting up Kitty config..."
backup_and_update "$REPO_DIR/kitty" "$HOME/.config/kitty"

echo "Setting up dotfile scripts..."
backup_and_update "$REPO_DIR/dotfile_scripts" "$HOME/.config/dotfile_scripts"

echo "Configs updated."
