#!/bin/bash
set -e  # Exit on any error

echo "==> Installing system dependencies..."

sudo apt-get update
sudo apt-get install -y clang lld

echo "✓ System dependencies installed successfully"
