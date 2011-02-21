if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

export PS1='\n[\033[33m\u\033[0m @ \033[35m\H\033[0m] [\033[32m\w\033[0m]\033[34m$(__git_ps1)\033[0m\n\d \t [\#:\j]$ '
export EDITOR=emacs
export PATH=/usr/local/bin:$PATH
export CLICOLOR=1

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

function project {
  PROJECT_BASE=~/code
  if [ "$1" ]; then
    PROJECT=$PROJECT_BASE/$1
    if [ -d $PROJECT ]; then
      touch $PROJECT_BASE/$1
    elif [ $1 = "list" ]; then
      echo
      echo "Projects"
      echo
      ls -t1 $PROJECT_BASE
      return 0
    else
      echo "No project $1"
      return -1
    fi
  fi
  cd $PROJECT_BASE/`ls -t1 $PROJECT_BASE|head -n1`
}
project

alias emacs="emacsclient -nw"
alias emacsclient="emacs -nw"
alias t="ruby -Itest"
