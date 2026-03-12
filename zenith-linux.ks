# --- Zenith-Linux Custom Kickstart ---
# Base: Fedora KDE Plasma
# Wallpaper: Classic Bliss (Windows XP)
# Version: 0.1 (Alpha)

# 1. Pull in the Fedora Base (Ensure these .ks files are in the same directory)
%include fedora-live-kde.ks

# 2. Package Selection
%packages
neofetch
fastfetch
git
util-linux-user
# You can add specific Zenith tools below
# zenith-settings  # Enable this once your RPM is in a repository
-rekonq            # Example: Remove unwanted default apps
%end

# 3. Post-Installation Scripting
%post
# --- Branding Updates ---
# Change the OS name in system files
sed -i 's/PRETTY_NAME=.*/PRETTY_NAME="Zenith-Linux"/' /etc/os-release
sed -i 's/^NAME=.*/NAME="Zenith-Linux"/' /etc/os-release
sed -i 's/^ID=fedora/ID=zenith-linux\nID_LIKE=fedora/' /etc/os-release

# Set the default hostname
echo "zenith-desktop" > /etc/hostname

# --- Bliss Wallpaper Implementation ---
# Create the directory and ensure the image exists 
# (This assumes your RPM or build script placed the file here)
mkdir -p /usr/share/backgrounds/zenith/
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
# Make neofetch run automatically when the user opens the terminal
echo "neofetch" >> /etc/skel/.bashrc

# Custom Login Message (MOTD)
cat <<EOF > /etc/motd
Welcome to Zenith-Linux
The peak of Fedora-based KDE Plasma.
Wallpaper: Classic Bliss
EOF

%end