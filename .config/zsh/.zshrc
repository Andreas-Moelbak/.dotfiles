unsetopt BEEP

if [[ -d "$HOME/.local/share/zsh-completions/src" ]]
then
    fpath=($HOME/.local/share/zsh-completions/src $fpath)
fi

if [[ -d "$HOME/.local/bin" ]]
then
    export PATH=$HOME/.local/bin:$PATH
fi

export LESSHISTFILE=/dev/null

# Aliases
if command -v python3 &> /dev/null
then
    alias python="python3"
fi

if command -v nvim &> /dev/null
then
    alias vim="nvim"
fi

if command -v exa &> /dev/null 
then
    alias ls="exa --icons"
    alias la="exa --icons -la"
    alias ll="exa --icons -l"
fi

if command -v git &> /dev/null 
then
    alias gs="git status"
    alias ga="git add"
    alias gc="git commit"
    alias gp="git push"
    # Alias config for use with bare .dotfiles repo
    alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
fi

if command -v gcc-12 &> /dev/null
then
    export CC=gcc-12
fi

# Automatically cd into typed directory
setopt autocd

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Enable VI-mode
bindkey -v

# Use vim keys in tab complete menu.
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char

# Curser block/beam mapping
function zle-keymap-select () {
    case $KEYMAP in vicmd) echo -ne '\e[1 q';; #Block
    viins|main) echo -ne '\e[5 q';; #beam
    esac
}

zle -N zle-keymap-select

zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}

# Source venvs
sovs_env() {
    VENV=$(fd . -d 1 $HOME/venv | xargs basename | fzf)
    DIR="$HOME/venv/$VENV/bin/activate"
    source $DIR
    if zle; then
      zle reset-prompt
    fi
}
zle -N sovs_env
bindkey '^u' sovs_env

# fzf cd from ~
fdcd() {
    local dir
    dir=$(
        cd && fd -0 --type d --ignore-file ~/.config/fd/ignore --hidden | fzf --read0
    ) && cd ~/$dir || return
    if zle; then
      zle reset-prompt
    fi
}
zle -N fdcd
bindkey '^o' fdcd

#tmux-sessionizer() "$HOME/.local/bin/tmux-sessionizer"
tmux-sessionizer() "$HOME/.local/bin/tsesh"
zle -N tmux-sessionizer
bindkey '^a' tmux-sessionizer

# Initialize starship prompt
eval "$(starship init zsh)"

# Syntax highlighting
if [[ -f "$HOME/.local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]
then
    source $HOME/.local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
