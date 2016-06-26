__cdp_search_parent_directory() {
  local query=$1
  if [[ $query == "/" ]]; then
    echo "/"
    return
  fi
  pwd | sed "s#\($query[^/]*/\).*#\1#"
}

cdp() {
  if [[ $# == 0 ]]; then
    cd ..
    return
  fi

  local query=$1
  local dir=$(__cdp_search_parent_directory "$query")
  if [[ -d $dir && $dir != $(pwd) ]]; then
    cd "$dir"
    return
  fi
}

_cdp() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  case $cur in
    "")
      COMPREPLY=( "$(dirname "$(pwd)")" )
      ;;
    /)
      COMPREPLY=()
      ;;
    */*)
      COMPREPLY=( "$(dirname "$cur")" )
      ;;
    *)
      COMPREPLY=( "$(__cdp_search_parent_directory "$cur")" )
      ;;
  esac
  compopt -o nospace
}

complete -F _cdp cdp
