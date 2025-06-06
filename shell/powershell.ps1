# dotbins - Add platform-specific binaries to PATH
$os = "windows"

$arch = (Get-CimInstance -Class Win32_Processor).AddressWidth -eq 64 ? "amd64" : "386"

$env:PATH = "$HOME/.dotfiles\$os\$arch\bin" + [System.IO.Path]::PathSeparator + $env:PATH

