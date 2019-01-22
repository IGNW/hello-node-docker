FROM 10.50.0.199/base/node:10.14.1
USER root

COPY . /usr/src/app/
WORKDIR /usr/src/app

EXPOSE 8080
CMD [ "node", "src/server.js" ]
