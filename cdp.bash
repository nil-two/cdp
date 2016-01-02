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
  local wd="${COMP_WORDS[COMP_CWORD]:-$(pwd)}"
  COMPREPLY=( "$(dirname "$wd")" )
  compopt -o nospace
}

complete -F _cdp cdp
