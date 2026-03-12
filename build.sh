#!/bin/bash

# 1. Install Lorax, Anaconda, and dependencies
dnf install -y --allowerasing lorax anaconda anaconda-tui curl git

# 2. Clean up any previous attempts
rm -rf ./output

# 3. Download the RAW Fedora KDE base kickstarts (Fixed URLs)
curl -fL -o fedora-live-kde.ks https://pagure.io/fedora-kickstarts/raw/main/f/fedora-live-kde.ks
curl -fL -o fedora-live-base.ks https://pagure.io/fedora-kickstarts/raw/main/f/fedora-live-base.ks

# 4. Build the ISO
livemedia-creator --make-iso --ks zenith-linux.ks \
--project "Zenith Linux Alpha" \
--releasever 40 \
--volid Zenith-Linux \
--resultdir ./output \
--no-virt