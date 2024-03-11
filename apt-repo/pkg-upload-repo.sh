#!/bin/bash
pkgdir="$HOME/Paquetes/build"
remoto_user=root
remoto_dir=/srv/http/apt-repo/pool/main
remoto_ip=10.26.49.2

echo '========='
echo "Paquetes:"
echo '========='
cd $pkgdir
du -h *.deb

echo '=================='
echo "Subiendo paquetes:"
echo '=================='
scp -s "$pkgdir"/*.deb $remoto_user@$remoto_ip:$remoto_dir

echo '========================='
echo 'Actualizando repositorio:'
echo '========================='
ssh $remoto_user@$remoto_ip new-repo-refresh.sh
