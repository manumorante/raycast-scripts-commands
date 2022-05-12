#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Components
# @raycast.mode fullOutput
# @raycast.icon 💅
# @raycast.packageName Design System


cd $HOME/projects/frontend/packages/ds/src
for i in $(ls -d */);
do echo "https://frontend-ds.domestika.org/${i%%/}";
done
