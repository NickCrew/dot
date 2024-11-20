#
# ~/.zshenv
#
###############################################################################

#
# XDG
#
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

#
# ZSH
#
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zsh"

export ZSHRCD="${ZOTDIR}/rc.d"
export ZPLUGINDIR="${XDG_DATA_HOME}/zsh/plugins"


export LDFLAGS="-L/usr/local/opt/readline/lib -L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include -I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

export EDITOR=nvim
export PAGER=most
export VISUAL=$EDITOR
export MANAPAGER=$PAGER
export KEYTIMEOUT=1
export INFOPATH="/usr/local/share/info:${INFOPATH:-}"
export MANPATH="/usr/local/share/man:/${HOME}/.local/share/man:${MANPATH:-}"

export HOMEBREW_PREFIX="/usr/local";
export HOMEBREW_CELLAR="/usr/local/Cellar";
export HOMEBREW_REPOSITORY="/usr/local/Homebrew";

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
export COLIMA_VM_SOCKET="${XDG_CONFIG_HOME:-$HOME/.config}/colima/${COLIMA_VM}/docker.sock"
export DOCKER_HOST="unix://${COLIMA_VM_SOCKET}"

# Google
export CLOUDSDK_HOME=$HOME/opt/google-cloud-sdk

# Python
export PYENV_ROOT="$HOME/.pyenv"


