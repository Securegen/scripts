#!/bin/bash -e

if [ -z ${cmHome+x} ]; then read -p "Enter the path to the build dir: " -e cmHome; fi

securegen="$(dirname "$(pwd)")"
visualId=$securegen/visualId

#Check if the visualId repo is present
if [ ! -d "$visualId" ]; then
        echo "Missing visualId repo."
        echo "Downloading..."
        git clone git@github.com:Securegen/visualId.git $visualId
fi

cmWallpaper=$cmHome/vendor/cm/overlay/common/frameworks/base/core/res/res
securegenWallpaper=$visualId/wallpapers

echo "Replacing wallpapers..."
yes | cp -rf $securegenWallpaper/default_wallpaper.jpg $cmWallpaper/drawable-sw720dp-nodpi/
yes | cp -rf $securegenWallpaper/default_wallpaper.jpg $cmWallpaper/drawable-hdpi/
yes | cp -rf $securegenWallpaper/default_wallpaper.jpg $cmWallpaper/drawable-xhdpi/
yes | cp -rf $securegenWallpaper/default_wallpaper.jpg $cmWallpaper/drawable-xxxhdpi/
yes | cp -rf $securegenWallpaper/default_wallpaper.jpg $cmWallpaper/drawable-xxhdpi/
yes | cp -rf $securegenWallpaper/default_wallpaper.jpg $cmWallpaper/drawable-sw600dp-nodpi/
yes | cp -rf $securegenWallpaper/default_wallpaper.jpg $cmWallpaper/drawable-nodpi/
echo "Done."

cmAnimation=$cmHome/vendor/cm/prebuilt/common/bootanimation
securegenAnimation=$visualId/bootanimation

echo "Replacing boot anination..."
yes | cp -rf $securegenAnimation/* $cmAnimation
rm -rf $cmAnimation/halfres/*.zip
cd $cmAnimation/halfres
sh $cmAnimation/halfres/generate-half-res-anims.sh
echo "Done."

cmTrebuchet=$cmHome/packages/apps/Trebuchet
securegenTrebuchet=$visualId/trebuchet/

cd $visualId
echo "Adjusting Trebuchet..."
yes | cp -rf $securegenTrebuchet/res/xml/*.xml $cmTrebuchet/res/xml
echo "Done."
