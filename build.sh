#!/bin/bash
# Install build tools
dnf install -y livecd-tools lorax curl

# Download the required Fedora base kickstarts
curl -L https://pagure.io/fedora-kickstarts/raw/main/fedora-live-kde.ks -o fedora-live-kde.ks
curl -L https://pagure.io/fedora-kickstarts/raw/main/fedora-live-base.ks -o fedora-live-base.ks
curl -L https://pagure.io/fedora-kickstarts/raw/main/fedora-live-minimization.ks -o fedora-live-minimization.ks

# Download the Bliss Wallpaper so the Kickstart can find it
mkdir -p /usr/share/backgrounds/zenith/
curl -L "https://upload.wikimedia.org/wikipedia/en/2/27/Bliss_%28Windows_XP_wallpaper%29.jpg" -o /usr/share/backgrounds/zenith/zenith-default.jpg

# Run the ISO Creator
livecd-creator --config=zenith-linux.ks --fslabel=Zenith-Linux-Alpha --cache=/var/cache/live