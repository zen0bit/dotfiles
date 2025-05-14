#!/usr/bin/env bash
#set -eu pipefail
# Void Linux post installation script

progname="post"
version="0.0.2"

_check() {
	cmd="$1"
	if command -v "$cmd" >/dev/null 2>&1; then
		return 1
	fi
}

# root check
if [ "$(id -u)" != 0 ]; then
	if [ -f /usr/bin/sudo ]; then
		echo "$(tput bold)INFO: Using sudo for root operations.$(tput sgr0)"
		root="sudo"
	elif [ -f /usr/bin/doas ]; then
		echo "$(tput bold)INFO: Using doas for root operations.$(tput sgr0)"
		root="doas"
	fi
fi

_g() {
	gum style --border rounded --border-foreground "#14a113" --padding "0 1" "$@"
}

_y() {
	gum style --border rounded --border-foreground "#fdde13" --padding "0 1" "$@"
}

_r() {
	gum style --border rounded --border-foreground "#e50203" --padding "0 1" "$@"
}

_super() {
	local HEADER=""
	local HEADER1=""
	HEADER1=$(_r "$@")
	HEADER=$(_y "$HEADER1")
	_g "$HEADER"
}
HEADER="\n\npersonal Void Linux installer\n                   v${version}\n"
HEADER2="personal Void Linux installer
                      v${version}"
_check gum && echo -e "$HEADER" || _super "$HEADER2"

$root xbps-install -Suv
_check xxadopt && $root xbps-install -y xtools
_check gum && xi -y gum
_g "System updated"

string_to_file() {
	if [ "$#" -ne 2 ]; then
		echo "Usage: add_to_file <file> <string>"
		return 1
	fi
	local file="$1"
	local string="$2"
	if ! grep -q "$string" "$file"; then
		echo "$string" >> "$file"
	fi
}

update_locale() {
	# Usage: update_locale -a|-d 'language'
	local action="$1"
	local TO="$2"
	case "$action" in
		-a)
			if grep -q "#$TO" /etc/default/libc-locales; then
				$root sed -i "/^#.*$TO/s/^#//" /etc/default/libc-locales
				RE='yes'
			fi
			;;
		-d)
			if ! grep -q "#$TO" /etc/default/libc-locales; then
				$root sed -i "/^$TO/s/^/#/" /etc/default/libc-locales
				RE='yes'
			fi
			;;
	esac
}

to_path() {
	local pridat_na_konec="$1"
	local nova_cesta="$2"
	if [[ ":$PATH:" != *":$nova_cesta:"* ]]; then
		if [[ "$pridat_na_konec" == "-e" ]]; then
			export PATH="$PATH:$nova_cesta"
			echo "Cesta '$nova_cesta' byla přidána na konec PATH."
		else
			export PATH="$nova_cesta:$PATH"
			echo "Cesta '$nova_cesta' byla přidána na začátek PATH."
		fi
	else
		echo "Cesta '$nova_cesta' již je v PATH."
	fi
}

function _select_de() {
	gum filter --height 10 cinnamon gnome kde lxqt enlightenment
}

function _select_vm() {
	gum filter --height 10 awesome hyprland labwc openbox
}

_g "INSTALLATION"
CHOICE=$(gum filter --height 9 "custom" "desktop AMD" "desktop Nvidia" "server" "vm")
case $CHOICE in
	custom)
		_custom
		exit 0
		;;
	'desktop AMD')
		;;
	'desktop Nvidia')
		_desktop_nvidia
		exit 0
		;;
	server)
		_server
		exit 0
		;;
	vm)
		_vm
		exit 0
		;;
	*)
		exit 1
		;;
esac

_g "Environment"
CHOICE=$(gum filter --height 6 DE WM none)
case $CHOICE in
	DE)
		( _select_de )
		;;
	WM)
		( _select_wm )
		;;
	none)
		;;
esac

