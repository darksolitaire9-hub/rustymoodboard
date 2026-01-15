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

echo "==> Setting up pnpm via corepack..."
sudo corepack enable
corepack prepare pnpm@latest --activate
pnpm --version

echo "==> Initializing SvelteKit project..."

npx --yes sv create . \
  --template minimal \
  --types ts \
  --add prettier eslint vitest="usages:unit,component" tailwindcss="plugins:typography,forms" sveltekit-adapter="adapter:auto" devtools-json \
  --no-install \
  --no-dir-check

echo "==> Installing dependencies with pnpm..."
pnpm install

echo "Done setting up SvelteKit"