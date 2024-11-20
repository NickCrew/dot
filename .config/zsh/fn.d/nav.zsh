#=========================================
# name: d
# synopsis: Directory Navigation
#----------------------------------------
function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}

#=========================================
# name: hashdir
# synopsis: 
#----------------------------------------
function hashdir() {
    [ -z "$1" ] && echo "Pass hash to use for dir" && return 1
    if [[ ! -d $ZSH_HASH_DIR ]]; then
      mkdir -p $ZSH_HASH_DIR
    fi
    hash -d "$1"="$(pwd)"
    echo hash -d "$1"=\""$(pwd)"\" >> $ZSH_HASH_DIR
}


#=========================================
# name:  take
# synopsis: Make directory and cd it
#----------------------------------------
function take () { mkdir -p "$1" && cd "$1" }


#=========================================
# name: Navigate to project root
# synopsis: top
#----------------------------------------
function top () { cd "$(git rev-parse --show-toplevel 2>/dev/null)" }



#=========================================
# name:: jj
# synopsis:Navigate to project under this dir 
#----------------------------------------
function jj () {
    cd "${1:-.}/$(find . -maxdepth 5 -type d -name .git | sed 's|/.git$||' | fzf --preview 'tree -L 2 ./{}')"
}



#=========================================
# name: tmp
# synopsis: Create temp directory
#----------------------------------------
function tmp () {
    [ "$1" = "view" ] && cd /tmp/workspaces && cd $(ls -t | fzf --preview 'ls -A {}') && return 0
    r="/tmp/workspaces/$(xxd -l3 -ps /dev/urandom)"
    mkdir -p -p "$r" && pushd "$r"
}


