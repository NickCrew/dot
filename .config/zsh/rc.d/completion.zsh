LS_COLORS=${LS_COLORS:-$(paste -sd: $ZDOTDIR/lscolors.txt)}
export LS_COLORS

# autoload -Uz compinit
# for dump in $ZDOTDIR/.zcompdump(N.mh+24); do
#   compinit $dump
# done
# compinit -C

zle -C _expand_alias complete-word _generic


zstyle ':autocomplete:*' default-context curcontext 
zstyle ':autocomplete:*' min-input 0
zstyle ':autocomplete:*complete*:*' insert-unambiguous yes                     
zstyle ':autocomplete:*history*:*' insert-unambiguous yes                     
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes                         

zstyle ':completion:*' completer _expand _complete _ignored _approximate _expand_alias
zstyle ':completion:*' use-cache on                                  
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' complete true
zstyle ':completion:*' menu select                                   
zstyle ':completion:*' verbose yes
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd    # Don't let ../<tab> match $PWD

# Complete the alias when _expand_alias is used as a function
zstyle ':completion:alias-expension:*' completer _expand_alias       

# Insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions             

# Offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters  

# Match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'                  

zstyle ':completion::*:(-command-|export):*' \
  fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}


zstyle ':completion:*:default' list-prompt '%S%M matches%s'

zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'

zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:corrections' format "- %d - (errors %e})"

zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'

zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

zstyle ':completion:*:match:*' original only                         

zstyle -e ':completion:*:approximate:*' \
  max-errors 'reply=($((($#PREFIX+$#SUFFIX)/2))numeric)'

# Process completion
zstyle ':completion:*:*:kill:*:processes' \
  list-colors "=(#b) #([0-9]#)*=$color[cyan]=$color[red]"

zstyle ':completion:*:*:kill:*:processes' \
  command 'ps --forest -A -o pid,user,cmd'

zstyle ':completion:*:processes-names' \
  command 'ps axho command'

# DEfault Colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} 

# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' \
  tag-order local-directories directory-stack path-directories

zstyle ':completion:*:complete:git:argument-1:' tag-order !aliases

# Expand globs when tab-completing
zstyle ':completion:*' glob 'yes'

# Don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

# Don't match the same filenames multiple times
zstyle ':completion::*:(rm|vim|kill|diff):*' ignore-line true

# SSH Completion
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' \
  hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })' 

zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'

zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr

zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'

zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr



