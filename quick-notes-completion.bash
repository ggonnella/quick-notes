#!/usr/bin/env bash
#
# %-PURPOSE-%
# Bash auto-completion for quick-notes
#

_ggscripts_quicknotes_complete()
{
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  if [[ "$COMP_CWORD" == 1 && "$cur" == "-"* ]]; then
    opts="-t --vi --tags -a --help"
    COMPREPLY=( $(compgen -W "$opts" -- $cur) )
  elif [[ "$COMP_CWORD" == 2 && "$prev" == "-t" ]]; then
    opts=""
    for tag in $(${COMP_WORDS[0]} --tags); do
      opts="$opts $tag"
    done
    COMPREPLY=( $(compgen -W "$opts" -- $cur) )
  fi
}

complete -F _ggscripts_quicknotes_complete learned
complete -F _ggscripts_quicknotes_complete questions
complete -F _ggscripts_quicknotes_complete installed
complete -F _ggscripts_quicknotes_complete bookmark
