#!/bin/bash

# Adapted from https://stackoverflow.com/a/34676160

WORK_DIR=`mktemp -d`

# check if tmp dir was created
if [[ ! "$WORK_DIR" || ! -d "$WORK_DIR" ]]; then
  echo "Could not create temp directory"
  exit 1
fi

# echo "Created temp working directory $WORK_DIR"

# deletes the temp directory
function cleanup {      
  rm -rf "$WORK_DIR"
  # echo "Deleted temp working directory $WORK_DIR"
}

# register the cleanup function to be called on the EXIT signal
trap cleanup EXIT

# implementation of script starts here
echo "/***********************************************************************\\"
echo
SCRIPT_PATH="$PWD/$1"
(cd "$WORK_DIR" && "$SCRIPT_PATH")
echo
echo "\\***********************************************************************/"
echo
echo
echo
