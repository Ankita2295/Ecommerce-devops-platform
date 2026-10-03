#!/usr/bin/env bash
set -euo pipefail
BACKUP_DIR="${BACKUP_DIR:-./backups}"
mkdir -p "$BACKUP_DIR"
STAMP="$(date +%Y%m%d-%H%M%S)"
tar --exclude='./.git' --exclude='./backups' -czf "$BACKUP_DIR/ecommerce-devops-$STAMP.tar.gz" .
echo "Backup created: $BACKUP_DIR/ecommerce-devops-$STAMP.tar.gz"
