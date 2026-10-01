#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd "$(dirname "$0")" && pwd)
TARGET="$HOME/.zshrc"
STAMP=$(date +%Y%m%d%H%M%S)

if [[ -e "$TARGET" && ! -L "$TARGET" ]]; then
  cp -a "$TARGET" "$TARGET.backup.$STAMP"
fi
ln -sfn "$ROOT/zshrc" "$TARGET"

if [[ ! -e "$HOME/.zsh_local" ]]; then
  cp "$ROOT/zsh_local.example" "$HOME/.zsh_local"
fi
if [[ ! -e "$HOME/.zsh_secrets" ]]; then
  cp "$ROOT/zsh_secrets.example" "$HOME/.zsh_secrets"
  chmod 600 "$HOME/.zsh_secrets"
fi

printf 'zsh-config installed: %s -> %s\n' "$TARGET" "$ROOT/zshrc"
