#!/usr/bin/env bash

set -o errexit
set -o nounset

GrainsOnSquare() {
  printf "%u\n" "$((2**($1 - 1)))"
}

main() {
  if [ "$1" = "total" ]; then
    result=0
    for ((i=1; i<=64; i++)); do
      value=$(GrainsOnSquare $i)
      result=$(($result+$value))
    done
    
    printf "%u\n" $result
    return 0
  fi

  if (("$1" <= "0")) || (("$1" > "64")); then
    echo "Error: invalid input"
    return 1
  fi

  result=$(GrainsOnSquare $1)
  echo $result
  return 0
}

main "$@"