_g "Installing packages from Void repositories"
# Other packages could be hidden as dependencies...
install_xbps() {
	PACKAGES=(
	 # base packages
	 bash-completion
	 #bash-language-server
	 dbus                  #
	 polkit                #
	 seatd
	 fastfetch
	 btop
	 topgrade
	 age
	 unzip
	 zstd
	 tar
	 gnome-keyring
	 sops
	 dtrx
	 xdg-desktop-portal
	 xdg-desktop-portal-wlr
	 xdg-utils
	 udiskie
	 # File Systems
	 bcachefs-tools
	 cryptsetup
	 exfat-utils
	 fuse-exfat
	 f2fs-tools
	 lvm2
	 mtools
	 ntfs-3g
	 udftools
	 util-linux
	 # Recovery
	 testdisk
	 # Void specific
	 vsv
	 vpm
	 fuzzypkg
	 void-docs-browse
	 # AMD drivers
	 linux-firmware-amd
	 mesa-vulkan-radeon
	 ROCm-SMI
	 # Display manager
	 greetd
	 wlgreet
	 # Graphic drivers
	 mesa-dri
	 vulkan-loader
	 mesa-vaapi
	 mesa-vdpau
	 # Audio
	 pipewire
	 wireplumber
	 pavucontrol
	 alsa-pipewire #TODO: test without
	 alsa-plugins-pulseaudio
	 # Video
	 mpv
	 yewtube
	 # Networking
	 NetworkManager
	 nfs-utils
	 sv-netmount
	 mosh
	 curl
	 wget
	 zsync
	 tailscale
	 # Window Manager
	 #pillow-avif
	 #pillow-heif
	 #pillow-jxl
	 azote
	 mako
	 grim
	 grimshot
	 ImageMagick
	 starship
	 SwayNotificationCenter
	 #swaylock
	 #swayidle
	 wlr-randr
	 papirus-icon-theme
	 papirus-folders
	 # labwc
	 labwc
	 yambar
	 # hyprland
	 #
	 # Terminal tools
	 kitty
	 bat
	 difftastic
	 exo
	 shellcheck
	 lazygit
	 tealdeer
	 zoxide
	 zellij
	 helix
	 yazi
	 sheldon
	 uv
	 # Theming
	 gtk-engine-murrine
	 sassc
	 # Tools for desktop
	 geany{,-plugins}
	 gparted
	 meld
	 pcmanfm
	 seahorse
	 yad
	 # quickemu
	 spice-gtk
	 #ebg
	 # Fonts
	 noto-fonts-{emoji,ttf}
	 noto-fonts-ttf-{extra,variable}
	 #nerd-fonts
	 # Virtualization
	 qemu
	 qemu-img
	 #quickemu
	)
	
	# Install all packages
	xi "${PACKAGES[@]}"
}
install_xbps

_g "Hyprland WM"
install_hyprland() {
	if [ ! -f /etc/xbps.d/hyprland-void.conf ]; then
		$root mkdir -p /etc/xbps.d
		string_to_file /tmp/hyprland-void.conf "repository=https://raw.githubusercontent.com/Makrennel/hyprland-void/repository-x86_64-glibc"
		$root mv /tmp/hyprland-void.conf /etc/xbps.d/
		$root xbps-install -S hyprland xdg-desktop-portal-hyprland
	fi
}
install_hyprland

_g "Installing Python packages"
install_python() {
	_check dotbot && uv tool install dotbot
	_check dotbins && uv tool install dotbins && uv tool update-shell
}
install_python

_g "Sourcing .bashrc"
# source bashrc to see dotbins
. $HOME/.bashrc

# Get old dotbins configuration
#dotbins get https://github.com/zen0bit/dotbins/blob/dotbins.yml

_g "dotfiles"
if [ ! -d $HOME/.dotfiles ]; then
	cd $HOME && git clone "https://github.com/zen0bit/dotfiles" .dotfiles && cd .dotfiles && ./install
