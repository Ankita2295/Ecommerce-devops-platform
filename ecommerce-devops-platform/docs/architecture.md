# Architecture

Developer -> GitHub -> Jenkins -> Security Checks -> Docker Registry -> Kubernetes

Kubernetes:
Ingress -> Service -> Deployment -> Pods

Operations:
Prometheus -> Grafana
Application/System logs -> Centralized logging
Alerts -> Human operator / AI troubleshooting assistant

Cloud:
Terraform -> AWS VPC -> EKS -> Worker Nodes
Ansible -> Host configuration where required
