export PATH="$HOME/.local/bin:$PATH"

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# supercharge  
plug "zap-zsh/supercharge"

# exa (always use it after supercharge)
plug "zap-zsh/exa"

# auto suggestions
plug "zsh-users/zsh-autosuggestions"

# syntax highlight
plug "zsh-users/zsh-syntax-highlighting" "122dc46"

# zap prompt (theme)
plug "gasech/simplest-prompt"

# zsh completion
plug "esc/conda-zsh-completion"

# alias
alias zshc="lvim ~/.zshrc"
alias hyprc="lvim ~/.config/hypr/hyprland.conf"
alias lvimc='lvim ~/.config/lvim/config.lua'
alias notes='lvim ~/Documents/notes.md'
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias ls="exa -la --icons"
alias lst="exa -a --icons --tree -I .git"



# bun completions
[ -s "/home/gab/.bun/_bun" ] && source "/home/gab/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
