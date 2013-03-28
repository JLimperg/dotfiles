# Path, Aliases
typeset -U path
path=(~/bin/ ~/.cabal/bin $path)

[[ -r .bash_aliases ]] && source ~/.bash_aliases
[[ -r .zsh_aliases ]]  && source ~/.zsh_aliases

# CDPath
cdpath=(. ~/prog ~/stud)

# Named Directories

prog=~/prog
stud=~/stud
portage=/etc/portage

# Options

setopt nobgnice nonotify nohup appendhistory incappendhistory histignoredups
setopt noclobber hashlistall cdablevars autocd extendedglob nomatch autonamedirs
bindkey -v

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000

# Prompt

autoload -U promptinit
promptinit; prompt gentoo

# Misc

umask 002

# The following lines were added by compinstall
zstyle :compinstall filename '/home/jannis/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

