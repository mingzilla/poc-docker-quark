#!/bin/bash

echo "copy the command from the file to execute if it doesn't work directly in windows"
echo ""

# docker container run -it --rm -p 5173:5173 -v ${pwd}/code:/code --env OPTION=install --name quark-dev-1.0-c quark-dev-1.0
# docker container run -it --rm -p 5173:5173 -v ${pwd}/code:/code --env OPTION=dev --name quark-dev-1.0-c quark-dev-1.0
# docker container run -it --rm -p 5173:5173 -v ${pwd}/code:/code --env OPTION=build --name quark-dev-1.0-c quark-dev-1.0

RUN_OPTION=$1

if [[ "$RUN_OPTION" == "install" || "$RUN_OPTION" == "dev" || "$RUN_OPTION" == "test" || "$RUN_OPTION" == "build" ]]; then
    docker container run -it --rm -p 5173:5173 -v ${pwd}/code:/code --env OPTION=${ARG} --name quark-dev-1.0-c quark-dev-1.0
fi

echo ""
read -n 1 -s -r -p "Press any key to continue"
