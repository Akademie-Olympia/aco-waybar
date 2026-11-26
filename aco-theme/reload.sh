#!/usr/bin/env bash
# Waybar re-reads its style on SIGUSR2.
set -euo pipefail
pkill -USR2 -x waybar || true
