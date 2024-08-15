# User configuration

# Set the correct PATH for Node.js LTS version
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/node@20/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@20/include"

# Prompt context for Starship
prompt_context() {
  prompt_segment black default "%(!.%{%F{yellow}%}.)jjcx"
}

# Initialize Starship
eval "$(starship init zsh)"

# Aliases for backup and setup scripts
alias backup='~/backup_configs/backup_configs.zsh'
alias setup='~/backup_configs/setup_configs.zsh'

# rbenv configuration
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Terminal options
# List directories in single column
alias ls='ls -la --color=auto -F'
