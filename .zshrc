# Path, Aliases

typeset -U path
path=(~/bin/ ~/.cabal/bin $path)

[[ -r .bash_aliases ]] && source ~/.bash_aliases
[[ -r .zsh_aliases ]]  && source ~/.zsh_aliases

# CDPath

typeset -U cdpath
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

# Completion

zstyle :compinstall filename '/home/jannis/.zshrc'
zstyle ':completion:*' special-dirs true

autoload -Uz compinit
compinit

# Misc

umask 002

# Key Fixes (per Arch wiki)

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi
