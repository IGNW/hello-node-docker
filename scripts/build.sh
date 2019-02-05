set -x

$DEFAULT_BASE_IMAGE="node:10.15"

if [ -z $BASE_IMAGE ]; then
  echo "WARNING: BASE_IMAGE is not defined.  Defaulting to $DEFAULT_BASE_IMAGE"
  BASE_IMAGE="$DEFAULT_BASE_IMAGE"
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
