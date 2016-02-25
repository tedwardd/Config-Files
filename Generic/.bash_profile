# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.bash_func ]; then
  . ~/.bash_func
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# User specific environment and startup programs

PATH=$HOME/.tmux/plugins/tmuxinator/bin:$PATH:$HOME/.local/bin:$HOME/bin

export PATH

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

eval "$(hub alias -s)"
export PIP_REQUIRE_VIRTUALENV=true
if which pyenv > /dev/null; then
    eval "$(/usr/local/bin/pyenv init -)";
    eval "$(/usr/local/bin/pyenv virtualenv-init -)";
fi
