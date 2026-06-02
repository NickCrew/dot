# vim: foldmethod=marker foldmarker={{{,}}}
# .zshrc
#

# Plugins (unplugged.zsh) {{{

# Functions ($ZDOTDIR/fn.d/*.zsh)
FN_FILES=(
  directories
  fzf
  utils
  zce
)

# Configuration ($ZDOTDIR/rc.d/*.zsh)
RC_FILES=(
  aliases
  completion
)

# Installed plugins
PLUGIN_REPOS=(
  ohmyzsh/ohmyzsh
  jeffreytse/zsh-vi-mode
  romkatv/powerlevel10k
  urbainvaes/fzf-marks

  bigH/git-fuzzy
  scmbreeze/scm_breeze
  unixorn/git-extra-commands
  baliestri/git-profiles.plugin.zsh

  marlonrichert/zsh-autocomplete
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  zdharma-continuum/fast-syntax-highlighting
)

# Enabled plugins
PLUGINS=(
  # zsh-vi-mod
  
  powerlevel10k

  fast-syntax-highlighting
  zsh-autocomplete
  zsh-autosuggestions
  zsh-completions

  fzf-marks
  git-extra-commands

  ohmyzsh/plugins/dotenv
  ohmyzsh/plugins/dircycle
  ohmyzsh/plugins/zoxide
  ohmyzsh/plugins/jsontools

  ohmyzsh/plugins/1password
  # ohmyzsh/plugins/aws
  ohmyzsh/plugins/gh
  # ohmyzsh/plugins/fzf

  ohmyzsh/plugins/colored-man-pages
  ohmyzsh/plugins/colorize
  ohmyzsh/plugins/ssh-agent
  ohmyzsh/plugins/fancy-ctrl-z
)
# }}}

# Paths & Environment {{{

typeset -U path


# Package management
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_NO_REQUIRE_TAP_TRUST=1
export PNPM_HOME="$HOME/.local/share/pnpm"
export NVM_DIR="$HOME/.nvm"

# ZSH function paths
fpath=(
  "${HOMEBREW_PREFIX}/share/zsh/site-functions"
  "${ZSH_CACHE_DIR}/completions"
  $fpath
)

# PATH
path=(
  "${PNPM_HOME:-$HOME/.local/share/pnpm}"
  "$HOME/.cargo/bin" 
  "$HOME/.fzf/bin" 
  "${GOHOME:-$HOME/go}/bin" 
  "$HOME/opt/bin"
  "$HOME/bin" 
  "$HOME/.local/bin" 
  "$HOME/Applications" 
  "/usr/local/sbin" 
  "/usr/local/bin"
  "${ZPLUGINDIR:-${XDG_DATA_DIR:-$HOME/.local/share/zsh/plugins}}/git-fuzzy/bin"
  "${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tools"
  $path
)

export INFOPATH="/usr/local/share/info:${XDG_DATA_HOME:-$HOME/.local/share}/info:${INFOPATH:-}"
export MANPATH="/usr/local/share/man:${XDG_DATA_HOME:-$HOME/.local/share}/man:${MANPATH:-}"

# Environment
export KEYTIMEOUT=1
export {EDITOR,VISUAL}=nvim
export {PAGER,MANPAGER}='less -R'
export FORCE_COLOR=3
# GPG
GPG_TTY=$(tty)
export GPG_TTY
# SSH
export SSH_CONFIG="$HOME/.ssh/config"
export SSH_IDENTITY="$HOME/.ssh/id_ed25519"

export CLOUDSDK_HOME=$HOME/opt/google-cloud-sdk

# ohmyzsh dotenv plugin: skip per-directory prompt (match direnv whitelist behavior)
export ZSH_DOTENV_PROMPT=false

# }}}

# Initialize  {{{

# Modules
zmodload zsh/zprof  
zmodload zsh/complist

# Vi Keybindings
bindkey -v  

