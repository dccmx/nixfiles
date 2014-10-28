if [[ $OSTYPE == linux-gnu ]]; then
  if [ -f "$HOME/.profile.linux" ]; then
    . "$HOME/.profile.linux"
  fi
elif [[ $OSTYPE == darwin* ]]; then
  if [ -f "$HOME/.profile.mac" ]; then
    . "$HOME/.profile.mac"
  fi
fi


if [ -f "$HOME/.profile.local" ]; then
  . "$HOME/.profile.local"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

export LANG=en_US.UTF-8
