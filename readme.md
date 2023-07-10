# Summary
This creates a docker image to run a quark application

## Commands
* image - run cmd_image_build.sh to build the docker image
* install - run npm_install.sh, or in windows copy the content of the command from cmd_container_run.sh
* dev - run npm_run_dev.sh
* build - run npm_run_build.sh
* stop - to stop, run cmd_container_stop.sh, rarely need to do so because the container is auto removed when stopped
* wipe - to remove the image, run "docker image rm -f quark-dev-1.0"

## Important Note
* The reason this works in Docker, is because package.json has the server run on 0.0.0.0