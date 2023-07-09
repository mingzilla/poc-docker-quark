##########################
# ENV NODE_OPTIONS=--max_old_space_size=8192

FROM node:20
WORKDIR /code
VOLUME /code

# COPY code/package.json /code/package.json
# COPY run_in_docker__entrypoint.sh /code/run_in_docker__entrypoint.sh
# RUN chmod 777 /code/run_in_docker__entrypoint.sh

# RUN npm install -y

EXPOSE 5173
ENTRYPOINT [ "/code/run_in_docker__entrypoint.sh", "-l", "-c" ]
