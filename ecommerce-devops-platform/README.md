# AI-Powered E-Commerce DevOps & Cloud-Native Delivery Platform

A production-style DevOps portfolio project that connects source control, CI/CD, containers, infrastructure as code, configuration management, Kubernetes, monitoring, logging, security and AI-assisted troubleshooting.

## Architecture

```text
Developer
   |
 GitHub
   |
 Jenkins
   |-- Tests
   |-- Security
   |-- Docker Build
   |-- Docker Push
   |
 Docker Registry
   |
 Kubernetes
   |-- Ingress
   |-- Service
   |-- Deployment
   |-- Pods
   |
   +--> Prometheus --> Grafana
   |
   +--> Centralized Logs
   |
   +--> Alerts --> AI Analysis --> Human Approval
```

## Repository

```text
app/                  Flask e-commerce application
scripts/              Operational Bash scripts
Dockerfile            Container image
docker-compose.yml    Local app + monitoring stack
Jenkinsfile            CI/CD pipeline
k8s/                  Kubernetes manifests
helm/                 Helm chart
terraform/            AWS infrastructure
ansible/              Host configuration
monitoring/           Prometheus/Grafana configuration
elk/                  Centralized logging resources
security/             Security scan scripts/configuration
docs/                 Architecture and operational documentation
```

## Quick start

Requirements:

- Ubuntu/Linux
- Git
- Docker
- Docker Compose

Run:

```bash
git clone YOUR_REPOSITORY_URL
cd ecommerce-devops-platform
chmod +x scripts/*.sh security/*.sh
./scripts/start.sh
```

Open:

- Application: http://localhost:8080
- Prometheus: http://localhost:9090
- Grafana: http://localhost:3000

Grafana local credentials:

```text
username: admin
password: admin
```

Change the password for any shared or production environment.

## Kubernetes

Replace `YOUR_DOCKERHUB_USER` in the Kubernetes/Helm configuration with your Docker Hub username.

```bash
kubectl apply -f k8s/
kubectl get all -n ecommerce
```

## Terraform

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
```

Review AWS costs before creating infrastructure. Destroy test infrastructure when finished:

```bash
terraform destroy
```

## Security

Run:

```bash
./security/gitleaks.sh
./security/trivy-scan.sh
./security/checkov-scan.sh
```

These tools should be integrated into Jenkins for the CI/CD demonstration.

## Deployment strategies

The project demonstrates:

- Rolling updates
- Rollout verification
- Rollback
- Canary/blue-green design documentation
- Health checks
- Kubernetes readiness/liveness probes

## Monitoring

Application exposes:

```text
/metrics
/health
/ready
```

Prometheus scrapes `/metrics`.

Important signals:

- Request rate
- HTTP 5xx rate
- Request latency
- Pod health
- CPU/memory
- Restarts

## Incident demonstration

Generate application errors:

```bash
curl http://localhost:8080/api/error
```

Then inspect:

```bash
curl http://localhost:9090
```

For Kubernetes:

```bash
kubectl get pods -n ecommerce
kubectl logs -n ecommerce deploy/ecommerce-app
kubectl describe deployment ecommerce-app -n ecommerce
```

## Project objectives

- Centralized version control
- Linux operational environment
- Automation
- Containerization
- CI/CD
- Infrastructure as Code
- Configuration management
- Kubernetes
- Monitoring
- Centralized logging
- Security
- Controlled deployment
- Cloud deployment
- AI-assisted troubleshooting
- Repeatable software delivery lifecycle

## Production hardening checklist

Before calling this production-ready, add:

- TLS certificates
- External DNS
- AWS Load Balancer Controller
- AWS Secrets Manager / External Secrets
- ECR instead of a public registry
- IAM least privilege
- Private EKS endpoint where appropriate
- Network policies
- Pod Security Admission
- Persistent storage where required
- Alertmanager notification channels
- Grafana dashboards
- Backup/restore testing
- Resource quotas and limits
- Image signing and provenance
- Dependency pinning and automated updates

## License

Use this repository as a learning and portfolio project. Add the license required by the original e-commerce application's source code if you are redistributing that application.
