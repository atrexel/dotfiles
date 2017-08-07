#!bin/bash/

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="verbose"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

export PS1='\[\e[0;32m\]\u@\h \[\e[0;33m\]\W\[\e[0;35m\]$(__git_ps1) \[\e[0;34m\]\$\[\e[0m\] '

export CLICOLOR=1
export LSCOLORS="exfxbxdxcxexexabagacad"

export NLS_LANG="English_Australia.UTF8"
