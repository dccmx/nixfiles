export PATH=/usr/local/sbin:/usr/local/bin:/usr/local/go/bin:~/.bin:$PATH
GODEP=`godep path 2>/dev/null`
if [ -n "$GODEP" ]; then
  export GOPATH=$GODEP:$GOPATH
fi
export GOPATH=/usr/local/go:$GOPATH
export TERM=xterm-256color
