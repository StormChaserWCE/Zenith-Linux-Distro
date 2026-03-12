#!/bin/bash

# 1. Install Lorax, Anaconda, and dependencies
dnf install -y --allowerasing lorax anaconda anaconda-tui curl git

# 2. Clean up
rm -rf ./output

# 3. Download the CORRECT Raw Fedora KDE base kickstarts
# These are the updated mirrors for Fedora 40
curl -fL -o fedora-live-kde.ks https://pagure.io/fedora-kickstarts/raw/f40/f/fedora-live-kde.ks
curl -fL -o fedora-live-base.ks https://pagure.io/fedora-kickstarts/raw/f40/f/fedora-live-base.ks

# 4. Build the ISO
mkdir -p /usr/share/backgrounds/zenith/
cp zenith-default.jpg /usr/share/backgrounds/zenith/ 2>/dev/null || echo "Wallpaper missing, skipping copy"
livemedia-creator --make-iso --ks zenith-linux.ks \
--project "Zenith Linux Alpha" \
--releasever 40 \
--volid Zenith-Linux \
--resultdir ./output \
--no-virt