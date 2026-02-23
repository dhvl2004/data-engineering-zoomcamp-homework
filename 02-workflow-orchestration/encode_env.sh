#!/bin/bash

while IFS= read -r line || [ -n "$line" ]; do
  # skip comments and empty lines
  case "$line" in
    ''|\#*) continue ;;
  esac

  key="${line%%=*}"
  value="${line#*=}"

  # base64 encode value (no wrapping)
  b64="$(printf %s "$value" | base64 | tr -d '\n')"

  printf 'SECRET_%s=%s\n' "$key" "$b64"
done < .env > .env_encoded