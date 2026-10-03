# Security Controls

Recommended pipeline controls:

1. Gitleaks - detect committed secrets.
2. Trivy - scan container images and filesystems.
3. Checkov - scan Terraform/IaC.
4. SonarQube - static analysis and code quality.
5. Kubernetes RBAC - restrict access.
6. Kubernetes Secrets / AWS Secrets Manager - protect credentials.
7. Non-root containers - reduce container privileges.

Never commit real passwords, API keys, cloud credentials, or private keys.
