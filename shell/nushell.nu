# dotbins - Add platform-specific binaries to PATH
let _os = $nu.os-info | get name
let _os = if $_os == "darwin" { "macos" } else { $_os }

let _arch = $nu.os-info | get arch
let _arch = if $_arch == "x86_64" { "amd64" } else if $_arch in ["aarch64", "arm64"] { "arm64" } else { $_arch }

$env.PATH = ($env.PATH | prepend $"($nu.home-path)/.dotfiles/($_os)/($_arch)/bin")
# Tool-specific configurations
# Configuration for zoxide
if (which zoxide) != null {
    eval "$(zoxide init __DOTBINS_SHELL__)"
}

