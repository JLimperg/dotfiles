export VISUAL="/usr/bin/vim"
export EDITOR="/usr/bin/vim"
export PATH="/home/jannis/bin:/home/jannis/.local/bin:${PATH}"

opam=`which opam` &> /dev/null
[ $? -eq 0 ] && eval `"$opam" config env --shell=bash`

test -f "/home/jannis/.config/user-dirs.dirs" && source "/home/jannis/.config/user-dirs.dirs"
export XDG_DESKTOP_DIR
export XDG_DOCUMENTS_DIR
export XDG_DOWNLOAD_DIR
export XDG_MUSIC_DIR
export XDG_PICTURES_DIR
export XDG_VIDEOS_DIR

agent=$(command -v keychain)
if [ -x "$agent" ]; then
  eval $(keychain --quiet --eval)
fi
