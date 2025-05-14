# dotbins - Add platform-specific binaries to PATH
set -l _os (uname -s | tr '[:upper:]' '[:lower:]')
test "$_os" = "darwin"; and set _os "macos"

set -l _arch (uname -m)
test "$_arch" = "x86_64"; and set _arch "amd64"
test "$_arch" = "aarch64" -o "$_arch" = "arm64"; and set _arch "arm64"

fish_add_path $HOME/.dotfiles/$_os/$_arch/bin

