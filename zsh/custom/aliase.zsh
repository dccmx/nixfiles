alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias add='git add'
alias push='git push'
alias pull='git pull'
alias status='git status'
alias checkout='git checkout'
alias commit='git commit -a -m'
alias pretty-json='python -m json.tool'

if [[ $OSTYPE == linux-gnu ]]; then
  alias ls='ls -hp --color'
  alias ll='ls -l --color'
  alias la='ls -A --color'
  alias l='ls --color'
elif [[ $OSTYPE == darwin* ]]; then
  alias ls='ls -Gp'
  alias ll='ls -l'
  alias la='ls -A'
  alias l='ls'
fi

alias tree='tree -C'

alias back='cd $OLDPWD'
alias cd..='cd ..'
alias df='df -h'
alias du='du -h -c'
alias mkdir='mkdir -p -v'
alias ..='cd ..'

alias grep='grep --color=auto'
alias ncmpc='ncmpc -c'
alias daemons='ls /var/run/daemons'
alias ping='ping -c 5'
alias more='less'

alias pgrep="pgrep -l"
alias recent="ls -lAt | head"
alias Xdefaults="xrdb -load ~/.Xdefaults"

# package management
if [[ $OSTYPE == linux-gnu ]]; then
  alias update='sudo apt-get update'
  alias install='sudo apt-get install'
  alias remove='sudo apt-get remove'
  alias upgrade='sudo apt-get upgrade'
elif [[ $OSTYPE == darwin* ]]; then
  alias update='brew update'
  alias install='brew install'
  alias remove='brew remove'
  alias upgrade='brew upgrade'
fi

alias info='info --vi-keys'

alias c='clear'

alias home='cd ~'

alias httpserver='python -m SimpleHTTPServer'
