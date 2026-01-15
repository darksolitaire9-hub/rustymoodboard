#!/bin/bash
set -e

echo "==> Initializing SvelteKit project..."

# Only run if not already initialized
if [ ! -f "package.json" ]; then
    npx sv create . --template minimal --types ts --install pnpm --no-interactive
else
    echo "SvelteKit already initialized, running install..."
    pnpm install
fi

echo "✓ SvelteKit initialized successfully"
