#!/usr/bin/env bash
set -euxo pipefail

echo "==> Setting up SvelteKit environment..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Node.js not found, installing..."
    
    # Install Node.js LTS via NodeSource
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
    
    # Verify installation
    node -v
    npm -v
else
    echo "Node.js already installed: $(node -v)"
fi

echo "==> Initializing SvelteKit project..."
npx sv create . \
  --template minimal \
  --types ts \
  --add prettier eslint vitest="usages:unit,component" tailwindcss="plugins:typography,forms" sveltekit-adapter="adapter:auto" devtools-json \
  --no-add-ons \
  --install npm \
  --no-dir-check
# ... rest of your SvelteKit setup commands
