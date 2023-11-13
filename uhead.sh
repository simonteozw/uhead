#!/bin/bash
num_lines=20
use_bytes=false
unset num_bytes

handle_c() {
  use_bytes=true
  num_bytes=$1
}

handle_n() {
  use_bytes=false
  num_lines=$1
}

handle_nofile() {
  while IFS=$'\n' read -r line
  do
    echo $line
  done
}

handle_file_bytes() {
  # 1 char = 1 byte
  for i in $(seq 1 1);
  do
    IFS= read -n $num_bytes bytes
    echo $bytes
  done < $1
}

handle_file_lines() {
  for i in $(seq 1 $num_lines);
  do
    IFS= read -r line
    # check if line is empty (EOF)
    if [ -z "$line" ]; then
      break
    fi
    echo $line
  done < $1
}

while getopts c:n: flag
do
  case "${flag}" in
    c) handle_c $OPTARG;;
    n) handle_n $OPTARG;;
    ?) echo "Use -c for bytes and -n for lines, only 1 at a time"
  esac
done
shift $(($OPTIND -1))

# check if filename is given
if [ -z "$1" ]; then
  handle_nofile
else
  # check if reading bytes or lines
  if $use_bytes; then
    handle_file_bytes $1
  else
    handle_file_lines $1
  fi
fi
