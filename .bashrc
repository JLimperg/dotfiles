# For non-interactive shells, we quit immediately
if [[ $- != *i* ]] ; then
  return
fi

shopt -s extglob
umask 002

# Use fish as the shell
[ -x /bin/fish ] && SHELL=/bin/fish exec /bin/fish
