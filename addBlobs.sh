#!/bin/bash -e

if [ -z ${cmHome+x} ]; then read -p "Enter the path to the build dir: " -e cmHome; fi

cmVendor=$cmHome/vendor
blobs=$(pwd)
cd $cmHome
source build/envsetup.sh

#LG Blobs
echo "Adding LG blobs..."
mkdir $cmVendor/lge

echo "Adding d855..."
breakfast d855
cp -R $blobs/lge/d855 $cmVendor/lge
cp -R $blobs/lge/g3-common $cmVendor/lge
breakfast d855
echo "Done."
echo "d855 has been addded."
echo "All LG blobs have been added."

#Motorola Blobs
echo "Adding Motorola blobs..."
mkdir $cmVendor/motorola

echo "Adding peregrine..."
breakfast peregrine
cp -R $blobs/motorola/msm8226-common $cmVendor/motorola
cp -R $blobs/motorola/peregrine $cmVendor/motorola
breakfast peregrine
echo "Done."
echo "peregrine has been added."

echo "Adding surnia..."
breakfast surnia
cp -R $blobs/motorola/msm8916-common $cmVendor/motorola
cp -R $blobs/motorola/surnia $cmVendor/motorola
breakfast surnia
echo "Done."
echo "surnia has been added."

echo "Adding victara..."
breakfast victara
cp -R $blobs/motorola/victara $cmVendor/motorola
breakfast victara
echo "Done."
echo "victara has been added."
echo "All Motorola blobs have been added."

#Samsung Blobs
echo "Adding Samsung blobs..."
mkdir $cmVendor/samsung

echo "Adding klte..."
breakfast klte
cp -R $blobs/samsung/klte-common $cmVendor/samsung
cp -R $blobs/samsung/klte $cmVendor/samsung
breakfast klte
echo "Done."
echo "klte has been added."

echo "Adding i9300..."
breakfast i9300
cp -R $blobs/samsung/i9300 $cmVendor/samsung
cp -R $blobs/samsung/smdk4412-common $cmVendor/samsung
breakfast i9300
echo "Done"
echo "i9300 has been added."
echo "All Samsung blobs have been added."

#Asus blobs
echo "Adding Asus blobs..."
mkdir $cmVendor/asus

echo "Adding Z00A..."
breakfast Z00A
cp -R $blobs/asus/mofd-common $cmVendor/asus
cp -R $blobs/asus/Z00A $cmVendor/asus
breakfast Z00A
echo "Done."
echo "Z00A has been added."
echo "All Asus blobs have been added."
