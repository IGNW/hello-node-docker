set -x
if [ -z $BASE_IMAGE ]; then
  BASE_IMAGE="node:10.15"
fi

if [ -z $DOCKER_REPO ]; then
  echo "ERROR: DOCKER_REPO is not defined."
  exit 1
fi

npm install
docker build --build-arg BASE_IMAGE=$BASE_IMAGE -t "hello-nodejs" .
docker tag "hello-nodejs" "$DOCKER_REPO:$BUILD_NUMBER"
docker tag "hello-nodejs" "$DOCKER_REPO:latest"
docker push "$DOCKER_REPO:$BUILD_NUMBER"
docker push "$DOCKER_REPO:latest"
