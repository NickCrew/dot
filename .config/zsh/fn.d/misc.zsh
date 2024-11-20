#=========================================
# name: omz-info
# synopsis: List oh-my-zsh plugins
#----------------------------------------
function omz-info () {
  omz_plugins="${ZPLUGINDIR}/ohmyzsh/plugins"
  preview_cmd="bat $omz_plugins/{}/README.md"
  ls "$omz_plugins" | fzf --preview="$preview_cmd"
}


#=========================================
# name: omz-load
# synopsis: Load oh-my-zsh plugin
#----------------------------------------
function omz-load () {
  plug=$(omz-info)
  source $ZPLUGINDIR/ohmyzsh/plugins/$plug/$plug.plugin.zsh
}


#=========================================
# name: show-256-colors
# synopsis: Show all colors
#----------------------------------------
function show-256-colors () { for i in {0..255}; do printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"; done; }


