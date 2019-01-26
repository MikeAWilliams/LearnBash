#!/usr/bin/env bash

set -o errexit
set -o nounset

main() {
  digits=${#1}

  sum=0
  for ((i=0; i<digits; i++)); do
    digit=${1:i:1}
    sum=$(($sum+digit**digits))
  done
  
  if(("$sum" == "$1")); then
    echo true
  else
    echo false
  fi
  return 0
}

main "$@"
