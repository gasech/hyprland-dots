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
plug "zap-zsh/atmachine-prompt"

# zsh
plug "esc/conda-zsh-completion"

# alias
alias zshconfig="lvim ~/.zshrc"
alias hyprconfig="lvim ~/.config/hypr/hyprland.conf"
alias lvimconfig='lvim ~/.config/lvim/config.lua'

alias cat='bat'
alias nvim='lvim'

alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'

alias ls="exa -la --icons"
alias lst="exa -a --icons --tree -I .git"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
