set -e fish_greeting

set PATH ~/bin $PATH

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

# Nix

set SSL_CERT_FILE /etc/ssl/certs/ca-certificates.crt
set NIX_LINK "$HOME/.nix-profile"
set PATH     "$NIX_LINK/bin" "$NIX_LINK/sbin" $PATH
set NIX_PATH "$NIX_PATH:nixpkgs=$HOME/.nix-defexpr/nixpkgs"
set NIX_USER_PROFILE_DIR "$PROFILE_PREFIX/per-user/$USER"
set NIX_PROFILES /var/lib/nix/profiles/default "$HOME/.nix-profile"
set NIX_USER_GCROOTS_DIR /var/lib/nix/gcroots/per-user/$USER

if test $USER -eq root
  set -e NIX_REMOTE
else
  set NIX_REMOTE daemon
end

for p in $NIX_PROFILES
  set PATH $p/bin $PATH
end