fi
cd /tmp/
#git clone https://github.com/oSoWoSo/dotbot-xi
#cp dotbot-xi/xi.py $HOME/.dotfiles/plugins/
cd $HOME/.dotfiles/
dotbot -d $HOME/.dotfiles -c install.conf.yaml --plugin-dir plugins --force-color

# Install not in Void

_g "FONTS"
# Choose your nerd-font here: https://www.nerdfonts.com/font-downloads
$root mkdir -p /usr/local/share/fonts
cd /tmp/
curl -fsSLO "https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/Noto/Mono/NotoMonoNerdFont-Regular.ttf"
curl -fsSLO "https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/Noto/Mono/NotoMonoNerdFontMono-Regular.ttf"
curl -fsSLO "https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/Noto/Mono/NotoMonoNerdFontPropo-Regular.ttf"
$root cp *.ttf /usr/share/fonts/
# From release
# https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Noto.tar.xz

_g "THEMES"
# Catppuccin
if [ ! -d "/usr/share/themes/Catppuccin-Green-Dark" ]; then
	$root mkdir -p /usr/share/themes
	cd /tmp/
	git clone "https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme" catppuccin
	#cp -r catppuccin $HOME/.themes/
	cd catppuccin/themes
	chmod a+x install.sh
	$root ./install.sh -t green
fi
# Graphite
if [ ! -d "/usr/share/themes/Graphite-green" ]; then
	cd /tmp/
	git clone "https://github.com/vinceliuice/Graphite-gtk-theme" graphite
	cd graphite
	chmod a+x install.sh
	$root ./install.sh -t green --tweaks darker colorful
fi

# Material theme
#if [ ! -d "$HOME/.themes/Material-DeepOcean-BL" ]; then
#	mkdir -p $HOME/.themes
#	cd /tmp/
#	git clone "https://github.com/Fausto-Korpsvart/Material-GTK-Themes" material
#	cd material
#	cp -r themes/* $HOME/.themes/
#fi

_g "xxtools"
_check /usr/local/bin/xxautobump && cd /tmp/ &&
	git clone --depth 1 "https://github.com/Piraty/xxtools" &&
	cd xxtools && $root mkdir -p /usr/local/bin &&
	$root cp -n xx* /usr/local/bin/ &&
	PATH="/opt/bin:$PATH" #TODO: check

_g "auto-cpufreq"
_check /usr/local/bin/auto-cpufreq && cd /tmp/ &&
	git clone "https://github.com/AdnanHodzic/auto-cpufreq" &&
	cd auto-cpufreq && $root ./auto-cpufreq-installer

_g "DistroBox"
_check /usr/local/bin/distrobox && cd /tmp/ &&
	curl -fsSL "https://raw.githubusercontent.com/89luca89/distrobox/main/install" -o distrobox.sh &&
	$root chmod a+x distrobox.sh && $root ./distrobox.sh --next --prefix /usr/local

_g "Ollama"
_check ollama && cd /tmp/ &&
	curl -fsSL "https://ollama.com/install.sh" -o ollama.sh &&
	$root chmod a+x ollama.sh && $root ./ollama.sh

_g "Gattino"
# A kitty terminal extension that turns plain language into commands using Ollama.
if [ ! -d "$HOME/.config/kitty/gattino" ]; then
	mkdir -p $HOME/.config/kitty
	cd $HOME/.config/kitty
	git clone "https://github.com/salvozappa/gattino"
	string_to_file $HOME/.config/kitty/kitty.conf "map ctrl+shift+g kitten gattino/gattino.py"
fi

_g "Oh My Bash"
if [ ! -d /usr/local/share/oh-my-bash ]; then
	export OSH="$HOME/.config/oh-my-bash"
	cd /tmp/ && curl -fsSL "https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh" -o osh.sh
	chmod a+x osh.sh && $root ./osh.sh --prefix=/usr/local --unattended
fi

_g "Zide"
if [ ! -d $HOME/.config/zide ]; then
	cd $HOME/.config &&
	git clone https://github.com/josephschmitt/zide &&
	string_to_file $HOME/.bashrc "export PATH=$PATH:$HOME/.config/zide/bin"
