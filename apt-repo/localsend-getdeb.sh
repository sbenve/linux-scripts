#!/bin/bash
#<name>_<version>-<revision>_<architecture>.deb
name="localsend"
version="1.14.0"
revision="1"
architecture="amd64"
package="$name"
description="Comparte archivos a dispositivos cercanos"
section="net"
area="non-free"
homepage="https://localsend.org"
destdir="$HOME/Paquetes/build"

deb_url=https://github.com/localsend/localsend/releases/download/v$version/LocalSend-$version-linux-x86-64.deb

wget $deb_url -O "$destdir"/"$name"_"$version"-"$revision"_"$architecture".deb
