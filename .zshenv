# +--- Environment ---+


# Environment variable
export LANG=ja_JP.UTF-8

# Set Jenv PATH
if which jenv > /dev/null; then
  # JENV_ROOTがemptyの場合、'${HOME}/.jenv'がrootと設定される
  export JENV_ROOT=/usr/local/var/jenv
  eval "$(jenv init -)"
fi

# Set nodebrew PATH
export PATH=$PATH:/Users/yk/.nodebrew/current/bin
# add android-sdk PATH
export PATH=$PATH:/Users/yk/Library/Android/sdk/platform-tools

# Set Go path
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Set Flutter path
export FLUTTERPATH="$HOME/Framework/flutter"
export PATH="$PATH:$FLUTTERPATH/bin"

# Set SDKMAN path
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/yk/.sdkman"
[[ -s "/Users/yk/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/yk/.sdkman/bin/sdkman-init.sh"
