#!/bin/bash

# remove when stopped
# interactive tty
docker container run -it -p 5173:5173 -v ${pwd}/code:/code --name quark-3-c quark-3