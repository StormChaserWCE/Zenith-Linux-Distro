#!/bin/bash

# 1. Install Lorax and dependencies
dnf install -y lorax curl git

# 2. Download the official Fedora KDE base kickstarts
# We need these because your zenith-linux.ks likely "includes" them
curl -L -o fedora-live-kde.ks https://pagure.io/fedora-kickstarts/raw/main/f/fedora-live-kde.ks
curl -L -o fedora-live-base.ks https://pagure.io/fedora-kickstarts/raw/main/f/fedora-live-base.ks

# 3. Create the output directory
mkdir -p ./output

# 4. Build the ISO using livemedia-creator
# Added --make-iso and fixed the directory flag
livemedia-creator --make-iso --ks zenith-linux.ks \
--project "Zenith Linux Alpha" \
--releasever 40 \
--volid Zenith-Linux \
--resultdir ./output \
--no-virt