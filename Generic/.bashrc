if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/git-work/nvm/nvm.sh ]; then
	. ~/git-work/nvm/nvm.sh
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
# For GIT
#if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
#    . /usr/share/git-core/contrib/completion/git-prompt.sh
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
	  . /usr/local/etc/bash_completion.d/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=true
    PS1='\[\e[0;32m\]\u\[\e[0m\]@\[\e[0;36m\]\h\[\e[0m\]\n\[\e[0;33m\]\w\[\e[0m\]\[\e[1;36m\]$(__git_ps1 " (%s)")\[\e[0m\] \$ '
fi
# Sometimes it's in git-core/contrib (Fedora)
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
	  . /usr/share/git-core/contrib/completion/git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=true
    PS1='\[\e[0;32m\]\u\[\e[0m\]@\[\e[0;36m\]\h\[\e[0m\]\n\[\e[0;33m\]\w\[\e[0m\]\[\e[1;36m\]$(__git_ps1 " (%s)")\[\e[0m\] \$ '
fi
export TERM=xterm-256color
export EDITOR=/usr/bin/vim

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
