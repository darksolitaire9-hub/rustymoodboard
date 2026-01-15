#!/bin/bash
set -e

echo "==> Installing Rust WASM tools..."

rustup target add wasm32-unknown-unknown
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh

# Verify installations
rustc --version
wasm-pack --version

echo "✓ Rust WASM tools installed successfully"