# Prompt
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet  # tolerate startup stdout (direnv etc.)
if [[ -f "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source $ZDOTDIR/p10k.zsh

# Lite shell for tmux popups — skip plugins, p10k, compinit. Just aliases + prompt.
if [[ -n "$TMUX_POPUP" ]]; then
  PROMPT='%F{cyan}%~%f ❯ '
  setopt auto_cd auto_pushd extended_history hist_ignore_dups
  [[ -r $ZSHRCD/aliases.zsh ]] && source $ZSHRCD/aliases.zsh
  return
fi

# Light-weight plugin manager
source $ZDOTDIR/unplugged.zsh

# }}}

# Options  {{{

# History
setopt bang_hist                # Perform textual history expansion, csh-style, treating the character ‘!’ specially.
setopt extended_history         # Record timestamp of command in HISTFILE
setopt hist_expire_dups_first   # Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups         # Ignore duplicated commands history l
setopt hist_ignore_space        # ignore commands that start with space
setopt hist_no_functions        # Don't store function definitions
setopt hist_reduce_blanks       # Remove superfluous blanks from each command line being added to the history list
setopt hist_verify              # show command with history expansion to user before running it
setopt inc_append_History       # Add new lines to the history file immediately (do not wait until exit)
setopt share_history            # Share command history data
unsetopt hist_beep              # Shut up shut up shut up# History

# Directories
setopt auto_cd                  # Change to directory without cd 
setopt auto_pushd               # Push the old directory onto the directory stack
setopt pushd_ignore_dups        # Don't push multiple copies of the same directory onto the directory stack
setopt pushdminus               # Use pushd to rotate the stack so that the current directory is always on top

# Completion
setopt glob_complete            # show autocompletion menu with globs
setopt menu_complete            # automatically highlight first element of completion menu
setopt auto_list                # automatically list choices on ambiguous completion.
setopt complete_in_word         # complete from both ends of a word.
setopt no_list_beep             # don't beep when listing choices on ambiguous completion
setopt nocaseglob               # case-insensitive globbing
setopt auto_menu                # Show completion menu on successive tab press
setopt always_to_end
unsetopt complete_aliases       # make aliases work with completion nicely
unsetopt flowcontrol

setopt extendedglob

## }}}

# Load Config {{{

rc-source rc.d $RC_FILES     # Load config files
plugin-clone $PLUGIN_REPOS   # Install plugins
plugin-source $PLUGINS       # Load enabled plugins
rc-source fn.d $FN_FILES     # Load functions

# }}}

# Bindings {{{

bindkey "^f" zce
bindkey "^b" push-line
bindkey '^I' menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete
bindkey '^[^M' self-insert-unmeta  # Alt + Enter gives a new line
bindkey -M menuselect '^M' .accept-line
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect '^xg' clear-screen					# Clear
bindkey -M menuselect '^xi' vi-insert						# Insert
bindkey -M menuselect '^xh' accept-and-hold                	# Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  	# Next
bindkey -M menuselect '^xu' undo                           	# Undo
# This makes ← and → always move the cursor on the command line, even when you are in the menu:
bindkey -M menuselect  '^[[D' .backward-char  '^[OD' .backward-char
bindkey -M menuselect  '^[[C'  .forward-char  '^[OC'  .forward-char
# }}}

# Overrides {{{ 

# Replace standard nvm loading with this
lazy_load_nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  # Optional: load bash completion
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
# Define placeholders
nvm()  { lazy_load_nvm; nvm "$@"; }
node() { lazy_load_nvm; node "$@"; }
npm()  { lazy_load_nvm; npm "$@"; }
npx()  { lazy_load_nvm; npx "$@"; }

# FZF
FZF_COLORS="bg+:-1,border:black,fg+:white,fg:gray,header:blue,hl+:red,hl:yellow,info:green,marker:blue,pointer:red,prompt:gray,spinner:0"
export FZF_COMPLETION_TRIGGER=';;'
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height 60% --border sharp   --layout reverse --color '$FZF_COLORS' --prompt '∷ ' --pointer ▶ --marker ⇒"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
export FZF_CTRL_T_OPTS="--walker-skip .git --preview 'bat --style=numbers --color=always {}' --bind '?:toggle-preview'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls" 
export AWESOME_FZF_LOCATION="$ZSHRCD/fzf.zsh"

# }}}


[[ -f "${ZDOTDIR/local.zsh}" ]] && source "${ZDOTDIR/local.zsh}"

export LS_COLORS="*~=0;38;2;68;74;115:*.1=0;38;2;200;211;245:*.3ds=1;38;2;192;153;255:*.3fr=1;38;2;192;153;255:*.3mf=1;38;2;192;153;255:*.7z=1;38;2;255;117;127:*.CFUserTextEncoding=0;38;2;68;74;115:*.DS_Store=0;38;2;68;74;115:*.a=0;38;2;79;214;190:*.adb=0;38;2;255;199;119:*.ads=0;38;2;255;199;119:*.ai=1;38;2;192;153;255:*.aif=1;38;2;101;188;255:*.alembic=1;38;2;192;153;255:*.amf=1;38;2;192;153;255:*.ape=1;38;2;101;188;255:*.apk=1;38;2;255;117;127:*.applescript=0;38;2;255;199;119:*.ari=1;38;2;192;153;255:*.arj=1;38;2;255;117;127:*.arw=1;38;2;192;153;255:*.as=0;38;2;255;199;119:*.asa=0;38;2;255;199;119:*.asm=0;38;2;255;199;119:*.aux=0;38;2;68;74;115:*.avi=1;38;2;79;214;190:*.avif=1;38;2;192;153;255:*.awk=0;38;2;255;199;119:*.bag=1;38;2;255;117;127:*.bak=0;38;2;68;74;115:*.bash=0;38;2;255;199;119:*.bash_profile=0;38;2;255;199;119:*.bashrc=0;38;2;255;199;119:*.bat=0;38;2;79;214;190:*.bay=1;38;2;192;153;255:*.bbl=0;38;2;68;74;115:*.bc=0;38;2;68;74;115:*.bcf=0;38;2;68;74;115:*.bib=0;38;2;255;150;108:*.bin=1;38;2;255;117;127:*.blend=1;38;2;192;153;255:*.blg=0;38;2;68;74;115:*.bmp=1;38;2;192;153;255:*.braw=1;38;2;192;153;255:*.bsh=0;38;2;255;199;119:*.bst=0;38;2;255;150;108:*.bz2=1;38;2;255;117;127:*.bz=1;38;2;255;117;127:*.c++=0;38;2;255;199;119:*.c=0;38;2;255;199;119:*.cabal=0;38;2;255;199;119:*.cache=0;38;2;68;74;115:*.cap=1;38;2;192;153;255:*.cc=0;38;2;255;199;119:*.cfg=0;38;2;255;150;108:*.cgi=0;38;2;255;199;119:*.cirrus.yml=0;38;2;88;158;215:*.clang-format=0;38;2;13;185;215:*.class=0;38;2;68;74;115:*.clj=0;38;2;255;199;119:*.cmake.in=0;38;2;13;185;215:*.cmake=0;38;2;13;185;215:*.com=0;38;2;79;214;190:*.conf=0;38;2;255;150;108:*.config=0;38;2;255;150;108:*.cp=0;38;2;255;199;119:*.cpp=0;38;2;255;199;119:*.cr2=1;38;2;192;153;255:*.cr3=1;38;2;192;153;255:*.cr=0;38;2;255;199;119:*.crw=1;38;2;192;153;255:*.cs=0;38;2;255;199;119:*.css=0;38;2;255;199;119:*.csv=0;38;2;200;211;245:*.csx=0;38;2;255;199;119:*.ctags=0;38;2;68;74;115:*.cxx=0;38;2;255;199;119:*.d=0;38;2;255;199;119:*.dae=1;38;2;192;153;255:*.dart=0;38;2;255;199;119:*.data=1;38;2;192;153;255:*.db=1;38;2;255;117;127:*.dcr=1;38;2;192;153;255:*.dcs=1;38;2;192;153;255:*.deb=1;38;2;255;117;127:*.def=0;38;2;255;199;119:*.desktop=0;38;2;255;150;108:*.di=0;38;2;255;199;119:*.diff=0;38;2;255;199;119:*.dll=0;38;2;79;214;190:*.dmg=1;38;2;255;117;127:*.dng=1;38;2;192;153;255:*.doc=1;38;2;252;167;234:*.docx=1;38;2;252;167;234:*.dot=0;38;2;255;199;119:*.dox=0;38;2;13;185;215:*.dpr=0;38;2;255;199;119:*.drf=1;38;2;192;153;255:*.dxf=1;38;2;192;153;255:*.dylib=0;38;2;79;214;190:*.dyn_hi=0;38;2;68;74;115:*.dyn_o=0;38;2;68;74;115:*.editorconfig=0;38;2;13;185;215:*.eip=1;38;2;192;153;255:*.el=0;38;2;255;199;119:*.elc=0;38;2;255;199;119:*.elm=0;38;2;255;199;119:*.epp=0;38;2;255;199;119:*.eps=1;38;2;192;153;255:*.epub=1;38;2;252;167;234:*.erf=1;38;2;192;153;255:*.erl=0;38;2;255;199;119:*.ex=0;38;2;255;199;119:*.exe=0;38;2;79;214;190:*.exr=1;38;2;192;153;255:*.exs=0;38;2;255;199;119:*.fbx=1;38;2;192;153;255:*.fdb_latexmk=0;38;2;68;74;115:*.fdignore=0;38;2;13;185;215:*.fff=1;38;2;192;153;255:*.fish=0;38;2;255;199;119:*.flac=1;38;2;101;188;255:*.flake8=0;38;2;13;185;215:*.fls=0;38;2;68;74;115:*.flv=1;38;2;79;214;190:*.fnt=1;38;2;13;185;215:*.fon=1;38;2;13;185;215:*.fs=0;38;2;255;199;119:*.fsi=0;38;2;255;199;119:*.fsx=0;38;2;255;199;119:*.gcode=0;38;2;255;199;119:*.gemspec=0;38;2;13;185;215:*.gif=1;38;2;192;153;255:*.git=0;38;2;68;74;115:*.gitattributes=0;38;2;13;185;215:*.gitconfig=0;38;2;13;185;215:*.gitignore=0;38;2;13;185;215:*.gitlab-ci.yml=0;38;2;88;158;215:*.gitmodules=0;38;2;13;185;215:*.go=0;38;2;255;199;119:*.gpr=1;38;2;192;153;255:*.gradle=0;38;2;255;199;119:*.groovy=0;38;2;255;199;119:*.gv=0;38;2;255;199;119:*.gvy=0;38;2;255;199;119:*.gz=1;38;2;255;117;127:*.h++=0;38;2;255;199;119:*.h264=1;38;2;79;214;190:*.h=0;38;2;255;199;119:*.ha=0;38;2;255;199;119:*.hack=0;38;2;255;199;119:*.hda=1;38;2;192;153;255:*.heif=1;38;2;192;153;255:*.hgrc=0;38;2;13;185;215:*.hh=0;38;2;255;199;119:*.hi=0;38;2;68;74;115:*.hip=1;38;2;192;153;255:*.hpp=0;38;2;255;199;119:*.hs=0;38;2;255;199;119:*.htc=0;38;2;255;199;119:*.htm=0;38;2;200;211;245:*.html=0;38;2;200;211;245:*.hxx=0;38;2;255;199;119:*.ico=1;38;2;192;153;255:*.ics=1;38;2;252;167;234:*.idx=0;38;2;68;74;115:*.iges=1;38;2;192;153;255:*.ignore=0;38;2;13;185;215:*.igs=1;38;2;192;153;255:*.iiq=1;38;2;192;153;255:*.ilg=0;38;2;68;74;115:*.img=1;38;2;255;117;127:*.inc=0;38;2;255;199;119:*.ind=0;38;2;68;74;115:*.info=0;38;2;200;211;245:*.ini=0;38;2;255;150;108:*.inl=0;38;2;255;199;119:*.ino=0;38;2;255;199;119:*.ipp=0;38;2;255;199;119:*.ipynb=0;38;2;255;199;119:*.iso=1;38;2;255;117;127:*.jar=1;38;2;255;117;127:*.java=0;38;2;255;199;119:*.jl=0;38;2;255;199;119:*.jpeg=1;38;2;192;153;255:*.jpg=1;38;2;192;153;255:*.js=0;38;2;255;199;119:*.json=0;38;2;255;150;108:*.jsx=0;38;2;255;199;119:*.jxl=1;38;2;192;153;255:*.k25=1;38;2;192;153;255:*.kdc=1;38;2;192;153;255:*.kdevelop=0;38;2;13;185;215:*.kex=1;38;2;252;167;234:*.ko=0;38;2;79;214;190:*.kra=1;38;2;192;153;255:*.kt=0;38;2;255;199;119:*.kts=0;38;2;255;199;119:*.la=0;38;2;68;74;115:*.less=0;38;2;255;199;119:*.lisp=0;38;2;255;199;119:*.ll=0;38;2;255;199;119:*.lo=0;38;2;68;74;115:*.localized=0;38;2;68;74;115:*.lock=0;38;2;68;74;115:*.log=0;38;2;68;74;115:*.ltx=0;38;2;255;199;119:*.lua=0;38;2;255;199;119:*.m3u=1;38;2;101;188;255:*.m4a=1;38;2;101;188;255:*.m4v=1;38;2;79;214;190:*.m=0;38;2;255;199;119:*.ma=1;38;2;192;153;255:*.mailmap=0;38;2;13;185;215:*.make=0;38;2;13;185;215:*.markdown=0;38;2;200;211;245:*.matlab=0;38;2;255;199;119:*.mb=1;38;2;192;153;255:*.md=0;38;2;200;211;245:*.mdc=1;38;2;192;153;255:*.mdown=0;38;2;200;211;245:*.mef=1;38;2;192;153;255:*.mid=1;38;2;101;188;255:*.mir=0;38;2;255;199;119:*.mk=0;38;2;13;185;215:*.mkv=1;38;2;79;214;190:*.ml=0;38;2;255;199;119:*.mli=0;38;2;255;199;119:*.mn=0;38;2;255;199;119:*.mojo=0;38;2;255;199;119:*.mos=1;38;2;192;153;255:*.mov=1;38;2;79;214;190:*.mp3=1;38;2;101;188;255:*.mp4=1;38;2;79;214;190:*.mpeg=1;38;2;79;214;190:*.mpg=1;38;2;79;214;190:*.mrw=1;38;2;192;153;255:*.msi=1;38;2;255;117;127:*.mtl=1;38;2;192;153;255:*.nb=0;38;2;255;199;119:*.nef=1;38;2;192;153;255:*.nim=0;38;2;255;199;119:*.nimble=0;38;2;255;199;119:*.nims=0;38;2;255;199;119:*.nix=0;38;2;255;150;108:*.nrw=1;38;2;192;153;255:*.nu=0;38;2;255;199;119:*.o=0;38;2;68;74;115:*.obj=1;38;2;192;153;255:*.obm=1;38;2;192;153;255:*.odp=1;38;2;252;167;234:*.ods=1;38;2;252;167;234:*.odt=1;38;2;252;167;234:*.ogg=1;38;2;101;188;255:*.ogv=1;38;2;79;214;190:*.opus=1;38;2;101;188;255:*.orf=1;38;2;192;153;255:*.org=0;38;2;200;211;245:*.orig=0;38;2;68;74;115:*.otf=1;38;2;13;185;215:*.otl=1;38;2;192;153;255:*.out=0;38;2;68;74;115:*.p=0;38;2;255;199;119:*.pas=0;38;2;255;199;119:*.patch=0;38;2;255;199;119:*.pbm=1;38;2;192;153;255:*.pcx=1;38;2;192;153;255:*.pdf=1;38;2;252;167;234:*.pef=1;38;2;192;153;255:*.pgm=1;38;2;192;153;255:*.php=0;38;2;255;199;119:*.pid=0;38;2;68;74;115:*.pkg=1;38;2;255;117;127:*.pl=0;38;2;255;199;119:*.pm=0;38;2;255;199;119:*.png=1;38;2;192;153;255:*.pod=0;38;2;255;199;119:*.pp=0;38;2;255;199;119:*.ppm=1;38;2;192;153;255:*.pps=1;38;2;252;167;234:*.ppt=1;38;2;252;167;234:*.pptx=1;38;2;252;167;234:*.pro=0;38;2;13;185;215:*.prql=0;38;2;255;199;119:*.ps1=0;38;2;255;199;119:*.ps=1;38;2;252;167;234:*.psd1=0;38;2;255;199;119:*.psd=1;38;2;192;153;255:*.psm1=0;38;2;255;199;119:*.ptx=1;38;2;192;153;255:*.purs=0;38;2;255;199;119:*.pxn=1;38;2;192;153;255:*.py=0;38;2;255;199;119:*.pyc=0;38;2;68;74;115:*.pyd=0;38;2;68;74;115:*.pyo=0;38;2;68;74;115:*.qoi=1;38;2;192;153;255:*.r3d=1;38;2;192;153;255:*.r=0;38;2;255;199;119:*.raf=1;38;2;192;153;255:*.raku=0;38;2;255;199;119:*.rar=1;38;2;255;117;127:*.raw=1;38;2;192;153;255:*.rb=0;38;2;255;199;119:*.rgignore=0;38;2;13;185;215:*.rlib=0;38;2;68;74;115:*.rm=1;38;2;79;214;190:*.rmeta=0;38;2;68;74;115:*.rpm=1;38;2;255;117;127:*.rs=0;38;2;255;199;119:*.rst=0;38;2;200;211;245:*.rtf=1;38;2;252;167;234:*.rw2=1;38;2;192;153;255:*.rwl=1;38;2;192;153;255:*.rwz=1;38;2;192;153;255:*.sass=0;38;2;255;199;119:*.sbt=0;38;2;255;199;119:*.scad=0;38;2;255;199;119:*.scala=0;38;2;255;199;119:*.scons_opt=0;38;2;68;74;115:*.sconsign.dblite=0;38;2;68;74;115:*.scss=0;38;2;255;199;119:*.sh=0;38;2;255;199;119:*.shtml=0;38;2;200;211;245:*.so=0;38;2;79;214;190:*.sql=0;38;2;255;199;119:*.sr2=1;38;2;192;153;255:*.srf=1;38;2;192;153;255:*.srw=1;38;2;192;153;255:*.step=1;38;2;192;153;255:*.stl=1;38;2;192;153;255:*.stp=1;38;2;192;153;255:*.sty=0;38;2;68;74;115:*.svg=1;38;2;192;153;255:*.swf=1;38;2;79;214;190:*.swift=0;38;2;255;199;119:*.swp=0;38;2;68;74;115:*.sxi=1;38;2;252;167;234:*.sxw=1;38;2;252;167;234:*.synctex.gz=0;38;2;68;74;115:*.t=0;38;2;255;199;119:*.tar=1;38;2;255;117;127:*.tbz2=1;38;2;255;117;127:*.tbz=1;38;2;255;117;127:*.tcl=0;38;2;255;199;119:*.td=0;38;2;255;199;119:*.tex=0;38;2;255;199;119:*.tfignore=0;38;2;13;185;215:*.tga=1;38;2;192;153;255:*.tgz=1;38;2;255;117;127:*.tif=1;38;2;192;153;255:*.tiff=1;38;2;192;153;255:*.timestamp=0;38;2;68;74;115:*.tml=0;38;2;255;150;108:*.tmp=0;38;2;68;74;115:*.toast=1;38;2;255;117;127:*.toc=0;38;2;68;74;115:*.toml=0;38;2;255;150;108:*.travis.yml=0;38;2;88;158;215:*.ts=0;38;2;255;199;119:*.tsx=0;38;2;255;199;119:*.ttf=1;38;2;13;185;215:*.txt=0;38;2;200;211;245:*.typ=0;38;2;200;211;245:*.ui=0;38;2;255;150;108:*.usd=1;38;2;192;153;255:*.usda=1;38;2;192;153;255:*.usdc=1;38;2;192;153;255:*.usdz=1;38;2;192;153;255:*.v=0;38;2;255;199;119:*.vb=0;38;2;255;199;119:*.vcd=1;38;2;255;117;127:*.vim=0;38;2;255;199;119:*.vob=1;38;2;79;214;190:*.vsh=0;38;2;255;199;119:*.wav=1;38;2;101;188;255:*.webm=1;38;2;79;214;190:*.webmanifest=0;38;2;255;150;108:*.webp=1;38;2;192;153;255:*.wma=1;38;2;101;188;255:*.wmv=1;38;2;79;214;190:*.woff2=1;38;2;13;185;215:*.woff=1;38;2;13;185;215:*.wrl=1;38;2;192;153;255:*.wv=1;38;2;101;188;255:*.x3d=1;38;2;192;153;255:*.x3f=1;38;2;192;153;255:*.xbps=1;38;2;255;117;127:*.xhtml=0;38;2;200;211;245:*.xlr=1;38;2;252;167;234:*.xls=1;38;2;252;167;234:*.xlsx=1;38;2;252;167;234:*.xml=0;38;2;200;211;245:*.xmp=0;38;2;255;150;108:*.xpm=1;38;2;192;153;255:*.xvf=1;38;2;192;153;255:*.xz=1;38;2;255;117;127:*.yaml=0;38;2;255;150;108:*.yml=0;38;2;255;150;108:*.z=1;38;2;255;117;127:*.zig=0;38;2;255;199;119:*.zip=1;38;2;255;117;127:*.zsh=0;38;2;255;199;119:*.zst=1;38;2;255;117;127:*CHANGELOG.md=1;38;2;137;221;255:*CHANGELOG.txt=1;38;2;137;221;255:*CHANGELOG=1;38;2;137;221;255:*CMakeCache.txt=0;38;2;68;74;115:*CMakeLists.txt=0;38;2;13;185;215:*CODEOWNERS=0;38;2;13;185;215:*CODE_OF_CONDUCT.md=1;38;2;137;221;255:*CODE_OF_CONDUCT=1;38;2;137;221;255:*CONTRIBUTING.txt=1;38;2;137;221;255:*CONTRIBUTING=1;38;2;137;221;255:*CONTRIBUTORS.md=1;38;2;137;221;255:*CONTRIBUTORS.txt=1;38;2;137;221;255:*CONTRIBUTORS=1;38;2;137;221;255:*COPYING=1;38;2;200;211;245:*COPYRIGHT=1;38;2;200;211;245:*Dockerfile=0;38;2;88;158;215:*Doxyfile=0;38;2;13;185;215:*FAQ=1;38;2;137;221;255:*INSTALL.md=1;38;2;137;221;255:*INSTALL.txt=1;38;2;137;221;255:*INSTALL=1;38;2;137;221;255:*Iconr=0;38;2;68;74;115\:*LEGACY=1;38;2;137;221;255:*LICENCE=1;38;2;200;211;245:*LICENSE-APACHE=1;38;2;200;211;245:*LICENSE-MIT=1;38;2;200;211;245:*LICENSE=1;38;2;200;211;245:*MANIFEST.in=0;38;2;13;185;215:*Makefile.am=0;38;2;13;185;215:*Makefile.in=0;38;2;68;74;115:*Makefile=0;38;2;13;185;215:*NOTICE=1;38;2;137;221;255:*README.md=1;38;2;137;221;255:*README.txt=1;38;2;137;221;255:*README=1;38;2;137;221;255:*SConscript=0;38;2;13;185;215:*SConstruct=0;38;2;13;185;215:*TODO.md=1;38;2;180;249;248:*TODO.txt=1;38;2;180;249;248:*TODO=1;38;2;180;249;248:*VERSION=1;38;2;137;221;255:*appveyor.yml=0;38;2;88;158;215:*bun.lockb=0;38;2;68;74;115:*configure.ac=0;38;2;13;185;215:*configure=0;38;2;13;185;215:*go.mod=0;38;2;13;185;215:*go.sum=0;38;2;68;74;115:*hgrc=0;38;2;13;185;215:*package-lock.json=0;38;2;68;74;115:*passwd=0;38;2;255;150;108:*pyproject.toml=0;38;2;13;185;215:*requirements.txt=0;38;2;13;185;215:*setup.py=0;38;2;13;185;215:*shadow=0;38;2;255;150;108:*stderr=0;38;2;68;74;115:*stdin=0;38;2;68;74;115:*stdout=0;38;2;68;74;115:*v.mod=0;38;2;13;185;215:bd=1;38;2;255;117;127;48;2;52;35;53:ca=0;48;2;45;63;118:cd=1;38;2;255;199;119;48;2;48;42;53:di=1;38;2;130;170;255:do=1;38;2;252;167;234;48;2;42;34;56:ex=1;38;2;195;232;141:fi=0:ln=3;38;2;137;221;255:mh=0:mi=0;38;2;197;59;83:no=0;38;2;99;109;166:or=0;38;2;34;36;54;48;2;197;59;83:ow=1;38;2;130;170;255;48;2;45;63;118:pi=1;38;2;255;150;108;48;2;50;37;52:rs=0;38;2;99;109;166:sg=0;48;2;45;63;118:so=1;38;2;79;214;190;48;2;33;48;60:st=0;48;2;45;63;118:su=0;48;2;45;63;118:tw=1;38;2;34;36;54;48;2;130;170;255"
