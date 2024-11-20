 # List files
if [[ -v commands[lsd] ]]; then
  alias ls='lsd --color=auto --icon=auto --group-directories-first'
  alias l='ls'
  alias lg='ls --long --git --almost-all'
  alias la='ls --long --almost-all'
  alias ll='ls --long'
else
  alias lsa='ls -lah'
  alias ll='ls -lh'
  alias la='ls -lAh'
fi
 alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
  
# File management
alias md='mkdir -p'
alias rd=rmdir
alias dea='direnv allow'
alias xx='xplr'
alias rr='ranger'
 
