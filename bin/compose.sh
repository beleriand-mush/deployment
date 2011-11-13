#!/bin/sh
#
# compose.sh: a shell script for putting together help.txt, etc.
#
# Usage: compose.sh <directory>
# Example: compose.sh help
#
# This script calls index-files.pl
# 
# By Alan Schwartz (Javelin/Paul)
#

# These come from Configure
perl=/usr/bin/perl
test=test
cat=/bin/cat
rm=/bin/rm
echo=/bin/echo

# This process can eat CPU, so uncomment if you want to be nice
#/etc/renice +4 $$

# What subdirectories should we be processing?
dir=$1
if $test ! -d $dir; then
  $echo "Usage: compose.csh <directory>"
  exit 0
fi


# Ok, let's do 'em:
  cd $dir

  # Remove the old index
  $rm -f index.$dir

  # Build a new index, and tack it on.
  $echo Building index for $dir...
  if test -f $perl; then
    $cat *.$dir | tee ../$dir.txt | $perl ../index-files.pl $dir > index.$dir
    $cat ../$dir.txt | $perl ../index-files.pl $dir admin >> index.$dir
    $cat index.$dir >> ../$dir.txt
  else
    $cat *.$dir > ../$dir.txt
  fi
 
  cd ..

$echo Done.
