export PATH="$HOME/.local/bin:$PATH"

# zap setup & plugins 
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting" "122dc46"
plug "gasech/simplest-prompt"
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

# pomodoro shotout to bashbunni, requirements: 
# - yay -S lolcat timer-bin

declare -A pomo_options
pomo_options["work"]="45"
pomo_options["break"]="10"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  fi
}

alias work="pomodoro 'work'"
alias rest="pomodoro 'break'"

# bun completions
[ -s "/home/gab/.bun/_bun" ] && source "/home/gab/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
