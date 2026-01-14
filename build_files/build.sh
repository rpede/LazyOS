#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
dnf5 install -y --setopt=install_weak_deps=False \
  zsh zoxide fzf eza bat neovim \
  yazi btop zellij ripgrep golang-github-jesseduffield-lazygit tree-sitter-cli \
  lightdm lightdm-gtk niri noctalia-shell ghostty \
  cava \
  cliphist \
  ddcutil \
  eza-zsh-completion \
  fontawesome-6-brands-fonts \
  fontawesome-6-free-fonts \
  gcc \
  ghostty-bat-syntax \
  ghostty-neovim \
  ghostty-shell-integration \
  ghostty-vim \
  ghostty-zsh-completion \
  gnome-keyring \
  gstreamer1-plugins-good-qt6 \
  inotify-tools \
  lsb_release \
  matugen \
  qt6-qttranslations \
  wlsunset \
  xdg-desktop-portal-gnome
#rocm-smi \
#power-profiles-daemon \

useradd -m -G wheel -s /bin/zsh lazy -p lazy

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
