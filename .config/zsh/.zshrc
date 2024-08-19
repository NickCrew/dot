#  vim: foldmethod=marker  foldmarker=[[,]]
# .zshrc


################## INITIALIZE #####################[[


# Instant Prompt
if [[ -f "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" 
fi
# Start profiling
zmodload zsh/zprof  
# Load plugin manager
source $ZDOTDIR/zload.zsh
# Function path
fpath+="${ZSH_CACHE_DIR}/completions"     
# Custom Libs
export ZSHRCD=$ZDOTDIR/rc.d
bindkey -v

#]]


################## INSTALL PLUGINS [[

#
# INSTALL PLUGINS
# 
repos=(
  # projects with nested plugins
  ohmyzsh/ohmyzsh

  # # regular plugins
  jeffreytse/zsh-vi-mode
  romkatv/powerlevel10k
  marlonrichert/zsh-autocomplete
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  zdharma-continuum/fast-syntax-highlighting
)
plugin-clone $repos
#]]

zmodload zsh/complist  
zle -C _expand_alias complete-word _generic


############### ENVIRONMENT [[
# EDITOR

if [[ -v commands[nvim] ]]; then EDITOR=nvim; else EDITOR=vi; fi
if [[ -v commands[most] ]]; then PAGER=most; else PAGER=less; fi

export EDITOR
export PAGER
export VISUAL=$EDITOR
export MANPAGER=$PAGER
# reduce lag after ESC to 1/10th of a second
export KEYTIMEOUT=1

# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000000
export SAVEHIST=10000000

# GPG + SSH
GPG_TTY=$(tty)
export GPG_TTY
export SSH_CONFIG="$HOME/.ssh/config"
export SSH_IDENTITY="$HOME/.ssh/id_ed25519"

# DOCKER
export COLIMA_VM="${COLIMA_VM:-default}"
export COLIMA_VM_SOCKET="${HOME}/.colima/${COLIMA_VM}/docker.sock"
export DOCKER_HOST="unix://${COLIMA_VM_SOCKET}"

# Gooogle
export CLOUDSDK_HOME=$HOME/opt/google-cloud-sdk

# Python
export PYENV_ROOT="$HOME/.pyenv"

# RUST

# BREW
if [[ $(uname) == 'Darwin' ]]; then
  export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
  export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"

  fpath+="$(brew --prefix)/share/zsh/site-functions"

  if [[ $(uname -m) = "x86_64" ]]; then
      eval "$(/usr/local/HomeBrew/bin/brew shellenv)"
  else
      eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi


export LS_COLORS="*~=0;38;2;68;74;115:bd=1;38;2;255;117;127;48;2;52;35;53:ca=0;48;2;45;63;118:cd=1;38;2;255;199;119;48;2;48;42;53:di=1;38;2;130;170;255:do=1;38;2;252;167;234;48;2;42;34;56:ex=1;38;2;195;232;141:fi=0:ln=3;38;2;137;221;255:mh=0:mi=0;38;2;197;59;83:no=0;38;2;99;109;166:or=0;38;2;34;36;54;48;2;197;59;83:ow=1;38;2;130;170;255;48;2;45;63;118:pi=1;38;2;255;150;108;48;2;50;37;52:rs=0;38;2;99;109;166:sg=0;48;2;45;63;118:so=1;38;2;79;214;190;48;2;33;48;60:st=0;48;2;45;63;118:su=0;48;2;45;63;118:tw=1;38;2;34;36;54;48;2;130;170;255:*.1=0;38;2;200;211;245:*.a=0;38;2;79;214;190:*.c=0;38;2;255;199;119:*.d=0;38;2;255;199;119:*.h=0;38;2;255;199;119:*.m=0;38;2;255;199;119:*.o=0;38;2;68;74;115:*.p=0;38;2;255;199;119:*.r=0;38;2;255;199;119:*.t=0;38;2;255;199;119:*.v=0;38;2;255;199;119:*.z=1;38;2;255;117;127:*.7z=1;38;2;255;117;127:*.ai=1;38;2;192;153;255:*.as=0;38;2;255;199;119:*.bc=0;38;2;68;74;115:*.bz=1;38;2;255;117;127:*.cc=0;38;2;255;199;119:*.cp=0;38;2;255;199;119:*.cr=0;38;2;255;199;119:*.cs=0;38;2;255;199;119:*.db=1;38;2;255;117;127:*.di=0;38;2;255;199;119:*.el=0;38;2;255;199;119:*.ex=0;38;2;255;199;119:*.fs=0;38;2;255;199;119:*.go=0;38;2;255;199;119:*.gv=0;38;2;255;199;119:*.gz=1;38;2;255;117;127:*.ha=0;38;2;255;199;119:*.hh=0;38;2;255;199;119:*.hi=0;38;2;68;74;115:*.hs=0;38;2;255;199;119:*.jl=0;38;2;255;199;119:*.js=0;38;2;255;199;119:*.ko=0;38;2;79;214;190:*.kt=0;38;2;255;199;119:*.la=0;38;2;68;74;115:*.ll=0;38;2;255;199;119:*.lo=0;38;2;68;74;115:*.ma=1;38;2;192;153;255:*.mb=1;38;2;192;153;255:*.md=0;38;2;200;211;245:*.mk=0;38;2;13;185;215:*.ml=0;38;2;255;199;119:*.mn=0;38;2;255;199;119:*.nb=0;38;2;255;199;119:*.nu=0;38;2;255;199;119:*.pl=0;38;2;255;199;119:*.pm=0;38;2;255;199;119:*.pp=0;38;2;255;199;119:*.ps=1;38;2;252;167;234:*.py=0;38;2;255;199;119:*.rb=0;38;2;255;199;119:*.rm=1;38;2;79;214;190:*.rs=0;38;2;255;199;119:*.sh=0;38;2;255;199;119:*.so=0;38;2;79;214;190:*.td=0;38;2;255;199;119:*.ts=0;38;2;255;199;119:*.ui=0;38;2;255;150;108:*.vb=0;38;2;255;199;119:*.wv=1;38;2;101;188;255:*.xz=1;38;2;255;117;127:*FAQ=1;38;2;137;221;255:*.3ds=1;38;2;192;153;255:*.3fr=1;38;2;192;153;255:*.3mf=1;38;2;192;153;255:*.adb=0;38;2;255;199;119:*.ads=0;38;2;255;199;119:*.aif=1;38;2;101;188;255:*.amf=1;38;2;192;153;255:*.ape=1;38;2;101;188;255:*.apk=1;38;2;255;117;127:*.ari=1;38;2;192;153;255:*.arj=1;38;2;255;117;127:*.arw=1;38;2;192;153;255:*.asa=0;38;2;255;199;119:*.asm=0;38;2;255;199;119:*.aux=0;38;2;68;74;115:*.avi=1;38;2;79;214;190:*.awk=0;38;2;255;199;119:*.bag=1;38;2;255;117;127:*.bak=0;38;2;68;74;115:*.bat=0;38;2;79;214;190:*.bay=1;38;2;192;153;255:*.bbl=0;38;2;68;74;115:*.bcf=0;38;2;68;74;115:*.bib=0;38;2;255;150;108:*.bin=1;38;2;255;117;127:*.blg=0;38;2;68;74;115:*.bmp=1;38;2;192;153;255:*.bsh=0;38;2;255;199;119:*.bst=0;38;2;255;150;108:*.bz2=1;38;2;255;117;127:*.c++=0;38;2;255;199;119:*.cap=1;38;2;192;153;255:*.cfg=0;38;2;255;150;108:*.cgi=0;38;2;255;199;119:*.clj=0;38;2;255;199;119:*.com=0;38;2;79;214;190:*.cpp=0;38;2;255;199;119:*.cr2=1;38;2;192;153;255:*.cr3=1;38;2;192;153;255:*.crw=1;38;2;192;153;255:*.css=0;38;2;255;199;119:*.csv=0;38;2;200;211;245:*.csx=0;38;2;255;199;119:*.cxx=0;38;2;255;199;119:*.dae=1;38;2;192;153;255:*.dcr=1;38;2;192;153;255:*.dcs=1;38;2;192;153;255:*.deb=1;38;2;255;117;127:*.def=0;38;2;255;199;119:*.dll=0;38;2;79;214;190:*.dmg=1;38;2;255;117;127:*.dng=1;38;2;192;153;255:*.doc=1;38;2;252;167;234:*.dot=0;38;2;255;199;119:*.dox=0;38;2;13;185;215:*.dpr=0;38;2;255;199;119:*.drf=1;38;2;192;153;255:*.dxf=1;38;2;192;153;255:*.eip=1;38;2;192;153;255:*.elc=0;38;2;255;199;119:*.elm=0;38;2;255;199;119:*.epp=0;38;2;255;199;119:*.eps=1;38;2;192;153;255:*.erf=1;38;2;192;153;255:*.erl=0;38;2;255;199;119:*.exe=0;38;2;79;214;190:*.exr=1;38;2;192;153;255:*.exs=0;38;2;255;199;119:*.fbx=1;38;2;192;153;255:*.fff=1;38;2;192;153;255:*.fls=0;38;2;68;74;115:*.flv=1;38;2;79;214;190:*.fnt=1;38;2;13;185;215:*.fon=1;38;2;13;185;215:*.fsi=0;38;2;255;199;119:*.fsx=0;38;2;255;199;119:*.gif=1;38;2;192;153;255:*.git=0;38;2;68;74;115:*.gpr=1;38;2;192;153;255:*.gvy=0;38;2;255;199;119:*.h++=0;38;2;255;199;119:*.hda=1;38;2;192;153;255:*.hip=1;38;2;192;153;255:*.hpp=0;38;2;255;199;119:*.htc=0;38;2;255;199;119:*.htm=0;38;2;200;211;245:*.hxx=0;38;2;255;199;119:*.ico=1;38;2;192;153;255:*.ics=1;38;2;252;167;234:*.idx=0;38;2;68;74;115:*.igs=1;38;2;192;153;255:*.iiq=1;38;2;192;153;255:*.ilg=0;38;2;68;74;115:*.img=1;38;2;255;117;127:*.inc=0;38;2;255;199;119:*.ind=0;38;2;68;74;115:*.ini=0;38;2;255;150;108:*.inl=0;38;2;255;199;119:*.ino=0;38;2;255;199;119:*.ipp=0;38;2;255;199;119:*.iso=1;38;2;255;117;127:*.jar=1;38;2;255;117;127:*.jpg=1;38;2;192;153;255:*.jsx=0;38;2;255;199;119:*.jxl=1;38;2;192;153;255:*.k25=1;38;2;192;153;255:*.kdc=1;38;2;192;153;255:*.kex=1;38;2;252;167;234:*.kra=1;38;2;192;153;255:*.kts=0;38;2;255;199;119:*.log=0;38;2;68;74;115:*.ltx=0;38;2;255;199;119:*.lua=0;38;2;255;199;119:*.m3u=1;38;2;101;188;255:*.m4a=1;38;2;101;188;255:*.m4v=1;38;2;79;214;190:*.mdc=1;38;2;192;153;255:*.mef=1;38;2;192;153;255:*.mid=1;38;2;101;188;255:*.mir=0;38;2;255;199;119:*.mkv=1;38;2;79;214;190:*.mli=0;38;2;255;199;119:*.mos=1;38;2;192;153;255:*.mov=1;38;2;79;214;190:*.mp3=1;38;2;101;188;255:*.mp4=1;38;2;79;214;190:*.mpg=1;38;2;79;214;190:*.mrw=1;38;2;192;153;255:*.msi=1;38;2;255;117;127:*.mtl=1;38;2;192;153;255:*.nef=1;38;2;192;153;255:*.nim=0;38;2;255;199;119:*.nix=0;38;2;255;150;108:*.nrw=1;38;2;192;153;255:*.obj=1;38;2;192;153;255:*.obm=1;38;2;192;153;255:*.odp=1;38;2;252;167;234:*.ods=1;38;2;252;167;234:*.odt=1;38;2;252;167;234:*.ogg=1;38;2;101;188;255:*.ogv=1;38;2;79;214;190:*.orf=1;38;2;192;153;255:*.org=0;38;2;200;211;245:*.otf=1;38;2;13;185;215:*.otl=1;38;2;192;153;255:*.out=0;38;2;68;74;115:*.pas=0;38;2;255;199;119:*.pbm=1;38;2;192;153;255:*.pcx=1;38;2;192;153;255:*.pdf=1;38;2;252;167;234:*.pef=1;38;2;192;153;255:*.pgm=1;38;2;192;153;255:*.php=0;38;2;255;199;119:*.pid=0;38;2;68;74;115:*.pkg=1;38;2;255;117;127:*.png=1;38;2;192;153;255:*.pod=0;38;2;255;199;119:*.ppm=1;38;2;192;153;255:*.pps=1;38;2;252;167;234:*.ppt=1;38;2;252;167;234:*.pro=0;38;2;13;185;215:*.ps1=0;38;2;255;199;119:*.psd=1;38;2;192;153;255:*.ptx=1;38;2;192;153;255:*.pxn=1;38;2;192;153;255:*.pyc=0;38;2;68;74;115:*.pyd=0;38;2;68;74;115:*.pyo=0;38;2;68;74;115:*.qoi=1;38;2;192;153;255:*.r3d=1;38;2;192;153;255:*.raf=1;38;2;192;153;255:*.rar=1;38;2;255;117;127:*.raw=1;38;2;192;153;255:*.rpm=1;38;2;255;117;127:*.rst=0;38;2;200;211;245:*.rtf=1;38;2;252;167;234:*.rw2=1;38;2;192;153;255:*.rwl=1;38;2;192;153;255:*.rwz=1;38;2;192;153;255:*.sbt=0;38;2;255;199;119:*.sql=0;38;2;255;199;119:*.sr2=1;38;2;192;153;255:*.srf=1;38;2;192;153;255:*.srw=1;38;2;192;153;255:*.stl=1;38;2;192;153;255:*.stp=1;38;2;192;153;255:*.sty=0;38;2;68;74;115:*.svg=1;38;2;192;153;255:*.swf=1;38;2;79;214;190:*.swp=0;38;2;68;74;115:*.sxi=1;38;2;252;167;234:*.sxw=1;38;2;252;167;234:*.tar=1;38;2;255;117;127:*.tbz=1;38;2;255;117;127:*.tcl=0;38;2;255;199;119:*.tex=0;38;2;255;199;119:*.tga=1;38;2;192;153;255:*.tgz=1;38;2;255;117;127:*.tif=1;38;2;192;153;255:*.tml=0;38;2;255;150;108:*.tmp=0;38;2;68;74;115:*.toc=0;38;2;68;74;115:*.tsx=0;38;2;255;199;119:*.ttf=1;38;2;13;185;215:*.txt=0;38;2;200;211;245:*.typ=0;38;2;200;211;245:*.usd=1;38;2;192;153;255:*.vcd=1;38;2;255;117;127:*.vim=0;38;2;255;199;119:*.vob=1;38;2;79;214;190:*.vsh=0;38;2;255;199;119:*.wav=1;38;2;101;188;255:*.wma=1;38;2;101;188;255:*.wmv=1;38;2;79;214;190:*.wrl=1;38;2;192;153;255:*.x3d=1;38;2;192;153;255:*.x3f=1;38;2;192;153;255:*.xlr=1;38;2;252;167;234:*.xls=1;38;2;252;167;234:*.xml=0;38;2;200;211;245:*.xmp=0;38;2;255;150;108:*.xpm=1;38;2;192;153;255:*.xvf=1;38;2;192;153;255:*.yml=0;38;2;255;150;108:*.zig=0;38;2;255;199;119:*.zip=1;38;2;255;117;127:*.zsh=0;38;2;255;199;119:*.zst=1;38;2;255;117;127:*TODO=1;38;2;180;249;248:*hgrc=0;38;2;13;185;215:*.avif=1;38;2;192;153;255:*.bash=0;38;2;255;199;119:*.braw=1;38;2;192;153;255:*.conf=0;38;2;255;150;108:*.dart=0;38;2;255;199;119:*.data=1;38;2;192;153;255:*.diff=0;38;2;255;199;119:*.docx=1;38;2;252;167;234:*.epub=1;38;2;252;167;234:*.fish=0;38;2;255;199;119:*.flac=1;38;2;101;188;255:*.h264=1;38;2;79;214;190:*.hack=0;38;2;255;199;119:*.heif=1;38;2;192;153;255:*.hgrc=0;38;2;13;185;215:*.html=0;38;2;200;211;245:*.iges=1;38;2;192;153;255:*.info=0;38;2;200;211;245:*.java=0;38;2;255;199;119:*.jpeg=1;38;2;192;153;255:*.json=0;38;2;255;150;108:*.less=0;38;2;255;199;119:*.lisp=0;38;2;255;199;119:*.lock=0;38;2;68;74;115:*.make=0;38;2;13;185;215:*.mojo=0;38;2;255;199;119:*.mpeg=1;38;2;79;214;190:*.nims=0;38;2;255;199;119:*.opus=1;38;2;101;188;255:*.orig=0;38;2;68;74;115:*.pptx=1;38;2;252;167;234:*.prql=0;38;2;255;199;119:*.psd1=0;38;2;255;199;119:*.psm1=0;38;2;255;199;119:*.purs=0;38;2;255;199;119:*.raku=0;38;2;255;199;119:*.rlib=0;38;2;68;74;115:*.sass=0;38;2;255;199;119:*.scad=0;38;2;255;199;119:*.scss=0;38;2;255;199;119:*.step=1;38;2;192;153;255:*.tbz2=1;38;2;255;117;127:*.tiff=1;38;2;192;153;255:*.toml=0;38;2;255;150;108:*.usda=1;38;2;192;153;255:*.usdc=1;38;2;192;153;255:*.usdz=1;38;2;192;153;255:*.webm=1;38;2;79;214;190:*.webp=1;38;2;192;153;255:*.woff=1;38;2;13;185;215:*.xbps=1;38;2;255;117;127:*.xlsx=1;38;2;252;167;234:*.yaml=0;38;2;255;150;108:*stdin=0;38;2;68;74;115:*v.mod=0;38;2;13;185;215:*.blend=1;38;2;192;153;255:*.cabal=0;38;2;255;199;119:*.cache=0;38;2;68;74;115:*.class=0;38;2;68;74;115:*.cmake=0;38;2;13;185;215:*.ctags=0;38;2;68;74;115:*.dylib=0;38;2;79;214;190:*.dyn_o=0;38;2;68;74;115:*.gcode=0;38;2;255;199;119:*.ipynb=0;38;2;255;199;119:*.mdown=0;38;2;200;211;245:*.patch=0;38;2;255;199;119:*.rmeta=0;38;2;68;74;115:*.scala=0;38;2;255;199;119:*.shtml=0;38;2;200;211;245:*.swift=0;38;2;255;199;119:*.toast=1;38;2;255;117;127:*.woff2=1;38;2;13;185;215:*.xhtml=0;38;2;200;211;245:*Icon=0;38;2;68;74;115:*LEGACY=1;38;2;137;221;255:*NOTICE=1;38;2;137;221;255:*README=1;38;2;137;221;255:*go.mod=0;38;2;13;185;215:*go.sum=0;38;2;68;74;115:*passwd=0;38;2;255;150;108:*shadow=0;38;2;255;150;108:*stderr=0;38;2;68;74;115:*stdout=0;38;2;68;74;115:*.bashrc=0;38;2;255;199;119:*.config=0;38;2;255;150;108:*.dyn_hi=0;38;2;68;74;115:*.flake8=0;38;2;13;185;215:*.gradle=0;38;2;255;199;119:*.groovy=0;38;2;255;199;119:*.ignore=0;38;2;13;185;215:*.matlab=0;38;2;255;199;119:*.nimble=0;38;2;255;199;119:*COPYING=1;38;2;200;211;245:*INSTALL=1;38;2;137;221;255:*LICENCE=1;38;2;200;211;245:*LICENSE=1;38;2;200;211;245:*TODO.md=1;38;2;180;249;248:*VERSION=1;38;2;137;221;255:*.alembic=1;38;2;192;153;255:*.desktop=0;38;2;255;150;108:*.gemspec=0;38;2;13;185;215:*.mailmap=0;38;2;13;185;215:*Doxyfile=0;38;2;13;185;215:*Makefile=0;38;2;13;185;215:*TODO.txt=1;38;2;180;249;248:*setup.py=0;38;2;13;185;215:*.DS_Store=0;38;2;68;74;115:*.cmake.in=0;38;2;13;185;215:*.fdignore=0;38;2;13;185;215:*.kdevelop=0;38;2;13;185;215:*.markdown=0;38;2;200;211;245:*.rgignore=0;38;2;13;185;215:*.tfignore=0;38;2;13;185;215:*CHANGELOG=1;38;2;137;221;255:*COPYRIGHT=1;38;2;200;211;245:*README.md=1;38;2;137;221;255:*bun.lockb=0;38;2;68;74;115:*configure=0;38;2;13;185;215:*.gitconfig=0;38;2;13;185;215:*.gitignore=0;38;2;13;185;215:*.localized=0;38;2;68;74;115:*.scons_opt=0;38;2;68;74;115:*.timestamp=0;38;2;68;74;115:*CODEOWNERS=0;38;2;13;185;215:*Dockerfile=0;38;2;88;158;215:*INSTALL.md=1;38;2;137;221;255:*README.txt=1;38;2;137;221;255:*SConscript=0;38;2;13;185;215:*SConstruct=0;38;2;13;185;215:*.cirrus.yml=0;38;2;88;158;215:*.gitmodules=0;38;2;13;185;215:*.synctex.gz=0;38;2;68;74;115:*.travis.yml=0;38;2;88;158;215:*INSTALL.txt=1;38;2;137;221;255:*LICENSE-MIT=1;38;2;200;211;245:*MANIFEST.in=0;38;2;13;185;215:*Makefile.am=0;38;2;13;185;215:*Makefile.in=0;38;2;68;74;115:*.applescript=0;38;2;255;199;119:*.fdb_latexmk=0;38;2;68;74;115:*.webmanifest=0;38;2;255;150;108:*CHANGELOG.md=1;38;2;137;221;255:*CONTRIBUTING=1;38;2;137;221;255:*CONTRIBUTORS=1;38;2;137;221;255:*appveyor.yml=0;38;2;88;158;215:*configure.ac=0;38;2;13;185;215:*.bash_profile=0;38;2;255;199;119:*.clang-format=0;38;2;13;185;215:*.editorconfig=0;38;2;13;185;215:*CHANGELOG.txt=1;38;2;137;221;255:*.gitattributes=0;38;2;13;185;215:*.gitlab-ci.yml=0;38;2;88;158;215:*CMakeCache.txt=0;38;2;68;74;115:*CMakeLists.txt=0;38;2;13;185;215:*LICENSE-APACHE=1;38;2;200;211;245:*pyproject.toml=0;38;2;13;185;215:*CODE_OF_CONDUCT=1;38;2;137;221;255:*CONTRIBUTING.md=1;38;2;137;221;255:*CONTRIBUTORS.md=1;38;2;137;221;255:*.sconsign.dblite=0;38;2;68;74;115:*CONTRIBUTING.txt=1;38;2;137;221;255:*CONTRIBUTORS.txt=1;38;2;137;221;255:*requirements.txt=0;38;2;13;185;215:*package-lock.json=0;38;2;68;74;115:*CODE_OF_CONDUCT.md=1;38;2;137;221;255:*.CFUserTextEncoding=0;38;2;68;74;115:*CODE_OF_CONDUCT.txt=1;38;2;137;221;255:*azure-pipelines.yml=0;38;2;88;158;215"

path+=("/usr/local/sbin")
path+=("/usr/local/bin")
path+=("${PYENV_ROOT:-$HOME/.pyenv}/bin")
path+=("$HOME/.local/bin")
path+=("$HOME/bin")
path+=("$HOME/.cargo/bin")
path+=("$HOME/.fzf/bin")
path+=("$HOME/.atuin/bin")
path+=("$HOME/opt/bin")
path+=("$HOME/Applications")
path+=("${GOHOME:-$HOME/go}/bin")
path+=("$HOME/.krew/bin")
typeset -U path
export PATH
# ]]

############### Setopts [[

# History
setopt bang_hist				# Perform textual history expansion, csh-style, treating the character ‘!’ specially.
setopt extended_history			# Record timestamp of command in HISTFILE
setopt hist_expire_dups_first 	# Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       	# Ignore duplicated commands history l
setopt hist_ignore_space        # ignore commands that start with space
setopt hist_no_functions		# Don't store function definitions
setopt hist_reduce_blanks		# Remove superfluous blanks from each command line being added to the history list
setopt hist_verify              # show command with history expansion to user before running it
setopt inc_append_History		# Add new lines to the history file immediately (do not wait until exit)
setopt share_history          	# Share command history data
unsetopt hist_beep				# Shut up shut up shut up


setopt auto_cd                  # Change to directory without cd 
setopt auto_pushd               # Push the old directory onto the directory stack
setopt pushd_ignore_dups        # Don't push multiple copies of the same directory onto the directory stack
setopt pushdminus               # Use pushd to rotate the stack so that the current directory is always on top
# Misc
setopt notify			        # notify when background job finishes				
unsetopt clobber		        # Allow overwriting existing files
setopt ignore_eof		        # Don't exit on EOF
setopt local_options	        # Allow fucntions to have local options
setopt local_traps		        # Allow functions to have local traps
unsetopt beep			        # shut up shut up shut up

setopt glob_complete			# Show autocompletion menu with globs
setopt menu_complete			# Automatically highlight first element of completion menu
setopt auto_list				# Automatically list choices on ambiguous completion.
setopt complete_in_word			# Complete from both ends of a word.
setopt no_list_beep				# Don't beep when listing choices on ambiguous completion
setopt nocaseglob               # Case-insensitive globbing
setopt auto_menu                # show completion menu on successive tab press
setopt always_to_end
unsetopt complete_aliases       # Make aliases work with completion nicely
unsetopt flowcontrol
#]]

################ SOURCE PLUGINS [[
#  LOAD PLUGINS
plugins=(
  powerlevel10k
  # zsh-vi-mode

  fast-syntax-highlighting
  zsh-autosuggestions
  zsh-autocomplete
  zsh-completions

  ohmyzsh/plugins/zoxide
  ohmyzsh/plugins/1password
  ohmyzsh/plugins/aws

)
plugin-source $plugins

source $HOME/.p10k.zsh

#]]

################ ZSTYLE [[

zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes

zstyle ':completion:*' completer _extensions _complete _approximate
# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${ZSH_CACHE_DIR:-$HOME/.cache/zsh}/zcompcache"
# Complete the alias when _expand_alias is used as a function
zstyle ':completion:*' complete true
zstyle ':completion:alias-expension:*' completer _expand_alias
# Allow you to select in a menu
zstyle ':completion:*' menu select
# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# Colors for files and directory
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}
# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases
# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
# See ZSHCOMPWID "completion matching control"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' keep-prefix true
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
# ]]

################ KEYBINDINGS [[

source $ZSHRCD/func.zsh
source $ZSHRCD/fzf.zsh
bindkey -M menuselect 'h' vi-backward-char				 # Left
bindkey -M menuselect 'k' vi-up-line-or-history				# Up
bindkey -M menuselect 'j' vi-down-line-or-history           # Down
bindkey -M menuselect 'l' vi-forward-char					# Right
bindkey -M menuselect '^xg' clear-screen					# Clear
bindkey -M menuselect '^xi' vi-insert						# Insert
bindkey -M menuselect '^xh' accept-and-hold                	# Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  	# Next
bindkey -M menuselect '^xu' undo                           	# Undo

# zsh-autocomplete : tab completion
bindkey -M menuselect '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect  '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
# Use vium cli mode
bindkey '^P' up-history      
bindkey '^N' down-history
# bkspc and ^h working after returning from cmd mode
bindkey '^?' backward-delete-char  
bindkey '^h' backward-delete-char
 # ctrl-w removed word backwards
bindkey '^w' backward-kill-word   

# Atuin
eval "$(atuin init zsh --disable-up-arrow)"
bindkey '^r' atuin-search-viins
# ]]

#################### ALIASES [[

#
# Navigation
#
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

#
# Directories
#
alias ..-='cd ..'
alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'


alias md='mkdir -p'
alias rd=rmdir


if [[ -v commands[lsd] ]]; then
  alias ls='lsd --color=auto --icon=auto --group-directories-first'
  alias l='ls'
  alias ll='ls --long --git'
  alias la='ls --long --git --almost-all'
else
  alias lsa='ls -lah'
  alias ll='ls -lh'
  alias la='ls -lAh'
fi

[[ -v commands[bat] ]] && alias bat='bat --style=numbers --color=always'

[[ -v commands[fd] ]] && alias find='fd'

#
# Apps / Integrations
# 
alias dc='docker compose'
alias dea='direnv allow'
alias dots='git --git-dir=$HOME/.dot.git --work-tree=$HOME'
alias g='git'
alias gac='gimme-aws-creds'
alias gtw='gittower' 
alias lg='lazygit'
alias po='poetry'
alias rr='ranger'
alias sto='stow -d ~/.fosto -t ~/ '
alias tf='terraform'
alias tg='terragrunt'
alias v='nvim'
alias k='kubectl'
alias wtst='wezterm cli set-tab-title'
alias wt='wezterm'
alias xx='xplr'
alias xzsh='exec zsh'
alias x='xplr'
# ]]

source $ZDOTDIR/zlocal.zsh

