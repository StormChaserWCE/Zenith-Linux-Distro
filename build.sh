#!/bin/bash

# 1. Install Lorax, Anaconda, and dependencies
# Added --allowerasing to fix the conflict and removed the generic-release package
dnf install -y --allowerasing lorax anaconda anaconda-tui curl git

# 2. Clean up any previous attempts
rm -rf ./output

# 3. Download the official Fedora KDE base kickstarts
curl -L -o fedora-live-kde.ks https://pagure.io/fedora-kickstarts/raw/main/f/fedora-live-kde.ks
curl -L -o fedora-live-base.ks https://pagure.io/fedora-kickstarts/raw/main/f/fedora-live-base.ks

# 4. Build the ISO
livemedia-creator --make-iso --ks zenith-linux.ks \
--project "Zenith Linux Alpha" \
--releasever 40 \
--volid Zenith-Linux \
--resultdir ./output \
--no-virt