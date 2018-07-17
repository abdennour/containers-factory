# Build

```sh
eval $(minikube docker-env);
docker build -t bitaddress-org:latest . ;

```
# Deploy

```sh
k run bitaddress \
    --image=bitaddress-org:latest \
    --image-pull-policy=IfNotPresent \
    --port=80 \
    --expose
# k expose deployment bitaddress --type=LoadBalancer --port=80
```

# Validate

```sh
minikube service bitaddress
```

# Clean up

```
kubectl delete deployment bitaddress
kubect  delete svc bitaddress
docker rmi bitaddress-org:latest
```