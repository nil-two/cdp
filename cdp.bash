cdp() {
  if [[ $# == 0 ]]; then
    cd ..
    return
  fi

  local query="$1"
  local wd="$(pwd)"
  local dir="$(echo "$wd" | sed "s#\\(/[^/]*$query[^/]*\\)/.*#\1#")"
  if [[ $dir != $wd && -d $dir ]]; then
    cd "$dir"
    return
  fi
}

_cdp() {
  local cur="${COMP_WORDS[COMP_CWORD]}"
  case "$cur" in
    '')
      COMPREPLY=( "$(pwd)" )
      ;;
    */*)
      COMPREPLY=( "$(dirname "$cur")" )
      ;;
    *)
      COMPREPLY=( "$(pwd | sed "s#\\(/[^/]*$cur[^/]*\\)/.*#\1#")" )
      ;;
  esac
  compopt -o nospace
}

complete -F _cdp cdp
