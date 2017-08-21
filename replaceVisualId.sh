#!/bin/bash -e

if [ -z ${cmHome+x} ]; then
	while true; do
		read -p "Enter the path to the build dir: " -e cmHome;
		if ( [[ -d $cmHome/build ]]; [[ -d $cmHome/android ]]; [[ -d $cmHome/.repo ]] ) then
			break;
		fi
		echo "Not a build dir. Try again."
	done
fi

securegen="$(dirname "$(pwd)")"
cmWallpaper=$cmHome/vendor/cm/overlay/common/frameworks/base/core/res/res
securegenWallpaper=visualId/wallpapers

echo "Replacing wallpapers..."
yes | cp -rf $securegenWallpaper/default_wallpaper.png $cmWallpaper/drawable-sw720dp-nodpi/
yes | cp -rf $securegenWallpaper/default_wallpaper.png $cmWallpaper/drawable-hdpi/
yes | cp -rf $securegenWallpaper/default_wallpaper.png $cmWallpaper/drawable-xhdpi/
yes | cp -rf $securegenWallpaper/default_wallpaper.png $cmWallpaper/drawable-xxxhdpi/
yes | cp -rf $securegenWallpaper/default_wallpaper.png $cmWallpaper/drawable-xxhdpi/
yes | cp -rf $securegenWallpaper/default_wallpaper.png $cmWallpaper/drawable-sw600dp-nodpi/
yes | cp -rf $securegenWallpaper/default_wallpaper.png $cmWallpaper/drawable-nodpi/
echo "Done."

cmAnimation=$cmHome/vendor/cm/bootanimation
securegenAnimation=visualId/bootanimation

echo "Replacing boot anination..."
yes | cp -rf $securegenAnimation/bootanimation.tar $cmAnimation
yes | cp -rf $securegenAnimation/desc.txt $cmAnimation
yes | cp -rf $securegenAnimation/generate-bootanimation.sh $cmAnimation
echo "Done."

cmTrebuchet=$cmHome/packages/apps/Trebuchet
securegenTrebuchet=visualId/trebuchet

echo "Adjusting Trebuchet..."
yes | cp -rf $securegenTrebuchet/res/xml/*.xml $cmTrebuchet/res/xml
echo "Done."
