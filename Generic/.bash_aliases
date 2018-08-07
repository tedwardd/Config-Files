alias weechat=weechat-curses
alias tv=terminal_velocity
alias cd..="cd .."
alias rdesk="rdesktop -g 1024x768"
alias fleet="/Users/twood/git-work/fleetutil/fleet"
alias tmuxinator="/Users/twood/.tmux/plugins/tmuxinator/bin/tmuxinator"
alias co="git checkout"
alias checkout="git checkout"
alias rum="git fetch upstream master && git rebase upstream/master"
alias grump="git fetch upstream master && git rebase upstream/master && git push"
alias newb="git co -b"
alias brd="git br -d"
alias m="mosh --server='env LD_PRELOAD=libutempter.so.0 mosh-server'"
alias v="nvim"
alias vim="PYENV_VERSION=system nvim"
alias c="pbcopy"
alias rtv="rtv --enable-media"
alias shred="gshred"
alias git="hub"
alias centos="docker run -it dockerfactory.rsglab.com/rsg/centos/7/base:7.4.1708-cf0ceb2 /bin/bash"
alias ls="ls -G"

# For the love of God use interactive mode
alias rebase="git rebase -i $@"

# Fix for issue mentioned here - https://github.com/yyuu/pyenv/issues/106
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"

# Aliases for work VPN and Mac quirk workarounds
alias dns="sudo killall -HUP mDNSResponder"
alias vpnoff='sudo kill -INT `cat ~/.openconnect/pid`; sudo route delete 205.201.132.5; sudo route delete 205.201.132.4'
alias vpnst="ps -ef | grep [o]penconnect"
alias vpnreset="vpnoff; sudo ifconfig en0 down; sudo ifconfig en0 up; sleep 5; dns"

#alias nb="newsbeuter"
alias nb="newsboat -r"
alias kimp="mplayer http://172.22.25.99:8000/listen"

alias Ag='pm;ag --ignore=vendor --ignore=forge/ --ignore=modules/role/files/mailchimp/kb/redirects/mc_articles --ignore=modules/role/files/kb/redirects/mc_articles --ignore=modules/powermta/files/conf.d/mc_discard.conf --ignore=modules/role/files/mailchimp/blogs/redirects/rewrites --ignore=modules/powermta/files/conf.d/domains_isp.conf --ignore=modules/powermta/files/conf.d/smtp_pattern_list.conf --ignore=modules/powermta/files/conf.d/mandrill_auto_priority.conf'

# Workaround for contacts in tmux
alias contacts='reattach-to-user-namespace contacts'

# set ssh-agent timeout
alias ssh-add='ssh-add -t 30m'

# Kubectl aliases
alias katl='kubectl config use-context cluster1.prod'
alias ks='kubectl config use-context cluster1.stage'
alias ksuw='kubectl config use-context cluster2.prod'
alias kl="kubectl config use-context local"
alias kubeseal="kubeseal --cert=$HOME/tmp/cert.pem"
alias drain="kubectl drain --ignore-daemonsets"

alias dtl="devtool-local"
alias dt="devtool"

# For working on remote stuff
alias comchess="ssh elw@tty.sdf.org comchess"
alias tootstream="ssh elw@ma.sdf.org -t 'bash -l -c tootstream'"

# Digital Ocean Shortcuts
alias dospaces="s3cmd -c $HOME/nyc3"

# SSH agent for OSX
alias ssh-add="ssh-add -K"
