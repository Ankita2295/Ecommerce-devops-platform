#!/usr/bin/env bash
set -euo pipefail
docker compose down -v --remove-orphans || true
docker image prune -f
echo "Local containers, volumes and unused images cleaned."
