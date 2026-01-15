#!/usr/bin/env bash
set -euxo pipefail

echo "==> Setting up SvelteKit environment..."

# Ensure Node.js exists
if ! command -v node &> /dev/null; then
    echo "Node.js not found, installing..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
    node -v
    npm -v
else
    echo "Node.js already installed: $(node -v)"
fi

echo "==> Initializing SvelteKit project..."

npx --yes sv create . \
  --template minimal \
  --types ts \
  --add prettier eslint vitest="usages:unit,component" tailwindcss="plugins:typography,forms" sveltekit-adapter="adapter:auto" devtools-json \
  --install npm \
  --no-dir-check

echo "Done installing sveltekit"