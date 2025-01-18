#!/bin/bash

if [ ! $# == 2 ] # abandon if two arguments are not passed
then
  echo "Failed: Please pass in two arguments!"
  exit 1
fi

filesdir=$1  # path to a directory on the filesystem
searchstr=$2 # text string which will be searched within these files

if [ ! -d "$filesdir" ] # check if filesdir actually exists
then
  echo "Failed: ${filesdir} directory does not exist!"
  exit 1
fi

# determine the number of files in filesdir
count=$(find -L "$filesdir"/* | wc -l)

# search all files in filesdir for the string searchstr
matches=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are ${count} and the number of matching lines are ${matches}"

