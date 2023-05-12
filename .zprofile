#!/bin/sh


export PATH="/Users/anm/Library/Python/$(python3 --version | cut -d ' ' -f 2 | cut -d '.' -f 1,2)/bin:$PATH"

# Default programs
export EDITOR="nvim"
export BROWSER="firefox"

# ~/ Clean-up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xinitrc"
export STARSHIP_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/starship/starship.toml"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export PYTHONSTARTUP="${XDG_CONFIG_HOME:-$HOME/.config}/python/.pythonrc"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"

export CARGO_HOME="$XDG_DATA_HOME"/cargo 

# Histfiles
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export SHELL_SESSIONS_DISABLE=1
export LESSHISTFILE="-"

# Other program settings

# Disable Bold font when using exa
export EXA_COLORS=di=34:bd=33:cd=33:so=31:ex=32:ur=33:uw=31:ux=32:ue=32:uu=33:gu=33:lc=31:df=32:sn=32:nb=32:nk=32:nm=32:ng=32:nt=32

# Fix fork error with python
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
