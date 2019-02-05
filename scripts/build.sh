set -x
if [ -z BASE_IMAGE ]; then
  BASE_IMAGE="node:10.15"
fi

if [ -z DOCKER_REPO ];
  echo "ERROR: DOCKER_REPO is not defined."
  exit 1
fi

npm install
docker build -t --build-arg BASE_IMAGE=$BASE_IMAGE "hello-nodejs" .
docker tag "hello-nodejs" "$TAG:$BUILD_NUMBER"
docker tag "hello-nodejs" "$TAG:latest"
docker push "$TAG:$BUILD_NUMBER"
docker push "$TAG:latest"
