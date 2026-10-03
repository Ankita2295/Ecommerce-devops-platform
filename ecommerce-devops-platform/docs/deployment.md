# Deployment Guide

## Local

```bash
./scripts/start.sh
curl http://localhost:8080/health
```

## Kubernetes

Build and push the image:

```bash
docker build -t YOUR_DOCKERHUB_USER/ecommerce-devops-platform:1.0.0 .
docker push YOUR_DOCKERHUB_USER/ecommerce-devops-platform:1.0.0
```

Update `k8s/deployment.yaml` with your image and apply:

```bash
kubectl apply -f k8s/
kubectl get pods -n ecommerce
kubectl get svc -n ecommerce
```

## Rolling update

```bash
kubectl -n ecommerce set image deployment/ecommerce-app   ecommerce=YOUR_DOCKERHUB_USER/ecommerce-devops-platform:1.1.0

kubectl -n ecommerce rollout status deployment/ecommerce-app
```

## Rollback

```bash
kubectl -n ecommerce rollout history deployment/ecommerce-app
kubectl -n ecommerce rollout undo deployment/ecommerce-app
```

## Helm

```bash
helm upgrade --install ecommerce ./helm/ecommerce   --set image.repository=YOUR_DOCKERHUB_USER/ecommerce-devops-platform   --set image.tag=1.0.0   -n ecommerce --create-namespace
```
