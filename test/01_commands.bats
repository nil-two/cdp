#!/usr/bin/env bats

readonly cdp=$BATS_TEST_DIRNAME/../cdp
readonly tmpdir=$BATS_TEST_DIRNAME/../tmp
readonly stdout=$BATS_TEST_DIRNAME/../tmp/stdout
readonly stderr=$BATS_TEST_DIRNAME/../tmp/stderr
readonly exitcode=$BATS_TEST_DIRNAME/../tmp/exitcode

setup() {
  if [[ $BATS_TEST_NUMBER == 1 ]]; then
    mkdir -p -- "$tmpdir"
  fi
}

teardown() {
  if [[ ${#BATS_TEST_NAMES[@]} == $BATS_TEST_NUMBER ]]; then
    rm -rf -- "$tmpdir"
  fi
}

check() {
  printf "%s\n" "" > "$stdout"
  printf "%s\n" "" > "$stderr"
  printf "%s\n" "0" > "$exitcode"
  "$@" > "$stdout" 2> "$stderr" || printf "%s\n" "$?" > "$exitcode"
}

@test 'cdp -w: outputs error if no arguments passed' {
  check "$cdp" -w
  [[ $(cat "$exitcode") == 1 ]]
  [[ $(cat "$stderr") != "" ]]
}

@test 'cdp -w: prints the wrapper for the shell if shell name passed' {
  check "$cdp" -w bash
  [[ $(cat "$exitcode") == 0 ]]
  [[ $(cat "$stdout") =~ ^'cdp() {' ]]
}

@test 'cdp -w: outputs error if the shell unsupported' {
  check "$cdp" -w vim
  [[ $(cat "$exitcode") == 1 ]]
  [[ $(cat "$stderr") != "" ]]
}

@test 'cdp -w: supports bash' {
  ! command -v bash > /dev/null && skip

  PATH="$PATH:$(dirname "$cdp")" check bash -c 'eval "$(cdp -w bash); cdp /usr; pwd"'
  [[ $(cat "$exitcode") == 0 ]]
  [[ $(cat "$stdout") == "/usr" ]]
}

@test 'cdp -h: prints usage' {
  check "$cdp" -h
  [[ $(cat "$exitcode") == 0 ]]
  [[ $(cat "$stdout") =~ ^usage ]]
}

# vim: ft=bash
