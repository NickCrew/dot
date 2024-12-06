export LS_COLORS=${LS_COLORS:-$(paste -sd: $ZDOTDIR/lscolors.txt)}


zstyle ':autocomplete:*complete*:*' insert-unambiguous yes                     
zstyle ':autocomplete:*history*:*' insert-unambiguous yes                     
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes                         

# Completers                                                                       
zstyle ':completion:*' completer _extensions _complete _approximate

# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

# Insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# Offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Completers
# Complete the alias when _expand_alias is used as a function
zstyle ':completion:*' complete true
zstyle ':completion:alias-expension:*' completer _expand_alias

# Allow you to select in a menu
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true


# Allow one error for every three characters typed in approximate completer
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' \
        max-errors 'reply=($((($#PREFIX+$#SUFFIX)/2))numeric)'

# Add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=$color[cyan]=$color[red]"

# Complete processes
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:processes-names' command 'ps axho command'

# Colors for files and directory
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases

# Expand globs when tab-completing
zstyle ':completion:*' glob 'yes'

# Don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

# Don't let ../<tab> match $PWD
zstyle ':completion:*' ignore-parents parent pwd

# Don't match the same filenames multiple times
zstyle ':completion::*:(rm|vim|kill|diff):*' ignore-line true

# SSH Completion
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })' 

zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr



