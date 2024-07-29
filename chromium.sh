#!/bin/sh


# DOWNLOADING THE DEPENDENCIES
if test -f ./appimagetool; then
	echo " appimagetool already exists" 1> /dev/null
else
	echo " Downloading appimagetool..."
	wget -q "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage" -O appimagetool
fi
if test -f ./pkg2appimage; then
	echo " pkg2appimage already exists" 1> /dev/null
else
	echo " Downloading pkg2appimage..."
	wget -q https://raw.githubusercontent.com/ivan-hc/AM-application-manager/main/tools/pkg2appimage
fi
chmod a+x ./appimagetool ./pkg2appimage


DEBRELEASE="stable"


VERSION=87.0.4279.0

# ...BUILD THE APPIMAGE...

./pkg2appimage ./recipe.yml


# ...EXPORT THE APPDIR TO AN APPIMAGE!
ARCH=x86_64 ./appimagetool-x86_64.AppImage ./Chromium/Chromium.AppDir/

ls -lah

mv ./*.AppImage ./Chromium_Web_Browser-$VERSION-x86_64.AppImage
