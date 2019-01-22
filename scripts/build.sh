export TAG="10.50.0.199/examples/hello-nodejs"
npm install
docker build -t "hello-nodejs" .
docker tag "hello-nodejs" "$TAG:$BUILD_NUMBER"
docker tag "hello-nodejs" "$TAG:latest"
docker push "$TAG:$BUILD_NUMBER"
docker push "$TAG:latest"
