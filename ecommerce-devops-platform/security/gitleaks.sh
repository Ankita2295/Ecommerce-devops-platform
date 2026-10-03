#!/usr/bin/env bash
set -euo pipefail
gitleaks detect --source . --redact
