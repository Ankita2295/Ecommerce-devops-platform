#!/usr/bin/env bash
set -euo pipefail
URL="${1:-http://localhost:8080/health}"
curl -fsS "$URL"
echo
