# +--- Environment ---+


# Environment variable
export LANG=ja_JP.UTF-8

# add /usr/local/bin to PATH
export PATH="/usr/local/bin:$PATH"

# Set nodebrew PATH
export PATH=$PATH:$HOME/.nodebrew/current/bin

# add android-sdk PATH
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

# Set Go path
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Set Flutter path
export FLUTTERPATH="$HOME/Framework/flutter"
export PATH="$PATH:$FLUTTERPATH/bin"

# Set Jenv PATH
if which jenv > /dev/null; then
  # JENV_ROOTがemptyの場合、'${HOME}/.jenv'がrootと設定される
  export JENV_ROOT=/usr/local/var/jenv
  eval "$(jenv init -)"
fi

# Set pyenv Path
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Set rbenv Path
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"

# Set SDKMAN path
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