export LS_COLORS='*~=0;38;2;68;74;115:bd=1;38;2;255;117;127;48;2;52;35;53:ca=0;48;2;45;63;118:cd=1;38;2;255;199;119;48;2;48;42;53:di=1;38;2;130;170;255:do=1;38;2;252;167;234;48;2;42;34;56:ex=1;38;2;195;232;141:fi=0:ln=3;38;2;137;221;255:mh=0:mi=0;38;2;197;59;83:no=0;38;2;99;109;166:or=0;38;2;34;36;54;48;2;197;59;83:ow=1;38;2;130;170;255;48;2;45;63;118:pi=1;38;2;255;150;108;48;2;50;37;52:rs=0;38;2;99;109;166:sg=0;48;2;45;63;118:so=1;38;2;79;214;190;48;2;33;48;60:st=0;48;2;45;63;118:su=0;48;2;45;63;118:tw=1;38;2;34;36;54;48;2;130;170;255:*.1=0;38;2;200;211;245:*.a=0;38;2;79;214;190:*.c=0;38;2;255;199;119:*.d=0;38;2;255;199;119:*.h=0;38;2;255;199;119:*.m=0;38;2;255;199;119:*.o=0;38;2;68;74;115:*.p=0;38;2;255;199;119:*.r=0;38;2;255;199;119:*.t=0;38;2;255;199;119:*.v=0;38;2;255;199;119:*.z=1;38;2;255;117;127:*.7z=1;38;2;255;117;127:*.ai=1;38;2;192;153;255:*.as=0;38;2;255;199;119:*.bc=0;38;2;68;74;115:*.bz=1;38;2;255;117;127:*.cc=0;38;2;255;199;119:*.cp=0;38;2;255;199;119:*.cr=0;38;2;255;199;119:*.cs=0;38;2;255;199;119:*.db=1;38;2;255;117;127:*.di=0;38;2;255;199;119:*.el=0;38;2;255;199;119:*.ex=0;38;2;255;199;119:*.fs=0;38;2;255;199;119:*.go=0;38;2;255;199;119:*.gv=0;38;2;255;199;119:*.gz=1;38;2;255;117;127:*.ha=0;38;2;255;199;119:*.hh=0;38;2;255;199;119:*.hi=0;38;2;68;74;115:*.hs=0;38;2;255;199;119:*.jl=0;38;2;255;199;119:*.js=0;38;2;255;199;119:*.ko=0;38;2;79;214;190:*.kt=0;38;2;255;199;119:*.la=0;38;2;68;74;115:*.ll=0;38;2;255;199;119:*.lo=0;38;2;68;74;115:*.ma=1;38;2;192;153;255:*.mb=1;38;2;192;153;255:*.md=0;38;2;200;211;245:*.mk=0;38;2;13;185;215:*.ml=0;38;2;255;199;119:*.mn=0;38;2;255;199;119:*.nb=0;38;2;255;199;119:*.nu=0;38;2;255;199;119:*.pl=0;38;2;255;199;119:*.pm=0;38;2;255;199;119:*.pp=0;38;2;255;199;119:*.ps=1;38;2;252;167;234:*.py=0;38;2;255;199;119:*.rb=0;38;2;255;199;119:*.rm=1;38;2;79;214;190:*.rs=0;38;2;255;199;119:*.sh=0;38;2;255;199;119:*.so=0;38;2;79;214;190:*.td=0;38;2;255;199;119:*.ts=0;38;2;255;199;119:*.ui=0;38;2;255;150;108:*.vb=0;38;2;255;199;119:*.wv=1;38;2;101;188;255:*.xz=1;38;2;255;117;127:*FAQ=1;38;2;137;221;255:*.3ds=1;38;2;192;153;255:*.3fr=1;38;2;192;153;255:*.3mf=1;38;2;192;153;255:*.adb=0;38;2;255;199;119:*.ads=0;38;2;255;199;119:*.aif=1;38;2;101;188;255:*.amf=1;38;2;192;153;255:*.ape=1;38;2;101;188;255:*.apk=1;38;2;255;117;127:*.ari=1;38;2;192;153;255:*.arj=1;38;2;255;117;127:*.arw=1;38;2;192;153;255:*.asa=0;38;2;255;199;119:*.asm=0;38;2;255;199;119:*.aux=0;38;2;68;74;115:*.avi=1;38;2;79;214;190:*.awk=0;38;2;255;199;119:*.bag=1;38;2;255;117;127:*.bak=0;38;2;68;74;115:*.bat=0;38;2;79;214;190:*.bay=1;38;2;192;153;255:*.bbl=0;38;2;68;74;115:*.bcf=0;38;2;68;74;115:*.bib=0;38;2;255;150;108:*.bin=1;38;2;255;117;127:*.blg=0;38;2;68;74;115:*.bmp=1;38;2;192;153;255:*.bsh=0;38;2;255;199;119:*.bst=0;38;2;255;150;108:*.bz2=1;38;2;255;117;127:*.c++=0;38;2;255;199;119:*.cap=1;38;2;192;153;255:*.cfg=0;38;2;255;150;108:*.cgi=0;38;2;255;199;119:*.clj=0;38;2;255;199;119:*.com=0;38;2;79;214;190:*.cpp=0;38;2;255;199;119:*.cr2=1;38;2;192;153;255:*.cr3=1;38;2;192;153;255:*.crw=1;38;2;192;153;255:*.css=0;38;2;255;199;119:*.csv=0;38;2;200;211;245:*.csx=0;38;2;255;199;119:*.cxx=0;38;2;255;199;119:*.dae=1;38;2;192;153;255:*.dcr=1;38;2;192;153;255:*.dcs=1;38;2;192;153;255:*.deb=1;38;2;255;117;127:*.def=0;38;2;255;199;119:*.dll=0;38;2;79;214;190:*.dmg=1;38;2;255;117;127:*.dng=1;38;2;192;153;255:*.doc=1;38;2;252;167;234:*.dot=0;38;2;255;199;119:*.dox=0;38;2;13;185;215:*.dpr=0;38;2;255;199;119:*.drf=1;38;2;192;153;255:*.dxf=1;38;2;192;153;255:*.eip=1;38;2;192;153;255:*.elc=0;38;2;255;199;119:*.elm=0;38;2;255;199;119:*.epp=0;38;2;255;199;119:*.eps=1;38;2;192;153;255:*.erf=1;38;2;192;153;255:*.erl=0;38;2;255;199;119:*.exe=0;38;2;79;214;190:*.exr=1;38;2;192;153;255:*.exs=0;38;2;255;199;119:*.fbx=1;38;2;192;153;255:*.fff=1;38;2;192;153;255:*.fls=0;38;2;68;74;115:*.flv=1;38;2;79;214;190:*.fnt=1;38;2;13;185;215:*.fon=1;38;2;13;185;215:*.fsi=0;38;2;255;199;119:*.fsx=0;38;2;255;199;119:*.gif=1;38;2;192;153;255:*.git=0;38;2;68;74;115:*.gpr=1;38;2;192;153;255:*.gvy=0;38;2;255;199;119:*.h++=0;38;2;255;199;119:*.hda=1;38;2;192;153;255:*.hip=1;38;2;192;153;255:*.hpp=0;38;2;255;199;119:*.htc=0;38;2;255;199;119:*.htm=0;38;2;200;211;245:*.hxx=0;38;2;255;199;119:*.ico=1;38;2;192;153;255:*.ics=1;38;2;252;167;234:*.idx=0;38;2;68;74;115:*.igs=1;38;2;192;153;255:*.iiq=1;38;2;192;153;255:*.ilg=0;38;2;68;74;115:*.img=1;38;2;255;117;127:*.inc=0;38;2;255;199;119:*.ind=0;38;2;68;74;115:*.ini=0;38;2;255;150;108:*.inl=0;38;2;255;199;119:*.ino=0;38;2;255;199;119:*.ipp=0;38;2;255;199;119:*.iso=1;38;2;255;117;127:*.jar=1;38;2;255;117;127:*.jpg=1;38;2;192;153;255:*.jsx=0;38;2;255;199;119:*.jxl=1;38;2;192;153;255:*.k25=1;38;2;192;153;255:*.kdc=1;38;2;192;153;255:*.kex=1;38;2;252;167;234:*.kra=1;38;2;192;153;255:*.kts=0;38;2;255;199;119:*.log=0;38;2;68;74;115:*.ltx=0;38;2;255;199;119:*.lua=0;38;2;255;199;119:*.m3u=1;38;2;101;188;255:*.m4a=1;38;2;101;188;255:*.m4v=1;38;2;79;214;190:*.mdc=1;38;2;192;153;255:*.mef=1;38;2;192;153;255:*.mid=1;38;2;101;188;255:*.mir=0;38;2;255;199;119:*.mkv=1;38;2;79;214;190:*.mli=0;38;2;255;199;119:*.mos=1;38;2;192;153;255:*.mov=1;38;2;79;214;190:*.mp3=1;38;2;101;188;255:*.mp4=1;38;2;79;214;190:*.mpg=1;38;2;79;214;190:*.mrw=1;38;2;192;153;255:*.msi=1;38;2;255;117;127:*.mtl=1;38;2;192;153;255:*.nef=1;38;2;192;153;255:*.nim=0;38;2;255;199;119:*.nix=0;38;2;255;150;108:*.nrw=1;38;2;192;153;255:*.obj=1;38;2;192;153;255:*.obm=1;38;2;192;153;255:*.odp=1;38;2;252;167;234:*.ods=1;38;2;252;167;234:*.odt=1;38;2;252;167;234:*.ogg=1;38;2;101;188;255:*.ogv=1;38;2;79;214;190:*.orf=1;38;2;192;153;255:*.org=0;38;2;200;211;245:*.otf=1;38;2;13;185;215:*.otl=1;38;2;192;153;255:*.out=0;38;2;68;74;115:*.pas=0;38;2;255;199;119:*.pbm=1;38;2;192;153;255:*.pcx=1;38;2;192;153;255:*.pdf=1;38;2;252;167;234:*.pef=1;38;2;192;153;255:*.pgm=1;38;2;192;153;255:*.php=0;38;2;255;199;119:*.pid=0;38;2;68;74;115:*.pkg=1;38;2;255;117;127:*.png=1;38;2;192;153;255:*.pod=0;38;2;255;199;119:*.ppm=1;38;2;192;153;255:*.pps=1;38;2;252;167;234:*.ppt=1;38;2;252;167;234:*.pro=0;38;2;13;185;215:*.ps1=0;38;2;255;199;119:*.psd=1;38;2;192;153;255:*.ptx=1;38;2;192;153;255:*.pxn=1;38;2;192;153;255:*.pyc=0;38;2;68;74;115:*.pyd=0;38;2;68;74;115:*.pyo=0;38;2;68;74;115:*.qoi=1;38;2;192;153;255:*.r3d=1;38;2;192;153;255:*.raf=1;38;2;192;153;255:*.rar=1;38;2;255;117;127:*.raw=1;38;2;192;153;255:*.rpm=1;38;2;255;117;127:*.rst=0;38;2;200;211;245:*.rtf=1;38;2;252;167;234:*.rw2=1;38;2;192;153;255:*.rwl=1;38;2;192;153;255:*.rwz=1;38;2;192;153;255:*.sbt=0;38;2;255;199;119:*.sql=0;38;2;255;199;119:*.sr2=1;38;2;192;153;255:*.srf=1;38;2;192;153;255:*.srw=1;38;2;192;153;255:*.stl=1;38;2;192;153;255:*.stp=1;38;2;192;153;255:*.sty=0;38;2;68;74;115:*.svg=1;38;2;192;153;255:*.swf=1;38;2;79;214;190:*.swp=0;38;2;68;74;115:*.sxi=1;38;2;252;167;234:*.sxw=1;38;2;252;167;234:*.tar=1;38;2;255;117;127:*.tbz=1;38;2;255;117;127:*.tcl=0;38;2;255;199;119:*.tex=0;38;2;255;199;119:*.tga=1;38;2;192;153;255:*.tgz=1;38;2;255;117;127:*.tif=1;38;2;192;153;255:*.tml=0;38;2;255;150;108:*.tmp=0;38;2;68;74;115:*.toc=0;38;2;68;74;115:*.tsx=0;38;2;255;199;119:*.ttf=1;38;2;13;185;215:*.txt=0;38;2;200;211;245:*.typ=0;38;2;200;211;245:*.usd=1;38;2;192;153;255:*.vcd=1;38;2;255;117;127:*.vim=0;38;2;255;199;119:*.vob=1;38;2;79;214;190:*.vsh=0;38;2;255;199;119:*.wav=1;38;2;101;188;255:*.wma=1;38;2;101;188;255:*.wmv=1;38;2;79;214;190:*.wrl=1;38;2;192;153;255:*.x3d=1;38;2;192;153;255:*.x3f=1;38;2;192;153;255:*.xlr=1;38;2;252;167;234:*.xls=1;38;2;252;167;234:*.xml=0;38;2;200;211;245:*.xmp=0;38;2;255;150;108:*.xpm=1;38;2;192;153;255:*.xvf=1;38;2;192;153;255:*.yml=0;38;2;255;150;108:*.zig=0;38;2;255;199;119:*.zip=1;38;2;255;117;127:*.zsh=0;38;2;255;199;119:*.zst=1;38;2;255;117;127:*TODO=1;38;2;180;249;248:*hgrc=0;38;2;13;185;215:*.avif=1;38;2;192;153;255:*.bash=0;38;2;255;199;119:*.braw=1;38;2;192;153;255:*.conf=0;38;2;255;150;108:*.dart=0;38;2;255;199;119:*.data=1;38;2;192;153;255:*.diff=0;38;2;255;199;119:*.docx=1;38;2;252;167;234:*.epub=1;38;2;252;167;234:*.fish=0;38;2;255;199;119:*.flac=1;38;2;101;188;255:*.h264=1;38;2;79;214;190:*.hack=0;38;2;255;199;119:*.heif=1;38;2;192;153;255:*.hgrc=0;38;2;13;185;215:*.html=0;38;2;200;211;245:*.iges=1;38;2;192;153;255:*.info=0;38;2;200;211;245:*.java=0;38;2;255;199;119:*.jpeg=1;38;2;192;153;255:*.json=0;38;2;255;150;108:*.less=0;38;2;255;199;119:*.lisp=0;38;2;255;199;119:*.lock=0;38;2;68;74;115:*.make=0;38;2;13;185;215:*.mojo=0;38;2;255;199;119:*.mpeg=1;38;2;79;214;190:*.nims=0;38;2;255;199;119:*.opus=1;38;2;101;188;255:*.orig=0;38;2;68;74;115:*.pptx=1;38;2;252;167;234:*.prql=0;38;2;255;199;119:*.psd1=0;38;2;255;199;119:*.psm1=0;38;2;255;199;119:*.purs=0;38;2;255;199;119:*.raku=0;38;2;255;199;119:*.rlib=0;38;2;68;74;115:*.sass=0;38;2;255;199;119:*.scad=0;38;2;255;199;119:*.scss=0;38;2;255;199;119:*.step=1;38;2;192;153;255:*.tbz2=1;38;2;255;117;127:*.tiff=1;38;2;192;153;255:*.toml=0;38;2;255;150;108:*.usda=1;38;2;192;153;255:*.usdc=1;38;2;192;153;255:*.usdz=1;38;2;192;153;255:*.webm=1;38;2;79;214;190:*.webp=1;38;2;192;153;255:*.woff=1;38;2;13;185;215:*.xbps=1;38;2;255;117;127:*.xlsx=1;38;2;252;167;234:*.yaml=0;38;2;255;150;108:*stdin=0;38;2;68;74;115:*v.mod=0;38;2;13;185;215:*.blend=1;38;2;192;153;255:*.cabal=0;38;2;255;199;119:*.cache=0;38;2;68;74;115:*.class=0;38;2;68;74;115:*.cmake=0;38;2;13;185;215:*.ctags=0;38;2;68;74;115:*.dylib=0;38;2;79;214;190:*.dyn_o=0;38;2;68;74;115:*.gcode=0;38;2;255;199;119:*.ipynb=0;38;2;255;199;119:*.mdown=0;38;2;200;211;245:*.patch=0;38;2;255;199;119:*.rmeta=0;38;2;68;74;115:*.scala=0;38;2;255;199;119:*.shtml=0;38;2;200;211;245:*.swift=0;38;2;255;199;119:*.toast=1;38;2;255;117;127:*.woff2=1;38;2;13;185;215:*.xhtml=0;38;2;200;211;245:*Icon\r=0;38;2;68;74;115:*LEGACY=1;38;2;137;221;255:*NOTICE=1;38;2;137;221;255:*README=1;38;2;137;221;255:*go.mod=0;38;2;13;185;215:*go.sum=0;38;2;68;74;115:*passwd=0;38;2;255;150;108:*shadow=0;38;2;255;150;108:*stderr=0;38;2;68;74;115:*stdout=0;38;2;68;74;115:*.bashrc=0;38;2;255;199;119:*.config=0;38;2;255;150;108:*.dyn_hi=0;38;2;68;74;115:*.flake8=0;38;2;13;185;215:*.gradle=0;38;2;255;199;119:*.groovy=0;38;2;255;199;119:*.ignore=0;38;2;13;185;215:*.matlab=0;38;2;255;199;119:*.nimble=0;38;2;255;199;119:*COPYING=1;38;2;200;211;245:*INSTALL=1;38;2;137;221;255:*LICENCE=1;38;2;200;211;245:*LICENSE=1;38;2;200;211;245:*TODO.md=1;38;2;180;249;248:*VERSION=1;38;2;137;221;255:*.alembic=1;38;2;192;153;255:*.desktop=0;38;2;255;150;108:*.gemspec=0;38;2;13;185;215:*.mailmap=0;38;2;13;185;215:*Doxyfile=0;38;2;13;185;215:*Makefile=0;38;2;13;185;215:*TODO.txt=1;38;2;180;249;248:*setup.py=0;38;2;13;185;215:*.DS_Store=0;38;2;68;74;115:*.cmake.in=0;38;2;13;185;215:*.fdignore=0;38;2;13;185;215:*.kdevelop=0;38;2;13;185;215:*.markdown=0;38;2;200;211;245:*.rgignore=0;38;2;13;185;215:*.tfignore=0;38;2;13;185;215:*CHANGELOG=1;38;2;137;221;255:*COPYRIGHT=1;38;2;200;211;245:*README.md=1;38;2;137;221;255:*bun.lockb=0;38;2;68;74;115:*configure=0;38;2;13;185;215:*.gitconfig=0;38;2;13;185;215:*.gitignore=0;38;2;13;185;215:*.localized=0;38;2;68;74;115:*.scons_opt=0;38;2;68;74;115:*.timestamp=0;38;2;68;74;115:*CODEOWNERS=0;38;2;13;185;215:*Dockerfile=0;38;2;88;158;215:*INSTALL.md=1;38;2;137;221;255:*README.txt=1;38;2;137;221;255:*SConscript=0;38;2;13;185;215:*SConstruct=0;38;2;13;185;215:*.cirrus.yml=0;38;2;88;158;215:*.gitmodules=0;38;2;13;185;215:*.synctex.gz=0;38;2;68;74;115:*.travis.yml=0;38;2;88;158;215:*INSTALL.txt=1;38;2;137;221;255:*LICENSE-MIT=1;38;2;200;211;245:*MANIFEST.in=0;38;2;13;185;215:*Makefile.am=0;38;2;13;185;215:*Makefile.in=0;38;2;68;74;115:*.applescript=0;38;2;255;199;119:*.fdb_latexmk=0;38;2;68;74;115:*.webmanifest=0;38;2;255;150;108:*CHANGELOG.md=1;38;2;137;221;255:*CONTRIBUTING=1;38;2;137;221;255:*CONTRIBUTORS=1;38;2;137;221;255:*appveyor.yml=0;38;2;88;158;215:*configure.ac=0;38;2;13;185;215:*.bash_profile=0;38;2;255;199;119:*.clang-format=0;38;2;13;185;215:*.editorconfig=0;38;2;13;185;215:*CHANGELOG.txt=1;38;2;137;221;255:*.gitattributes=0;38;2;13;185;215:*.gitlab-ci.yml=0;38;2;88;158;215:*CMakeCache.txt=0;38;2;68;74;115:*CMakeLists.txt=0;38;2;13;185;215:*LICENSE-APACHE=1;38;2;200;211;245:*pyproject.toml=0;38;2;13;185;215:*CODE_OF_CONDUCT=1;38;2;137;221;255:*CONTRIBUTING.md=1;38;2;137;221;255:*CONTRIBUTORS.md=1;38;2;137;221;255:*.sconsign.dblite=0;38;2;68;74;115:*CONTRIBUTING.txt=1;38;2;137;221;255:*CONTRIBUTORS.txt=1;38;2;137;221;255:*requirements.txt=0;38;2;13;185;215:*package-lock.json=0;38;2;68;74;115:*CODE_OF_CONDUCT.md=1;38;2;137;221;255:*.CFUserTextEncoding=0;38;2;68;74;115:*CODE_OF_CONDUCT.txt=1;38;2;137;221;255:*azure-pipelines.yml=0;38;2;88;158;215'
export FZF_COLORS='bg+:-1,fg:gray,fg+:white,border:black,spinner:0,hl:yellow,header:blue,info:green,pointer:red,marker:blue,prompt:gray,hl+:red'

