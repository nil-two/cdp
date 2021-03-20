#!/usr/bin/env bats

readonly cdp=$BATS_TEST_DIRNAME/../cdp
readonly tmpdir=$BATS_TEST_DIRNAME/../tmp
readonly stdout=$BATS_TEST_DIRNAME/../tmp/stdout
readonly stderr=$BATS_TEST_DIRNAME/../tmp/stderr
readonly exitcode=$BATS_TEST_DIRNAME/../tmp/exitcode

setup() {
  mkdir -p -- "$tmpdir"
}

teardown() {
  rm -rf -- "$tmpdir"
}

check() {
  printf "%s\n" "" > "$stdout"
  printf "%s\n" "" > "$stderr"
  printf "%s\n" "0" > "$exitcode"
  "$@" > "$stdout" 2> "$stderr" || printf "%s\n" "$?" > "$exitcode"
}

@test 'cdp: prints usage if no arguments passed' {
  check "$cdp"
  [[ $(cat "$exitcode") == 1 ]]
  [[ $(cat "$stderr") =~ ^usage ]]
}

@test 'cdp: prints usage if double dash passed' {
  check "$cdp" --
  [[ $(cat "$exitcode") == 1 ]]
  [[ $(cat "$stderr") =~ ^usage ]]
}

@test 'cdp: outputs message to use "cdp -h" if unknown mode passed' {
  check "$cdp" --vim
  [[ $(cat "$exitcode") == 1 ]]
  [[ $(cat "$stderr") != "" ]]
}

@test 'cdp: outputs guidance to use "cdp -w" if directory passed' {
  check "$cdp" /
  [[ $(cat "$exitcode") == 1 ]]
  [[ $(cat "$stderr") =~ ^"cdp: shell integration not enabled" ]]
}

@test 'cdp: outputs guidance to use "cdp -w" if directory passed with double dash' {
  check "$cdp" -- /
  [[ $(cat "$exitcode") == 1 ]]
  [[ $(cat "$stderr") =~ ^'cdp: shell integration not enabled' ]]
}

# vim: ft=bash
