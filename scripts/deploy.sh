set -x
cat k8s/deployment.tmpl.yaml | sed "s/{{BUILD_NUMBER}}/34/g" > deployment.yaml
cat k8s/service.tmpl.yaml | sed "s/{{BUILD_NUMBER}}/34/g" > service.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
