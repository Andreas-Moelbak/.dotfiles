#!/bin/sh


export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"


# Default programs
export EDITOR="nvim"
export TERMINAL="st"
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
export LESSHISTFILE="-"

# Other program settings
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

# Disable Bold font when using exa
export EXA_COLORS=di=34:bd=33:cd=33:so=31:ex=32:ur=33:uw=31:ux=32:ue=32:uu=33:gu=33:lc=31:df=32:sn=32:nb=32:nk=32:nm=32:ng=32:nt=32

if [[ $OSTYPE == "linux-gnu" ]]; then
    if command -v startx &> /dev/null; then
        if command -v pacman &> /dev/null; then
            if pacman -Qs libxft-bgra >/dev/null 2>&1; then
                # Start graphical server on user's current tty if not already running.
                [ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
            else
                echo "\033[31mIMPORTANT\033[0m: Note that \033[32m\`libxft-bgra\`\033[0m must be installed for this build of dwm.
            #Please run:
            #	\033[32myay -S libxft-bgra-git\033[0m
            #and replace \`libxft\`. Afterwards, you may start the graphical server by running \`startx\`."
            fi
        fi
    fi
fi
