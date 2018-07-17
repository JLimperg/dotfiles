# For non-interactive shells, we quit immediately
if [[ $- != *i* ]] ; then
  return
fi

shopt -s extglob
umask 002

[ -x /usr/bin/opam ] && eval `opam config env`

# Use fish as the shell
[ -x /bin/fish ] && SHELL=/bin/fish exec /bin/fish
