You can specify the source of the Node base image to use as the base image.
This is useful if, for example, you need to use a base image from your local
repository.  If the argument is omitted, it will default to using node:latest
from the Docker Hub.



````
docker build --build-arg BASE_IMAGE=repo.com/dirname/node:version -t hello_nodejs .
docker run -d -p 8080:8080 hello_nodejs
````
