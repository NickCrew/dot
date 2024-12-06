 
#
# minimal plugin and file loader
#

#================================================================================

#=================================================
# Manage Plugins (3rd party)
#
# Functions:
#     plugin-load, plugin-clone, plugin-source, plugin-compile
#------------------------------------------------

##: plugin-load
##:
##: clone a plugin, identify its init file, source it, 
##: and add it to your fpath.
function plugin-load {
  local repo plugdir initfile initfiles=()
  ${ZPLUGINDIR:=${ZDOTDIR:-~/.config/zsh}/plugins}

  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules \
        https://github.com/$repo $plugdir
    fi

    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) || { echo >&2 "No init file '$repo'." && continue }
      ln -sf $initfiles[1] $initfile
    fi

    fpath+=$plugdir
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}


##: plugin-clone
##:
##: declare a simple plugin-clone function, 
##: leaving the user to source plugins themselves
function plugin-clone {
  local repo plugdir initfile initfiles=()
  ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules \
        https://github.com/$repo $plugdir
    fi

    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) && ln -sf $initfiles[1] $initfile
    fi
  done
}


##: plugin-souce
##:
##: now, plugin-source is a separate thing
function plugin-source {
  local plugdir
  ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

  for plugdir in $@; do
    [[ $plugdir = /* ]] || plugdir=$ZPLUGINDIR/$plugdir
    fpath+=$plugdir
    local initfile=$plugdir/${plugdir:t}.plugin.zsh
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}


##: plugin-compile
##:
##: just a simple function to recompile all plugins
function plugin-compile {
  ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
  autoload -U zrecompile
  local f

  for f in $ZPLUGINDIR/**/*.zsh{,-theme}(N); do
    zrecompile -pq "$f"
  done
}



#=================================================
# Manage RC Files
#
# Functions:
#     rc-compile
#------------------------------------------------

##: rc-compile
##:
##: just a simple function to recompile all plugins
function rc-compile {
  ZSHRCD=${ZSHRCD:-$ZDOTDIR/rc.d}
  autoload -U zrecompile
  local f

  for f in $ZSHRCD/*.zsh{,-theme}(N); do
    zrecompile -pq "$f"
  done
}

##: rc-source
##:
##: source all files in rc.d
function rc-source () {
  ZSHRCD=${ZSHRCD:-$ZDOTDIR/rc.d}
  for f in $@; do
    if [[ -f $ZSHRCD/$f.zsh ]]; then
      source $ZSHRCD/$f.zsh
    else
      >&2 echo "No such file: $ZSHRCD/$f.zsh"
    fi
  done
 }

##: rc-edit
##:
##: Edit Config Files
function rcedit ()    { 
  local app=$1
  local rcfile=${2:-config}
  local rcdir="${XDG_CONFIG_HOME:-$HOME/.config}"
  local cachedir="${XDG_CACHE_HOME:-$HOME/.cache}/rcedits/${app}"
  local backupfilename=${rcfile}.$(date +%Y%m%d%H%M%S)
  local backupfilepath="${cachedir}/${backupfilename}"
  local rceditor=${EDITOR:-nvim}
  here=$(pwd)
  cd "${rcdir}/${app}"
  mkdir -p "${cachedir}"
  cp "${rcfile}" "${backupfilepath}"
  ${rceditor} "${rcfile}"    
  cd "${here}"
}

#=================================================
# Oh-my-zsh helpers
#
# Functions:
#     omz-info, omz-load, omz-read
#------------------------------------------------

##: omz-info
##:
##: List oh-my-zsh plugins
function omz-info () {
  omz_plugins="${ZPLUGINDIR}/ohmyzsh/plugins"
  preview_cmd="bat $omz_plugins/{}/README.md"
  ls "$omz_plugins" | fzf --preview="$preview_cmd"
}

##: omz-load
##:
##: Load oh-my-zsh plugin
function omz-load () {
  plug=$(omz-info)
  source $ZPLUGINDIR/ohmyzsh/plugins/$plug/$plug.plugin.zsh
}

##: omz-read
##:
##: Read oh-my-zsh plugin README
function omz-read () {
  plug=$(omz-info)
  source $ZPLUGINDIR/ohmyzsh/plugins/$plug/README.md
}

alias rcedit-wezterm="rcedit wezterm wezterm.lua"
alias rcedit-zsh="rcedit zsh .zshrc"
alias rcedit-git="rcedit git config"
alias rcedit-p10k="rcedit zsh p10k.zsh"
alias rcedit-nvim="rcedit nvim init.lua"


