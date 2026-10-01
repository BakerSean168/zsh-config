# zsh-config

Personal portable Zsh configuration, independently versioned for Linux/WSL/VPS use.

This repository owns the Zsh configuration itself. Host selection/composition belongs to the separate personal configuration orchestration layer; machine-local paths and secrets remain local.

## Install directly

```bash
git clone git@github.com:BakerSean168/zsh-config.git ~/.config/zsh-config
~/.config/zsh-config/install.sh
```

The installer backs up an existing non-symlink `~/.zshrc`, then symlinks it to this repository. It also creates `~/.zsh_local` and `~/.zsh_secrets` from examples when they do not already exist.

## Update

```bash
cd ~/.config/zsh-config
git pull --ff-only
```

No reinstall is required while `~/.zshrc` remains a symlink.

## Local boundaries

- `~/.zsh_local`: non-secret, machine-specific PATH additions and aliases.
- `~/.zsh_secrets`: API keys/tokens and other secrets; never committed.
- This repository does not own system package installation, Neovim configuration, SSH server policy, or host inventory.
