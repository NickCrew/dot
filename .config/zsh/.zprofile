# ----------------------------------------------
# File: 
#   $ZDOTDIR/.zprofile (*)
#
# Availability :
#   ☑ Interactive Shellsⁱ
#   ☑ Non-interactive Shells
#
# Load Order:    
#     zprofile* →  zshrc → zlogin
#
# ------------------------------------------------------------------------------

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/plugins/pyenv-virtualenv/shims:$PATH"
eval "$(pyenv init --no-rehash -)"
eval "$(pyenv virtualenv-init -)"

