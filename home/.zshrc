alias cat='bat'
alias dotfiles='code ~/.dotfiles'
alias find='fd'
alias grep='rg'
alias ll='eza -lbhF --icons --git --sort=modified'
alias ls='eza --icons --git --group-directories-first'
alias npm='sfw npm'
alias npx='sfw npx'
alias pnpm='sfw pnpm'
alias pnpx='sfw pnpx'
alias top='btop'
alias tree='eza --tree --icons'
alias yarn='sfw yarn'

# --- zsh ---

autoload -Uz compinit && compinit

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

# --- direnv ---

eval "$(direnv hook zsh)"

# --- fnm ---

command -v fnm &>/dev/null && eval "$(fnm env --use-on-cd)"

# --- fzf ---

source <(fzf --zsh)

# --- zoxide ---

eval "$(zoxide init zsh --cmd cd)"
