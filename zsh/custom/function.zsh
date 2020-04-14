# simple encryption
function blow() {
  [ -z "$1" ] && echo 'Encrypt: blow FILE' && return 1
  openssl bf-cbc -salt -in "$1" -out "$1.bf"
}

function fish() {
  test -z "$1" -o -z "$2" && echo \
    'Decrypt: fish INFILE OUTFILE' && return 1
    openssl bf-cbc -d -salt -in "$1" -out "$2"
}

# ps tools
function p_cpu() {
  ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu \
    | sed '/^ 0.0 /d' | pr -TW$COLUMNS
}

function p_mem() {
  ps -e -orss=,args= | sort -b -k1,1n | pr -TW$COLUMNS
}

function p_user() { 
  ps aux | grep "^$USER" | pr -TW$COLUMNS; 
}

psgrep() {
  if [ ! -z $1 ] ; then
    echo "Grepping for processes matching $1..."
    ps aux | grep $1 | grep -v grep
  else
    echo "!! Need name to grep for"
  fi
}

#extract
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)	tar xjf $1		;;
      *.tar.gz)	tar xzf $1		;;
      *.bz2)		bunzip2 $1		;;
      *.gz)		gunzip $1		;;
      *.tar)		tar xf $1		;;
      *.rar)		unrar x $1		;;
      *.tbz2)		tar xjf $1		;;
      *.tgz)		tar xzf $1		;;
      *.zip)		unzip $1		;;
      *.Z)		uncompress $1	;;
      *.xz)		xz -d $1	;;
      *)			echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

backup () {
	cp $1 $2/`basename $1`-`date +%Y%m%d%H%M`.backup
}

# git diff without vim
function git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R -
}
