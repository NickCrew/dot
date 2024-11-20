#=========================================
# name: rgr 
# synopsis: Find files by name
#----------------------------------------
function rgf () { rg --files | fzf --preview "bat --style=numbers --color=always {}"; }


#=========================================
# name: search-from-top
# synopsis: Search from top
#----------------------------------------
function search-from-top () {
  cd "$(git rev-parse --show-toplevel 2>/dev/null)"
  fzf-cd-widget
}

#=========================================
# name: find-port-process
# synopsis: Find process using port (requires sudo)
#----------------------------------------
function find-port-process () { 
  if [[ -z "$1" ]]; then
      echo "USAGE: find-port-process <PORT>"
      exit 1
  fi

  port=$1
  pid=$(sudo lsof -nP -i4TCP:${port} | grep LISTEN | awk '{print $2}')

  if [[ -z $pid ]]; then
      echo "No process found using port $port"
  else
      ps -p $pid
  fi
}
