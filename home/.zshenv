export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# reverse the following. TODO: need to do this check for all PATH changes
if ! [[ -v SOURCE_RVM_SCRIPTS ]]; then
  export PATH="$PATH":"$HOME/.pub-cache/bin"
  export PATH="$PATH:$HOME/.rvm/bin"
  export PATH="/opt/homebrew/opt/ruby@2.7/bin:$PATH"
  export PATH="/opt/homebrew/lib/ruby/gems/2.7.0/bin:$PATH"
  export PATH="$HOME/work/utilities/scripts:$PATH"
  export SOURCE_RVM_SCRIPTS=1
fi
