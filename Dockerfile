ARG BASE_IMAGE=node:latest
FROM ${BASE_IMAGE}
USER root

COPY . /usr/src/app/
WORKDIR /usr/src/app

EXPOSE 8080
CMD [ "node", "src/server.js" ]
