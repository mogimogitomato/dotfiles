# +--- Environment ---+


# Environment variable
export LANG=ja_JP.UTF-8

# add /usr/local/bin to PATH
export PATH="/usr/local/bin:$PATH"

# Set nodebrew PATH
export PATH=$PATH:$HOME/.nodebrew/current/bin

# Set Go path
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Set rbenv Path
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
