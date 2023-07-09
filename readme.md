# Summary
This creates a docker image to run a quark application

## Commands
* image - run cmd_image_build.sh to build the docker image
* install - copy the content of cmd_install.sh to execute in command line, which runs the 1st time
* stop - to stop, run cmd_container_stop.sh
* restart - to start again, run cmd_container_start.sh
* remove - to remove the container, run "docker container rm -f quark-3-c"
* wipe - to remove the image, run "docker image rm -f quark-3"

## Important Note
* The reason this works in Docker, is because package.json has the server run on 0.0.0.0