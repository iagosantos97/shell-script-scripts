#!/bin/bash

for dir in $(find . -maxdepth 1 -type f,d | cut -d "/" -f 2);do sudo du -sh $dir;done;