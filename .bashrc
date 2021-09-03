# For non-interactive shells, we quit immediately
if [[ $- != *i* ]] ; then
  return
fi

shopt -s extglob
umask 002

# For whatever godforsaken reason, GPG isn't smart enough to figure this out by
# itself.
export GPG_TTY=$(tty)

# Use fish as the shell
if which fish &> /dev/null; then
  SHELL=fish exec fish
fi
