
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


nvm() {
  echo "🚨 NVM not loaded! Loading now..."
  unset -f nvm
  export NVM_PREFIX=$(brew --prefix nvm)  [ -s "$NVM_PREFIX/nvm.sh" ] && . "$NVM_PREFIX/nvm.sh"  nvm "$@"
}



# name: d
# synopsis: Directory Navigation
function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}

# name: hashdir
# synopsis: hash directories
function hashdir () {
    [ -z "$1" ] && echo "Pass hash to use for dir" && return 1
    if [[ ! -d $ZSH_HASH_DIR ]]; then
      mkdir -p $ZSH_HASH_DIR
    fi
    hash -d "$1"="$(pwd)"
    echo hash -d "$1"=\""$(pwd)"\" >> $ZSH_HASH_DIR
}

# name: take
# synopsis: Make directory and cd it
function take () { 
  mkdir -p "$1" && cd "$1" 
}

# name: top
# synopsis: top
function top () {
  cd "$(git rev-parse --show-toplevel 2>/dev/null)" 
}

# name: jj
# synopsis: cd to git repo
function jj () {
    cd "${1:-.}/$(find . -maxdepth 5 -type d -name .git | sed 's|/.git$||' | fzf --preview 'tree -L 2 ./{}')"
}

# name: tmp
# synopsis: Create temp directory
function tmp () {
    [ "$1" = "view" ] && cd /tmp/workspaces && cd $(ls -t | fzf --preview 'ls -A {}') && return 0
    r="/tmp/workspaces/$(xxd -l3 -ps /dev/urandom)"
    mkdir -p -p "$r" && pushd "$r"
}

# name: n
# synopsis: nnn cd on exit
function n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f -- "$NNN_TMPFILE" > /dev/null
    }
}

# name: ranger
# synopsis: ranger cd on exit - changes your location when you exit with Q, :q exits normally
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

