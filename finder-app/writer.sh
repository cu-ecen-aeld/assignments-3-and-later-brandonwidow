#!/bin/bash

if [ ! $# == 2 ] # abandon if two arguments are not passed
then
  echo "Failed: Please pass in two arguments!"
  exit 1
fi

writefile=$1 # full path to a file (including filename) on the filesystem
writestr=$2  # text string which will be written within this file

dir=$(dirname $writefile) # extract the file directory to call with mkdir

if [ ! -d "$dir" ] # make a new dir if it doesn't exist yet
then 
  mkdir -p $dir
fi

touch $writefile # create the file

if [ -e "$writefile" ] # file should exist, but check anyway
then
  echo "${writestr}" >> $writefile # write the string to the file
else
  echo "Error: file cannot be found!"
  exit 1
fi

