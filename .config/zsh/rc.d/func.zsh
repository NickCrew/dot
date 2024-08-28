#
# ZSH Functions
#

# Directory Navigation
function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}

# Hash directory
function hashdir() {
    [ -z "$1" ] && echo "Pass hash to use for dir" && return 1
    if [[ ! -d $ZSH_HASH_DIR ]]; then
      mkdir -p $ZSH_HASH_DIR
    fi
    hash -d "$1"="$(pwd)"
    echo hash -d "$1"=\""$(pwd)"\" >> $ZSH_HASH_DIR
}


# Make directory and cd it
function take () { mkdir -p "$1" && cd "$1" }


# Navigate to project root
function top () { cd "$(git rev-parse --show-toplevel 2>/dev/null)" }


# Navigate to project under this dir
function jj () {
    cd "${1:-.}/$(find . -maxdepth 5 -type d -name .git | sed 's|/.git$||' | fzf --preview 'tree -L 2 ./{}')"
}


# Create temp directory
function tmp () {
    [ "$1" = "view" ] && cd /tmp/workspaces && cd $(ls -t | fzf --preview 'ls -A {}') && return 0
    r="/tmp/workspaces/$(xxd -l3 -ps /dev/urandom)"
    mkdir -p -p "$r" && pushd "$r"
}


# Edit Config Files
function edit-conf-nvim () { cd ~/.config/nvim; $EDITOR init.lua; cd -; }
function edit-conf-zsh () { cd ~/.config/zsh; $EDITOR .zshrc; cd -; }
function edit-conf-wezterm () { cd ~/.config/wezterm; $EDITOR wezterm.lua; cd -; }
function edit-conf-git () { cd ~/.config/git; $EDITOR config; cd -; }
function edit-conf-zprompt () { 
  cp -f ~/.p10k.zsh ~/.p10k.zsh.bak
  $EDITOR ~/.p10k.zsh 
  exec zsh
}

# Show all colors
function show-256-colors () { for i in {0..255}; do printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"; done; }

# Find files by name
function rgf () { rg --files | fzf --preview "bat --style=numbers --color=always {}"; }

# Find process using port (requires sudo)
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

function tf-lint () {
  tflint --chdir="${1:-.}" --config="${2:-$HOME/.tflint.hcl}" 
}

function omz-info () {
  cat "$HOME/.local/share/zsh/omz/plugins/$(ls ~/.local/share/zsh/omz/plugins | fzf)/README.md"
}

function search-from-top () {
  cd "$(git rev-parse --show-toplevel 2>/dev/null)"
  fzf-cd-widget
}