fi

# Git projects
_g "qqX"
mkdir -p $HOME/git/
cd $HOME/git/
_check qqx && git clone "https://github.com/TuxVinyards/qqX.git" qqx

_g "ebg"
if [ ! -d $HOME/git/ebg ]; then
	git clone "https://github.com/BashGui/easybashgui" ebg
	#ln -s lib/easybashlib easybashlib && ln -s lib/easybashgui.lib easybashgui.lib
	cd "$HOME/git/ebg/"
	$root make install
fi

# My projects
_g "Distrohopper"
mkdir -p $HOME/projekty
cd $HOME/projekty
_check dh && git clone "git@github.com:oSoWoSo/DistroHopper.git" dh

_g "piu"
_check piu && git clone "git@github.com:oSoWoSo/piu.git"

_g "vbm"
_check vbm && git clone "git@github.com:oSoWoSo/vbm.git"

_g "gumak"
_check gumak && git clone "git@github.com:oSoWoSo/gumak.git"

# Link projects
$root ln -fs $HOME/git/qqx/qqX /usr/local/bin/qqx
$root ln -fs $HOME/projekty/dh/dh /usr/local/bin/
$root ln -fs $HOME/projekty/dh/quickget /usr/local/bin/
$root ln -fs $HOME/projekty/dh/quickemu /usr/local/bin/
#$root ln -fs $HOME/projekty/dh/quicktest /usr/local/bin/
$root ln -fs $HOME/projekty/dh/chunkcheck /usr/local/bin/
$root ln -fs $HOME/projekty/piu/piu /usr/local/bin/
$root ln -fs $HOME/projekty/vbm/vbm.sh /usr/local/bin/vbm
$root ln -fs $HOME/projekty/gumak/gumak /usr/local/bin/
#$root ln -s $HOME/projekty// /usr/local/bin/

_g "AM"
_check am && cd /tmp/ &&
wget -nv "https://raw.githubusercontent.com/ivan-hc/AM/main/INSTALL" &&
	chmod +x ./INSTALL && $root ./INSTALL

_g "Zen Browser"
_check zen-browser && am -i zen-browser

_g "KDE connect"
# Install kdeconnect (in repos but no dependencies with AppImage)
_check kdeconnect && am -i kdeconnect #not work as expected without: qt6-declarative

_g "Void packages"
_check $HOME/void/xbps-src && cd $HOME &&
	git clone "https://github.com/void-linux/void-packages" void &&
	cd void && ./xbps-src binary-bootstrap

_g "CONFIGURATION"
zoxide init bash >/dev/null
string_to_file $HOME/.bashrc 'eval "$(zoxide init bash)"'
if [ ! -f /home/z/.config/tealdeer/config.toml ]; then
	tldr --seed-config
fi
xlocate -S
if [ -s $HOME/.local/bin/env ]; then
	echo "dbus-run-session labwc" > $HOME/.local/bin/env
fi

_g "LOCALES"
update_locale -a "cs_CZ.UTF-8"
update_locale -a "en_US.UTF-8" # Only for mosh ???
if [ "$RE" == 'yes' ]; then
	$root xbps-reconfigure -f glibc-locales
fi

_g "GROUPS"
$root usermod -a -G _seatd $USER
$root usermod -a -G _greeter $USER

_g "AUDIO"
$root mkdir -p /etc/pipewire/pipewire.conf.d
$root ln -fs /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/

_g "SERVICES"
SERVICES=(
	dbus
	polkit
	sshd
	seatd
	netmount
	nfs-server
	rpc-bind
	statd
	tailscaled
	NetworkManager
	greetd
)

for service in ${SERVICES[@]}; do
	$root ln -fs /etc/sv/$service /var/service/
done && rm -f /var/service/dhcpcd

DONE1=$(_r "Done

  'RESTART' is good idea

Up to you...")

DONE2=$(_y "$DONE1")
_g "$DONE2"
