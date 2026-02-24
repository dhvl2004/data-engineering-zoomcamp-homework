#!/usr/bin/env bash

set -e

echo "Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh
uv --version

echo "Installing dbt-duckdb..."
pip install dbt-duckdb
dbt --version

cd /workspaces/data-engineering-zoomcamp-homework

echo "Setting up dbt profiles.yml..."
mkdir -p ~/.dbt
cp 04-analytics-engineering/profiles.yml ~/.dbt/profiles.yml

echo "Setting up 01-docker-terraform..."
cd 01-docker-terraform
uv sync --locked
cd ..

echo "Setting up 04-analytics-engineering..."
cd 04-analytics-engineering
uv sync --locked
cd taxi_rides_ny
uv run ingest.py
cd ..
cd ..

echo "Setup complete."
