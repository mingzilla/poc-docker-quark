#!/bin/bash

docker container run -it --rm -p 5173:5173 -v ${pwd}/code:/code --env OPTION=install --name quark-dev-1.0-c quark-dev-1.0
