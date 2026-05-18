#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
# Packages

sysadmin_packages=(
  "NetworkManager-tui"
  "virt-install"
  "virt-manager"
  "virt-viewer"
)

programming_packages=(
  "gh"
  "git-lfs"
)

# including firefox because vscode needs it
utility_packages=(
  "firefox"
  "stow"
)

obs_packages=(
  "obs-studio"
  "obs-studio-plugin-droidcam"
  "obs-studio-plugin-vaapi"
  "obs-studio-plugin-webkitgtk"
)

docker_packages=(
    "podman"
)

packages=(
  ${sysadmin_packages[@]}
  ${programming_packages[@]}
  ${utility_packages[@]}
  ${docker_packages[@]}
  ${obs_packages[@]}
)

# install rpms
dnf5 install -y ${packages[@]}

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket


#/ctx/build.sh
