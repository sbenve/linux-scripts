#!/bin/bash
repodir="/srv/http/apt-repo"
repo="stable"
branch="main"

cd $repodir/
dpkg-scanpackages --arch amd64 pool/ > dists/$repo/$branch/binary-amd64/Packages
cat dists/$repo/$branch/binary-amd64/Packages | gzip -9 > dists/$repo/$branch/binary-amd64/Packages.gz
cd $repodir/dists/$repo/
/usr/local/bin/generate-release.sh > Release
chown www-data:www-data "$repodir" -R
