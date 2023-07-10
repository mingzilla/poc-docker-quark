##########################
# ENV NODE_OPTIONS=--max_old_space_size=8192

FROM node:20
WORKDIR /code
VOLUME /code

EXPOSE 5173
ENTRYPOINT [ "/code/run_in_docker____entrypoint.sh", "-l", "-c" ]
