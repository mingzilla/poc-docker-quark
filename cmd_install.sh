#!/bin/bash

echo "copy the command from the file to execute if it doesn't work directly in windows"
echo ""

docker container run -it --rm -p 5173:5173 -v ${pwd}/code:/code --env OPTION=install --name quark-dev-1.0-c quark-dev-1.0

echo ""
read -n 1 -s -r -p "Press any key to continue"
