export TERMINAL=gnome-terminal
export EDITOR=vim

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "/usr/local/heroku/bin" ]; then
    PATH="/usr/local/heroku/bin:$PATH"
fi

[ -z "$TMUX" ] && export TERM=xterm-256color
