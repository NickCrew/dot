#
# minimal plugin and file loader
#

function zload () { 
   if [[ -f "${1}" ]]; then
     source "${1}"
   else
     echo "${1} not found."
   fi
 }

function zload-plug () { 
  for e in $@; do
    zload "${XDG_DATA_HOME:-$HOME/.local/share}/zsh/${ZPLUG_DIR_NAME:-plugins}/${e}/${e}.plugin.zsh"
  done
}

function zload-omz () { 
  ZPLUG_DIR_NAME=omz/plugins zload-plug $@ 
}

function zload-rc () { 
  for e in $@; do 
    zload "${ZDOTDIR}/zshrc.d/${e}.zsh" 
  done
}


