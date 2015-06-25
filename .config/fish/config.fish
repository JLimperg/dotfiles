set -e fish_greeting

set -gx PATH ~/bin /opt/bin $PATH
set -gx EDITOR vim
set -gx VISUAL vim
set -gx PAGER less
set -gx MANPAGER 'less -isR'

# Aliases

alias mpva 'mpv --no-video'
alias cal 'cal -m'
alias pdflatex 'pdflatex -interaction nonstopmode'
alias xclip 'xclip -selection c'
alias mailx 'mkdir -p /tmp/mailx; and env TMPDIR=/tmp/mailx mailx'
alias suspend 'sudo /usr/sbin/pm-suspend'

alias tournaman="wine ~/'.wine/drive_c/Program Files (x86)/Tournaman/Tournaman.exe'"
alias vgaon "xrandr --output VGA1 --auto --primary --output LVDS1 --off; and xrandr --output LVDS1 --auto"
alias vgaoff "xrandr --output VGA1 --off"

function dox
  xinit $argv > ~/.xinit.log 2>&1 &
end
