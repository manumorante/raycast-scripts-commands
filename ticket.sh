#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Ticket
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Get name from current branch
# @raycast.author Manu Morante
# @raycast.authorURL https://github.com/manumorante

cd /Users/manu/projects/domestika
branch_name=$(git rev-parse --abbrev-ref HEAD)

branch_name_splited=(${branch_name//-/ })
code=${branch_name_splited[1]}
ticket="[sc-$code]"
echo $ticket | pbcopy
echo "$ticket copied to clipboard"
