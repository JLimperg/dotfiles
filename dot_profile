if which emacsclient &> /dev/null; then
  export VISUAL="/usr/bin/emacsclient -a /usr/bin/vim"
else
  export VISUAL=vim
fi

export EDITOR="$VISUAL"
export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/.elan/bin:${HOME}/.mathlib/bin:${PATH}"

source ~/.opam/opam-init/init.sh &> /dev/null || true

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

if [ -e /home/jannis/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jannis/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
