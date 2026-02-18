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
