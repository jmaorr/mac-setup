#!/bin/bash
set -euo pipefail

echo "=== Node Global Packages ==="

npm install -g wrangler@latest
npm install -g uipro-cli

echo "Node global packages installed."
