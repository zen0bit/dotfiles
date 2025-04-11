# .bashrc

LANG=cs_CZ.UTF-8
LANGUAGE=cs_CZ
# LC_CTYPE="cs_CZ.UTF-8"
# LC_NUMERIC="cs_CZ.UTF-8"
# LC_TIME="cs_CZ.UTF-8"
# LC_COLLATE="cs_CZ.UTF-8"
# LC_MONETARY="cs_CZ.UTF-8"
# LC_MESSAGES="cs_CZ.UTF-8"
# LC_PAPER="cs_CZ.UTF-8"
# LC_NAME="cs_CZ.UTF-8"
# LC_ADDRESS="cs_CZ.UTF-8"
# LC_TELEPHONE="cs_CZ.UTF-8"
# LC_MEASUREMENT="cs_CZ.UTF-8"
# LC_IDENTIFICATION="cs_CZ.UTF-8"
# #LC_ALL=

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias up='sudo vpm up'
alias vsv='sudo vsv'
alias ls='ls --color=auto'
alias lg='lazygit'
alias f='fuzzypkg'
alias ebrc='hx ~/.bashrc'
alias e.='hx ~/.config/$(ls ~/.config/ | fzf)'
alias vim='hx'

# void xbps-src aliases for building packages
# Edit template
edit_template() {
  if [[ -z "$1" ]]; then
    hx ~/void-packages/srcpkgs/$(ls ~/void-packages/srcpkgs/ | fzf)/template
  else
    hx "$HOME/void-packages/srcpkgs/$1/template"
  fi
}
# Build template
build_template() {
  if [[ -z "$1" ]]; then
    "$HOME/void-packages/xbps-src" pkg -CQ $(ls ~/void-packages/srcpkgs/ | fzf)
  else
    "$HOME/void-packages/xbps-src" pkg -CQ "$1"
  fi
}
alias xb=build_template "$@"
alias xe=edit_template "$@"

PS1='[\u@\h \W]\$ '

GITHUB_TOKEN=$(gh auth token) dotbins sync

#eval # shellcheck shell=bash

source $HOME/.dotbins/shell/bash.sh

#eval -- "$(/usr/bin/starship init bash --print-full-init)"

#[[ -f /usr/bin/bash-preexec.sh ]] && source /usr/bin/bash-preexec.sh
#eval "$(atuin init bash)"

#eval "$(zoxide init bash)"

#. "$HOME/.local/bin/env"

fastfetch -l none
