#!/usr/bin/env bash
set -euo pipefail
docker compose up -d --build
docker compose ps
echo "App:        http://localhost:8080"
echo "Prometheus: http://localhost:9090"
echo "Grafana:    http://localhost:3000 (admin/admin)"
