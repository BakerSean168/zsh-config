# ============================================================
#  Unified zsh configuration  (managed via dotfiles repo)
#  Source of truth: github.com/BakerSean168/dotfiles
#  Merged from the WSL + DO-bodysense setups.
# ============================================================

# ----- Oh My Zsh -----
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git docker zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# ----- Editor -----
export EDITOR='nvim'
export VISUAL='nvim'

# ----- PATH (all guarded so the SAME file is portable across machines) -----
# Neovim (installed under /opt on some hosts)
[ -d /opt/nvim-linux-x86_64/bin ] && export PATH="/opt/nvim-linux-x86_64/bin:$PATH"
[ -d /opt/nvim-linux64/bin ]      && export PATH="/opt/nvim-linux64/bin:$PATH"
[ -d /opt/nvim-linux-arm64/bin ]  && export PATH="/opt/nvim-linux-arm64/bin:$PATH"
# Go
[ -d /usr/local/go/bin ] && export PATH="$PATH:/usr/local/go/bin"
[ -d "$HOME/go/bin" ]     && export PATH="$PATH:$HOME/go/bin"
# Python uv
[ -f "$HOME/.local/bin/env" ] && source "$HOME/.local/bin/env"
# Node (nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ]          && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# opencode
[ -d "$HOME/.opencode/bin" ] && export PATH="$HOME/.opencode/bin:$PATH"

export NODE_OPTIONS="--max-old-space-size=8192"

# ----- Generic, portable aliases -----
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias vim='nvim'
alias vi='nvim'
alias mux='tmuxinator'

# ----- Machine-local secrets / host-specific aliases (NOT tracked) -----
# Put API keys and project aliases in ~/.zsh_secrets (gitignored everywhere).
# It is sourced automatically when present, so each host keeps its own.
[[ -f "$HOME/.zsh_secrets" ]] && source "$HOME/.zsh_secrets"
