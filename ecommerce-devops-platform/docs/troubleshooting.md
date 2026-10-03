# Troubleshooting Runbook

## Pod not running

```bash
kubectl get pods -n ecommerce
kubectl describe pod POD_NAME -n ecommerce
kubectl logs POD_NAME -n ecommerce
```

## Deployment failure

```bash
kubectl rollout status deployment/ecommerce-app -n ecommerce
kubectl rollout history deployment/ecommerce-app -n ecommerce
kubectl rollout undo deployment/ecommerce-app -n ecommerce
```

## Service problem

```bash
kubectl get svc -n ecommerce
kubectl get endpoints -n ecommerce
kubectl describe svc ecommerce-service -n ecommerce
```

## High CPU

```bash
kubectl top pods -n ecommerce
kubectl top nodes
kubectl describe pod POD_NAME -n ecommerce
kubectl logs POD_NAME -n ecommerce
```

Check Prometheus metrics and Grafana dashboards before changing resources.

## High HTTP 5xx

1. Identify the affected deployment/version.
2. Check pod logs.
3. Check recent rollout.
4. Check Prometheus error-rate query.
5. Compare with the previous healthy version.
6. Roll back if the release is confirmed as the cause.
