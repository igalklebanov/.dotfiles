if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# -- dotfiles --

if [[ ":$PATH:" != *":$HOME/.dotfiles:"* ]]; then
    export PATH="$HOME/.dotfiles:$PATH"
fi

# -- homebrew --

eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# -- fzf --

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# -- opencode --

if [[ ":$PATH:" != *":$HOME/.opencode/bin:"* ]]; then
    export PATH="$HOME/.opencode/bin:$PATH"
fi

# -- vs code --

export EDITOR='code --wait'
export VISUAL='code --wait'

# -- orbstack --

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
