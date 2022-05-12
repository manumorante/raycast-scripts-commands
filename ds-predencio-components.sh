#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Components Predencio
# @raycast.mode fullOutput
# @raycast.icon 💅
# @raycast.packageName Design System

categories=('basics' 'general' 'playground')

# Test folder path
path=$HOME/projects/domestika/app/views/test

function links() {
  echo
  echo $cat
  cd ${path}/${cat}
  for i in $(find . -maxdepth 1 -type f); do
    name=$(echo $i | sed 's/\.html.haml//')
    name=$(echo $name | sed 's/\.//')
    echo "https://stg.domestika.org/test?q=${cat}${name}";
  done
}

for i in "${categories[@]}"; do
  cat=$i
  links
done