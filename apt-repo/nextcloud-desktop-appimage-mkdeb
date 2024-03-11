#!/bin/bash
#<name>_<version>-<revision>_<architecture>.deb
name="nextcloud-desktop-appimage"
version="3.12.1"
revision="1"
architecture="all"
package="$name"
maintainer_name="Sebastián Benvenuti"
maintainer_email="sebastian@sbit.com.ar"
description="Cliente de escritorio para Nextcloud"
section="net"
area="non-free"
depends="nextcloud-desktop-common"
breaks=""
homepage="https://nextcloud.com"
destdir="$HOME/Paquetes/build"

originaldir="$PWD"
pkgdir=/tmp/"$name""_$version""-$revision""_$architecture"
srcdir="$pkgdir/SOURCE"
rm -rf "$pkgdir" 2>/dev/null
mkdir -v -p "$pkgdir"/DEBIAN
touch "$pkgdir"/DEBIAN/control

echo "Package: $package
Version: $version-$revision
Architecture: $architecture
Maintainer: $maintainer_name "'<'"$maintainer_email"'>' >> "$pkgdir"/DEBIAN/control

echo "Depends: $depends" >> "$pkgdir"/DEBIAN/control
echo "Breaks: $breaks" >> "$pkgdir"/DEBIAN/control
echo "Section: $area/$section
Homepage: $homepage
Description: $description" >> "$pkgdir"/DEBIAN/control

mkdir -p "$pkgdir"/usr/local/bin
mkdir -p "$pkgdir"/usr/local/share/applications
#get appimage
wget https://github.com/nextcloud-releases/desktop/releases/latest/download/Nextcloud-$version-x86_64.AppImage -O "$pkgdir"/usr/local/bin/nextcloud-desktop.appimage
echo "[Desktop Entry]
Categories=Utility;X-SuSE-SyncUtility;
Type=Application
Exec=/usr/local/bin/nextcloud-desktop.appimage %u
Name=Nextcloud Desktop
Comment=Nextcloud desktop synchronization client
GenericName=Folder Sync
Icon=Nextcloud
Keywords=Nextcloud;syncing;file;sharing;
X-GNOME-Autostart-Delay=3
MimeType=application/vnd.nextcloud;x-scheme-handler/nc;" > "$pkgdir"/usr/local/share/applications/nextcloud-desktop-appimage.desktop
#acomoda los permisos de archivos y directorios
chmod +x "$pkgdir"/usr/local/bin/*
#genera mk5sum de los archivos
touch "$pkgdir/DEBIAN/md5sums"
find "$pkgdir" -type f -exec md5sum {} \; | grep -v DEBIAN | sed s#"$pkgdir"/##g >> "$pkgdir"/DEBIAN/md5sums

#build deb package
dpkg-deb --build --root-owner-group $pkgdir && echo "Excelente, paquete creado $pkgdir.deb"
mv -v $pkgdir.deb "$destdir"/
rm -rf "$pkgdir"
