Name:           zenith-settings
Version:        1.0
Release:        1%{?dist}
Summary:        Configuration and branding for Zenith-Linux
License:        MIT
BuildArch:      noarch

Source0:        wallpaper.jpg
Source1:        zenith-release

%description
This package contains the default theme, wallpapers, and 
OS-release information for Zenith-Linux.

%install
# Create directories in the build root
mkdir -p %{buildroot}/usr/share/backgrounds/zenith/
mkdir -p %{buildroot}/etc/

# Install the wallpaper
cp %{SOURCE0} %{buildroot}/usr/share/backgrounds/zenith/default-wallpaper.jpg

# Install the custom release file
cp %{SOURCE1} %{buildroot}/etc/zenith-release

%files
/usr/share/backgrounds/zenith/default-wallpaper.jpg
/etc/zenith-release

%changelog
* Thu Mar 12 2026 Your Name <you@example.com> - 1.0-1
- Initial release of Zenith branding