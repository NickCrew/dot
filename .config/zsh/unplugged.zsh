 
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
  ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.local/share/zsh/plugins}

  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh:
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
  ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.local/share/zsh/plugins}

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
  ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.local/share/zsh/plugins}

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
  ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.local/share/zsh/plugins}
  autoload -U zrecompile
  local f

  for f in $ZPLUGINDIR/**/*.zsh{,-theme}(N); do
    zrecompile -pq "$f"
  done
}


##: rc-compile
##:
##: just a simple function to recompile all ZSH RC files
function rc-compile {
  autoload -U zrecompile
  local f

  # *.zsh files
  for f in $ZDOTDIR/**/*.zsh{,-theme}(N); do
    zrecompile -pq "$f"
  done

  # .z* files
  for f in .zshrc, .zprofile, .zlogin; do
    if [[ -f $ZDOTDIR/$f ]]; then
      zrecompile -pq "$ZDOTDIR/$f"
    fi
  done

  # zshenv
  if [[ -f $HOME/.zshenv ]]; then
    zrecompile -pq "$HOME/.zshenv"
  fi
}

##: zwc-clean
##:
##: Cleanup *.zwc.old files
function zwc-clean {
  rm -f "${ZDOTDIR}/**/*.zwc.old*"
  rm -f "${ZPLUGINDIR}/**/*.zwc.old*"
  rm -f "${HOME}/*.zwc.old*"
}


##: rc-source
##:
##: source rc files
##:
##: Example: 
##:    rc-source rc.d aliases completion
function rc-source () {
  if [[ -d $ZDOTDIR/$1 ]]; then
    srcdir=$ZDOTDIR/$1
    shift 1
  else
    srcdir=$ZDOTDIR
  fi

  for f in $@; do
    if [[ -f "$srcdir/$f".zsh ]]; then
      source "$srcdir/$f".zsh
    else
      >&2 echo "No such file: $srcdir/$f.zsh"
    fi
  done
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

