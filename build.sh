#!/bin/bash

# 1. Install Lorax, Anaconda, and dependencies
# Added anaconda and generic-release-common to ensure the builder has the OS engine
dnf install -y lorax anaconda anaconda-tui curl git generic-release-common

# 2. Clean up any previous attempts (fixes the "results_dir should not exist" error)
rm -rf ./output

# 3. Download the official Fedora KDE base kickstarts
curl -L -o fedora-live-kde.ks https://pagure.io/fedora-kickstarts/raw/main/f/fedora-live-kde.ks
curl -L -o fedora-live-base.ks https://pagure.io/fedora-kickstarts/raw/main/f/fedora-live-base.ks

# 4. Build the ISO
# Using --make-iso and ensuring the resultdir is fresh
livemedia-creator --make-iso --ks zenith-linux.ks \
--project "Zenith Linux Alpha" \
--releasever 40 \
--volid Zenith-Linux \
--resultdir ./output \
--no-virt