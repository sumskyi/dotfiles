# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler gem git git-flow heroku node npm rails3 rake rvm)

source $ZSH/oh-my-zsh.sh

[[ -s "$HOME/.alias" ]] && . "$HOME/.alias"
unset RUBYOPT
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM.

PATH="/opt/oracle-jdk-bin-1.7.0.17/bin:$PATH"
PATH="/usr/local/heroku/bin:$PATH"
PATH="/home/vlad/local/bin:$PATH"
PATH="/home/vlad/bin:$PATH"
PATH="/home/vlad/bin/sbt/bin:$PATH"
PATH="/home/vlad/tmp/Android/ICSRoot-Linux-1.1/adt-bundle-linux-x86_64-20130219/sdk/platform-tools:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export RBXOPT=-X19
export TERMINAL=gnome-terminal
export RACK_ENV=development

[ -z "$TMUX" ] && export TERM=xterm-256color
