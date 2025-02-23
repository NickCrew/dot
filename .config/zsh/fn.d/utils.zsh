#
# Miscellaneous utility functions
#

# name: find-port-process
# synopsis: Find process using port (requires sudo)
function find-port-process () { 
  local port
  local pid
  port=$1
  pid=$(sudo lsof -nP -i4TCP:${port} | grep LISTEN | awk '{print $2}')
  if [[ -z $pid ]]; then
      echo "No process found using port $port"
  else
      ps -p $pid
  fi
}

# name: color-table
# synopsis: show all 256 colors
function color-table () {
  for i in {0..255};
    do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; 
  done
}


function emarks () {
  ${EDITOR:-nvim} "$HOME/.pathmarks"
}


#
function dots () {
  git \
    --git-dir="${DOTSDIR:-$HOME/.dots.git}" \
    --work-tree=$HOME \
    "$@"
}

function  dots-init () {

  git clone \
    --bare ${DOTS_HTTP_URL:-https://github.com/NickCrew/dots.git} \
    -b ${DOTS_BRANCH:-main} "${DOTS_DIR:-$HOME/.dots.git}"

  dots config status.showUntrackedFiles no

  dots checkout
}
