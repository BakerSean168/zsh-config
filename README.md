# zsh-config

Personal portable Zsh configuration, independently versioned for Linux/WSL/VPS use.

This repository owns the Zsh configuration itself. Host selection/composition belongs to the separate personal configuration orchestration layer; machine-local paths and secrets remain local.

## Install directly

```bash
git clone https://github.com/BakerSean168/zsh-config.git ~/.config/zsh-config
~/.config/zsh-config/install.sh
```

The installer backs up an existing non-symlink `~/.zshrc`, then symlinks it to this repository. It also creates `~/.zsh_local` and `~/.zsh_secrets` from examples when they do not already exist.

## Update

```bash
cd ~/.config/zsh-config
git pull --ff-only
```

No reinstall is required while `~/.zshrc` remains a symlink.

## Development toolchains

When mise is installed, zshrc activates it automatically. Go, Node.js,
pnpm and other runtime versions belong to the host's
~/.config/mise/config.toml or the project's mise.toml, not this shared Zsh
repository. Hosts that do not use mise retain guarded Go/NVM fallback paths.
Keep machine-specific additions in ~/.zsh_local.

WSL uses the personal-config wsl-dev profile to compose this repository with
Tmux and Neovim. The historical dotfiles repository is archived and should
not receive new changes.

## Local boundaries

- `~/.zsh_local`: non-secret, machine-specific PATH additions and aliases.
- `~/.zsh_secrets`: API keys/tokens and other secrets; never committed.
- This repository does not own system package installation, Neovim configuration, SSH server policy, or host inventory.

## Reuse and privacy

This repository contains a reusable Zsh setup, not machine credentials. Install
[Oh My Zsh](https://ohmyz.sh/) and the referenced plugins separately if needed.
Keep local PATH/aliases in `~/.zsh_local` and tokens in `~/.zsh_secrets`;
neither file should be committed. `zsh_local.example` and
`zsh_secrets.example` are intentionally placeholders. Installation backs up an
existing `~/.zshrc` before switching it to this checkout.

Licensed under [MIT](LICENSE).
