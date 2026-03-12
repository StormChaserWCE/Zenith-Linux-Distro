# --- Zenith-Linux Custom Kickstart ---
# Base: Fedora KDE Plasma
# Wallpaper: Classic Bliss (Windows XP)
# Version: 0.1 (Alpha)

# 1. Installation Source (CRITICAL: Added this)
url --url="https://dl.fedoraproject.org/pub/fedora/linux/releases/40/Everything/x86_64/os/"

# 2. Pull in the Fedora Base
%include fedora-live-kde.ks

# 3. Package Selection
%packages
neofetch
fastfetch
git
util-linux-user
dracut-live
@kde-desktop
-rekonq
%end

# 4. Post-Installation Scripting
%post
# --- Branding Updates ---
sed -i 's/PRETTY_NAME=.*/PRETTY_NAME="Zenith-Linux"/' /etc/os-release
sed -i 's/^NAME=.*/NAME="Zenith-Linux"/' /etc/os-release
sed -i 's/^ID=fedora/ID=zenith-linux\nID_LIKE=fedora/' /etc/os-release

# Set the default hostname
echo "zenith-desktop" > /etc/hostname

# --- Bliss Wallpaper Implementation ---
mkdir -p /usr/share/backgrounds/zenith/
# Note: Ensure build.sh actually places the jpg here or it will be empty!
chmod 644 /usr/share/backgrounds/zenith/zenith-default.jpg

# KDE Plasma Script to force the wallpaper on first login
mkdir -p /usr/share/plasma/shell/init/
cat <<EOF > /usr/share/plasma/shell/init/00-zenith-wallpaper.js
var allDesktops = desktops();
for (var i = 0; i < allDesktops.length; i++) {
    var d = allDesktops[i];
    d.wallpaperPlugin = "org.kde.image";
    d.currentConfigGroup = Array("Wallpaper", "org.kde.image", "General");
    d.writeConfig("Image", "file:///usr/share/backgrounds/zenith/zenith-default.jpg");
}
EOF

# --- Terminal Tweaks ---
echo "neofetch" >> /etc/skel/.bashrc

# Custom Login Message (MOTD)
cat <<EOF > /etc/motd
Welcome to Zenith-Linux
The peak of Fedora-based KDE Plasma.
Wallpaper: Classic Bliss
EOF

# THIS IS THE KEY: The %end must be AFTER all your scripts!
%end