# 🛠️ dotbins Tool Collection

[![dotbins](https://img.shields.io/badge/powered%20by-dotbins-blue.svg?style=flat-square)](https://github.com/basnijholt/dotbins) [![Version](https://img.shields.io/badge/version-2.2.1-green.svg?style=flat-square)](https://github.com/basnijholt/dotbins/releases)

This directory contains command-line tools automatically managed by [dotbins](https://github.com/basnijholt/dotbins).

## 📋 Table of Contents

- [What is dotbins?](#-what-is-dotbins)
- [Installed Tools](#-installed-tools)
- [Tool Statistics](#-tool-statistics)
- [Shell Integration](#-shell-integration)
- [Installing and Updating Tools](#-installing-and-updating-tools)
- [Quick Commands](#-quick-commands)
- [Configuration File](#-configuration-file)
- [Additional Information](#ℹ️-additional-information)

## 📦 What is dotbins?

**dotbins** is a utility for managing CLI tool binaries in your dotfiles repository. It downloads and organizes binaries for popular command-line tools across multiple platforms (macOS, Linux) and architectures (amd64, arm64).

**Key features:**

- ✅ **Cross-platform support** - Manages tools for different OSes and CPU architectures
- ✅ **No admin privileges** - Perfect for systems where you lack sudo access
- ✅ **Version tracking** - Keeps track of installed tools with update timestamps
- ✅ **GitHub integration** - Automatically downloads from GitHub releases
- ✅ **Simple configuration** - YAML-based config with auto-detection capabilities

Learn more: [github.com/basnijholt/dotbins](https://github.com/basnijholt/dotbins)

## 🔍 Installed Tools

| Tool | Repository | Version | Updated | Platforms & Architectures |
| :--- | :--------- | :------ | :------ | :------------------------ |
| [atuin](https://github.com/atuinsh/atuin) | atuinsh/atuin | 18.6.1 | May 14, 2025 | linux (amd64, arm64) |
| [bat](https://github.com/sharkdp/bat) | sharkdp/bat | 0.25.0 | May 14, 2025 | linux (amd64, arm64) |
| [btop](https://github.com/aristocratos/btop) | aristocratos/btop | 1.4.3 | May 14, 2025 | linux (amd64, arm64) |
| [delta](https://github.com/dandavison/delta) | dandavison/delta | 0.18.2 | May 14, 2025 | linux (amd64, arm64) |
| [difft](https://github.com/Wilfred/difftastic) | Wilfred/difftastic | 0.63.0 | May 14, 2025 | linux (amd64, arm64) |
| [eza](https://github.com/eza-community/eza) | eza-community/eza | 0.21.3 | May 14, 2025 | linux (amd64, arm64) |
| [fd](https://github.com/sharkdp/fd) | sharkdp/fd | 10.2.0 | May 14, 2025 | linux (amd64, arm64) |
| [fzf](https://github.com/junegunn/fzf) | junegunn/fzf | 0.62.0 | May 14, 2025 | linux (amd64, arm64) |
| [git-lfs](https://github.com/git-lfs/git-lfs) | git-lfs/git-lfs | 3.6.1 | May 14, 2025 | linux (amd64, arm64) |
| [glow](https://github.com/charmbracelet/glow) | charmbracelet/glow | 2.1.0 | May 14, 2025 | linux (amd64, arm64) |
| [gping](https://github.com/orf/gping) | orf/gping | gping-v1.19.0 | May 14, 2025 | linux (amd64, arm64) |
| [grex](https://github.com/pemistahl/grex) | pemistahl/grex | 1.4.5 | May 14, 2025 | linux (amd64, arm64) |
| [hx](https://github.com/helix-editor/helix) | helix-editor/helix | 25.01.1 | May 14, 2025 | linux (amd64, arm64) |
| [jless](https://github.com/PaulJuliusMartinez/jless) | PaulJuliusMartinez/jless | 0.9.0 | May 14, 2025 | linux (amd64, arm64) |
| [jq](https://github.com/jqlang/jq) | jqlang/jq | jq-1.7.1 | May 14, 2025 | linux (amd64, arm64) |
| [just](https://github.com/casey/just) | casey/just | 1.40.0 | May 14, 2025 | linux (amd64, arm64) |
| [keychain](https://github.com/funtoo/keychain) | funtoo/keychain | 2.9.2 | May 14, 2025 | linux (amd64, arm64) |
| [lazygit](https://github.com/jesseduffield/lazygit) | jesseduffield/lazygit | 0.50.0 | May 14, 2025 | linux (amd64, arm64) |
| [lnav](https://github.com/tstack/lnav) | tstack/lnav | 0.12.4 | May 14, 2025 | linux (amd64, arm64) |
| [lsd](https://github.com/lsd-rs/lsd) | lsd-rs/lsd | 1.1.5 | May 14, 2025 | linux (amd64, arm64) |
| [mcfly](https://github.com/cantino/mcfly) | cantino/mcfly | 0.9.3 | May 14, 2025 | linux (amd64, arm64) |
| [nodebro](https://github.com/jonaburg/nodebro) | jonaburg/nodebro | 0.3.0 | May 14, 2025 | linux (amd64, arm64) |
| [procs](https://github.com/dalance/procs) | dalance/procs | 0.14.10 | May 14, 2025 | linux (amd64, arm64) |
| [rg](https://github.com/BurntSushi/ripgrep) | BurntSushi/ripgrep | 14.1.1 | May 14, 2025 | linux (amd64, arm64) |
| [rip](https://github.com/MilesCranmer/rip2) | MilesCranmer/rip2 | 0.9.4 | May 14, 2025 | linux (amd64, arm64) |
| [sd](https://github.com/chmln/sd) | chmln/sd | 1.0.0 | May 14, 2025 | linux (amd64, arm64) |
| [starship](https://github.com/starship/starship) | starship/starship | 1.23.0 | May 14, 2025 | linux (amd64, arm64) |
| [tldr](https://github.com/tealdeer-rs/tealdeer) | tealdeer-rs/tealdeer | 1.7.2 | May 14, 2025 | linux (amd64, arm64) |
| [topgrade](https://github.com/topgrade-rs/topgrade) | topgrade-rs/topgrade | 16.0.3 | May 14, 2025 | linux (amd64, arm64) |
| [tre](https://github.com/dduan/tre) | dduan/tre | 0.4.0 | May 14, 2025 | linux (amd64, arm64) |
| [xplr](https://github.com/sayanarijit/xplr) | sayanarijit/xplr | 1.0.0 | May 14, 2025 | linux (amd64, arm64) |
| [yazi](https://github.com/sxyazi/yazi) | sxyazi/yazi | 25.4.8 | May 14, 2025 | linux (amd64, arm64) |
| [yq](https://github.com/mikefarah/yq) | mikefarah/yq | 4.45.4 | May 14, 2025 | linux (amd64, arm64) |
| [zellij](https://github.com/zellij-org/zellij) | zellij-org/zellij | 0.42.2 | May 14, 2025 | linux (amd64, arm64) |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | ajeetdsouza/zoxide | 0.9.7 | May 14, 2025 | linux (amd64, arm64) |

## 📊 Tool Statistics

<div align='center'><h3>📦 70 Tools | 💾 838.58 MB Total Size</h3></div>

| Tool | Total Size | Avg Size per Architecture |
| :--- | :-------- | :------------------------ |
| difft | 175.14 MB | 87.57 MB |
| lnav | 122.06 MB | 61.03 MB |
| atuin | 69.83 MB | 34.92 MB |
| zellij | 68.41 MB | 34.21 MB |
| lazygit | 40.28 MB | 20.14 MB |
| hx | 39.51 MB | 19.76 MB |
| glow | 32.23 MB | 16.11 MB |
| yazi | 28.54 MB | 14.27 MB |
| topgrade | 24.47 MB | 12.23 MB |
| git-lfs | 22.9 MB | 11.45 MB |
| yq | 20.95 MB | 10.48 MB |
| starship | 20.64 MB | 10.32 MB |
| nodebro | 17.79 MB | 8.89 MB |
| grex | 14.0 MB | 7.0 MB |
| delta | 12.88 MB | 6.44 MB |
| xplr | 12.09 MB | 6.04 MB |
| procs | 12.04 MB | 6.02 MB |
| rg | 11.28 MB | 5.64 MB |
| bat | 11.19 MB | 5.59 MB |
| mcfly | 10.11 MB | 5.06 MB |
| just | 8.62 MB | 4.31 MB |
| fzf | 7.33 MB | 3.66 MB |
| fd | 7.02 MB | 3.51 MB |
| tldr | 6.92 MB | 3.46 MB |
| gping | 6.61 MB | 3.31 MB |
| lsd | 6.43 MB | 3.22 MB |
| jless | 5.56 MB | 2.78 MB |
| sd | 4.48 MB | 2.24 MB |
| eza | 4.22 MB | 2.11 MB |
| jq | 3.84 MB | 1.92 MB |
| rip | 3.45 MB | 1.73 MB |
| tre | 3.45 MB | 1.73 MB |
| zoxide | 2.22 MB | 1.11 MB |
| btop | 1.99 MB | 1017.56 KB |
| keychain | 88.7 KB | 44.35 KB |

## 💻 Shell Integration

Add one of the following snippets to your shell configuration file to use the platform-specific binaries:

For **Bash**:
```bash
source $HOME/.dotfiles/shell/bash.sh
```

For **Zsh**:
```bash
source $HOME/.dotfiles/shell/zsh.sh
```

For **Fish**:
```fish
source $HOME/.dotfiles/shell/fish.fish
```

For **Nushell**:
```nu
source $HOME/.dotfiles/shell/nushell.nu
```

## 🔄 Installing and Updating Tools

### Install or update all tools
```bash
dotbins sync
```

### Install or update specific tools only
```bash
dotbins sync tool1 tool2
```

### Install or update for current platform only
```bash
dotbins sync --current
```

### Force reinstall of all tools
```bash
dotbins sync --force
```


## 🚀 Quick Commands

<details>
<summary>All available commands</summary>

```
dotbins list           # List all available tools
dotbins init           # Initialize directory structure
dotbins sync           # Install and update tools to their latest versions
dotbins readme         # Regenerate this README
dotbins status         # Show installed tool versions
dotbins get REPO       # Install tool directly to ~/.local/bin
```

For detailed usage information, run `dotbins --help` or `dotbins <command> --help`
</details>

## 📁 Configuration File

dotbins is configured using a YAML file (`dotbins.yaml`).
This configuration defines which tools to manage, their sources, and platform compatibility.

**Current Configuration:**

```yaml
# dotbins sample configuration
# Generated by `dotbins init`
# See https://github.com/basnijholt/dotbins for more information

# Directory where tool binaries will be stored
tools_dir: ~/.dotfiles

# Target platforms and architectures for which to download binaries
# These determine which system binaries will be downloaded and managed
platforms:
  linux:
    - amd64  # x86_64
    - arm64  # aarch64
#  macos:
#    - arm64  # Apple Silicon
#  windows:
#    - amd64  # 64-bit Windows

# Tool definitions
# Format: tool_name: owner/repo or detailed configuration
tools:
  # Essential CLI tools with minimal configuration
  atuin: atuinsh/atuin            # Shell history and recording tool
  #bandwhich: imsnif/bandwhich     # Terminal bandwidth utilization tool
  bat: sharkdp/bat                # Syntax-highlighted cat replacement
  #btm: ClementTsang/bottom        # Graphical system monitor
  btop: aristocratos/btop         # Resource monitor and process viewer
  #caddy: caddyserver/caddy        # Web server with automatic HTTPS
  #choose: theryangeary/choose     # Cut alternative with a simpler syntax
  #croc: schollz/croc              # File transfer tool with end-to-end encryption
  #ctop: bcicen/ctop               # Container metrics and monitoring
  #curlie: rs/curlie               # Curl wrapper with httpie-like syntax
  delta: dandavison/delta         # Syntax-highlighting pager for git and diff output
  difft: Wilfred/difftastic       # Structural diff tool that understands syntax
  #direnv: direnv/direnv           # Environment switcher for the shell
  #dog: ogham/dog                  # Command-line DNS client like dig
  #duf: muesli/duf                 # Disk usage analyzer with pretty output
  #dust: bootandy/dust             # More intuitive version of du (disk usage)
  #eget: zyedidia/eget             # Go single file downloader (similar to Dotbins)
  eza: eza-community/eza          # Modern replacement for ls
  fd: sharkdp/fd                  # Simple, fast alternative to find
  fzf: junegunn/fzf               # Command-line fuzzy finder
  git-lfs: git-lfs/git-lfs        # Git extension for versioning large files
  glow: charmbracelet/glow        # Markdown renderer for the terminal
  gping: orf/gping                # Ping with a graph
  grex: pemistahl/grex            # Command-line tool for generating regular expressions from user-provided examples
  #gron: tomnomnom/gron            # Make JSON greppable
  #hexyl: sharkdp/hexyl            # Command-line hex viewer
  hx: helix-editor/helix          # Modern text editor
  #hyperfine: sharkdp/hyperfine    # Command-line benchmarking tool
  #jc: kellyjonbrazil/jc           # JSON CLI output converter
  jless: PaulJuliusMartinez/jless # Command-line JSON viewer
  jq: jqlang/jq                   # Lightweight JSON processor
  just: casey/just                # Command runner alternative to make
  #k9s: derailed/k9s               # Kubernetes CLI to manage clusters
  lazygit: jesseduffield/lazygit  # Simple terminal UI for git commands
  lnav: tstack/lnav               # Log file navigator
  lsd: lsd-rs/lsd                 # Next-gen ls command with icons and colors
  mcfly: cantino/mcfly            # Fly through your shell history
  #micro: zyedidia/micro           # Modern and intuitive terminal-based text editor
  #micromamba: mamba-org/micromamba-releases # Conda-like distribution
  #navi: denisidoro/navi           # Interactive cheatsheet tool for the CLI
  #neovim: neovim/neovim           # Modern text editor
  nodebro: jonaburg/nodebro       # Golang TUI to track git tag releases on github
  #nu: nushell/nushell             # Modern shell for the GitHub era
  #pastel: sharkdp/pastel          # A command-line tool to generate, convert and manipulate colors
  procs: dalance/procs            # Modern replacement for ps
  rg: BurntSushi/ripgrep          # Fast grep alternative
  rip: MilesCranmer/rip2          # A safe and ergonomic alternative to rm
  sd: chmln/sd                    # Find & replace CLI
  #sk: skim-rs/skim                # Fuzzy finder for the terminal in Rust (similar to fzf)
  starship: starship/starship     # Minimal, fast, customizable prompt for any shell
  tldr: tealdeer-rs/tealdeer      # Fast tldr client in Rust
  topgrade: topgrade-rs/topgrade  # Upgrade all your tools at once
  tre:                            # Tree command with git awareness
    repo: dduan/tre
    arch_map:
      amd64: x86_64
      arm64: arm
    asset_patterns:
      linux:
        amd64: tre-v0.4.0-{arch}-unknown-linux-musl.tar.gz
        arm64: tre-v0.4.0-{arch}-unknown-linux-gnueabihf.tar.gz 
  #xh: ducaale/xh                  # Friendly and fast tool for sending HTTP requests
  xplr:                           # Hackable, minimal, fast TUI file explorer
    repo: sayanarijit/xplr
    asset_patterns:
      linux:
        amd64: xplr-linux.tar.gz
        arm64: xplr-linux-aarch64.tar.gz
  yazi: sxyazi/yazi               # Terminal file manager with image preview
  yq: mikefarah/yq                # YAML/XML/TOML processor similar to jq
  zellij: zellij-org/zellij       # Terminal multiplexer
  zoxide: ajeetdsouza/zoxide      # Smarter cd command with learning
  keychain: funtoo/keychain       # ssh-agent manager
```

## ℹ️ Additional Information

* This README was automatically generated on May 14, 2025
* Current platform: **linux/amd64**
* For more information on dotbins, visit https://github.com/basnijholt/dotbins