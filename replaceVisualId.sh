#!/bin/bash -e

if [ -z ${cmHome+x} ]; then read -p "Enter the path to the build dir: " -e cmHome; fi

visualId=$(pwd)

cmWallpaper=$cmHome/vendor/cm/overlay/common/frameworks/base/core/res/res

echo "Replacing wallpapers..."
yes | cp -rf wallpapers/default_wallpaper.jpg $cmWallpaper/drawable-sw720dp-nodpi/
yes | cp -rf wallpapers/default_wallpaper.jpg $cmWallpaper/drawable-hdpi/
yes | cp -rf wallpapers/default_wallpaper.jpg $cmWallpaper/drawable-xhdpi/
yes | cp -rf wallpapers/default_wallpaper.jpg $cmWallpaper/drawable-xxxhdpi/
yes | cp -rf wallpapers/default_wallpaper.jpg $cmWallpaper/drawable-xxhdpi/
yes | cp -rf wallpapers/default_wallpaper.jpg $cmWallpaper/drawable-sw600dp-nodpi/
yes | cp -rf wallpapers/default_wallpaper.jpg $cmWallpaper/drawable-nodpi/
echo "Done."

cmAnimation=$cmHome/vendor/cm/prebuilt/common/bootanimation

echo "Replacing boot anination..."
yes | cp -rf bootanimation/* $cmAnimation
rm -rf $cmAnimation/halfres/*.zip
cd $cmAnimation/halfres
sh $cmAnimation/halfres/generate-half-res-anims.sh
echo "Done."

cmTrebuchet=$cmHome/packages/apps/Trebuchet

cd $visualId
echo "Adjusting Trebuchet..."
yes | cp -rf trebuchet/res/xml/*.xml $cmTrebuchet/res/xml
echo "Done."
