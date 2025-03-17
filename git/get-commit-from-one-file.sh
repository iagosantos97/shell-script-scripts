#!/bin/bash

FILENAME=

for commit in $(git log --pretty=format:"%H %s" $FILENAME | cut -d " " -f1);
do 
  mkdir -p results/$commit
  git show $commit:$FILENAME > results/$commit/completo.json
  git diff $commit^..$commit $FILENAME > results/$commit/diff.txt
done;
