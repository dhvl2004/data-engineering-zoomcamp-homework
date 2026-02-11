#!/usr/bin/env bash

set -e

echo "Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh

echo "Verifying uv installation..."
uv --version

echo "Running uv sync --locked..."
uv sync --locked

echo "Setup complete."
