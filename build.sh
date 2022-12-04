#!/bin/bash
DIST=kinetic
WORKDIR=$(cat seafile.yml.template | grep app: | cut -d " " -f 2)
# Cleanup
rm -Rf $WORKDIR
rm seafile.yml
rm -Rf out

# Build AppImage:
cp seafile.yml.template seafile.yml
sed -i "s/DIST/$DIST/g" "seafile.yml"
# wget https://github.com/AppImage/pkg2appimage/releases/download/continuous/pkg2appimage-1807-x86_64.AppImage
chmod 700 pkg2appimage-1807-x86_64.AppImage
./pkg2appimage seafile.yml
cd out
APPNAME=$(ls Seafile*)
mv $APPNAME Seafile.AppImage
mv Seafile.AppImage ..
cd ..
rm -Rf out
rm -Rf $WORKDIR
rm -Rf seafile.yml