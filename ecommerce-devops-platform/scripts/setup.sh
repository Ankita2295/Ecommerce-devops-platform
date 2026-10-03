#!/usr/bin/env bash
set -euo pipefail
sudo apt-get update
sudo apt-get install -y git curl jq unzip ca-certificates
if ! command -v docker >/dev/null 2>&1; then
  sudo apt-get install -y docker.io docker-compose-plugin
  sudo systemctl enable --now docker
fi
echo "Setup complete."
