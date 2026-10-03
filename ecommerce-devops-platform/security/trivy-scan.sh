#!/usr/bin/env bash
set -euo pipefail
IMAGE="${1:-ecommerce-devops-platform:local}"
trivy image --severity HIGH,CRITICAL --ignore-unfixed "$IMAGE"
