#!/usr/bin/env bash
# dotbins - Add platform-specific binaries to PATH
_os=$(uname -s | tr '[:upper:]' '[:lower:]')
[[ "$_os" == "darwin" ]] && _os="macos"

_arch=$(uname -m)
[[ "$_arch" == "x86_64" ]] && _arch="amd64"
[[ "$_arch" == "aarch64" || "$_arch" == "arm64" ]] && _arch="arm64"

export PATH="$HOME/.dotfiles/$_os/$_arch/bin:$PATH"

# Tool-specific configurations
# Configuration for atuin
#if command -v atuin >/dev/null 2>&1; then
#    [[ -f /usr/bin/bash-preexec.sh ]] && source /usr/bin/bash-preexec.sh
#    eval "$(atuin init bash --disable-up-arrow)"
#fi

# Configuration for bat
#if command -v bat >/dev/null 2>&1; then
#    alias bat="bat --paging=never"
#    #alias cat="bat --plain --paging=never"
#fi

# Configuration for eza
#if command -v eza >/dev/null 2>&1; then
#    alias l="eza --long --all --git --icons=auto"
#fi

# Configuration for fastfetch
if command -v fastfetch >/dev/null 2>&1; then
    alias fatsfetch='fastfetch -l none'
fi

# Configuration for fzf
if command -v fzf >/dev/null 2>&1; then
    eval "$(fzf --bash)"
fi

# Configuration for lazygit
if command -v lazygit >/dev/null 2>&1; then
    alias lg="lazygit"
fi

# Configuration for starship
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

# Configuration for zellij
#if command -v zellij >/dev/null 2>&1; then
#    eval "$(zellij setup --generate-auto-start bash)"
#fi

# Configuration for zen-browser
if command -v zen-browser >/dev/null 2>&1; then
    alias zen="zen-browser"
fi

# Configuration for zoxide
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
fi

