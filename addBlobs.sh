#!/bin/bash -e

if [ -z ${cmHome+x} ]; then read -p "Enter the path to the build dir: " -e cmHome; fi
cmVendor=$cmHome/vendor
securegen="$(dirname "$(pwd)")"
securegenBlobs=$securegen/blobs

#Check if the blobs are present
if [ ! -d "$securegenBlobs" ]; then
	mkdir $securegenBlobs
fi

if [ ! -d "$securenBlobs/proprietary_vendor_lge" ]; then
	echo "Missing LG blobs."
	echo "Downloading..."
	git clone https://github.com/TheMuppets/proprietary_vendor_lge.git $securegenBlobs/proprietary_vendor_lge
	echo "Done."
fi

if [ ! -d "$securenBlobs/proprietary_vendor_motorola" ]; then
	echo "Missing Motorola blobs."
	echo "Downloading..."
	git clone https://github.com/TheMuppets/proprietary_vendor_motorola.git $securegenBlobs/proprietary_vendor_motorola
	echo "Done."
fi

if [ ! -d "$securenBlobs/proprietary_vendor_samsung" ]; then
	echo "Missing Samsung blobs."
	echo "Downloading..."
	git clone https://github.com/TheMuppets/proprietary_vendor_samsung.git $securegenBlobs/proprietary_vendor_samsung
	echo "Done."
fi

if [ ! -d "$securenBlobs/proprietary_vendor_asus" ]; then
	echo "Missing Asus blobs."
	echo "Downloading..."
	git clone https://github.com/TheMuppets/proprietary_vendor_asus.git $securegenBlobs/proprietary_vendor_asus
	echo "Done."
fi

cd $cmHome
echo "Preparing to add blobs..."
source build/envsetup.sh

#LG Blobs
echo "Adding LG blobs..."
mkdir $cmVendor/lge

echo "Adding d855..."
breakfast d855
cp -R $securegenBlobs/proprietary_vendor_lge/d855 $cmVendor/lge
cp -R $securegenBlobs/proprietary_vendor_lge/g3-common $cmVendor/lge
breakfast d855
echo "Done."
echo "d855 has been addded."
echo "All LG blobs have been added."

#Motorola Blobs
echo "Adding Motorola blobs..."
mkdir $cmVendor/motorola

echo "Adding peregrine..."
breakfast peregrine
cp -R $securegenBlobs/motorola/msm8226-common $cmVendor/motorola
cp -R $securegenBlobs/motorola/peregrine $cmVendor/motorola
breakfast peregrine
echo "Done."
echo "peregrine has been added."

echo "Adding osprey..."
breakfast osprey
cp -R $securegenBlobs/motorola/osprey $cmVendor/motorola
breakfast osprey
echo "Done."
echo "osprey has been added."

echo "Adding surnia..."
breakfast surnia
cp -R $securegenBlobs/motorola/msm8916-common $cmVendor/motorola
cp -R $securegenBlobs/motorola/surnia $cmVendor/motorola
breakfast surnia
echo "Done."
echo "surnia has been added."

echo "Adding victara..."
breakfast victara
cp -R $securegenBlobs/motorola/victara $cmVendor/motorola
breakfast victara
echo "Done."
echo "victara has been added."
echo "All Motorola blobs have been added."

#Samsung Blobs
echo "Adding Samsung blobs..."
mkdir $cmVendor/samsung

echo "Adding klte..."
breakfast klte
cp -R $securegenBlobs/samsung/klte-common $cmVendor/samsung
cp -R $securegenBlobs/samsung/klte $cmVendor/samsung
breakfast klte
echo "Done."
echo "klte has been added."

echo "Adding i9300..."
breakfast i9300
cp -R $securegenBlobs/samsung/i9300 $cmVendor/samsung
cp -R $securegenBlobs/samsung/smdk4412-common $cmVendor/samsung
breakfast i9300
echo "Done"
echo "i9300 has been added."
echo "All Samsung blobs have been added."

#Asus blobs
echo "Adding Asus blobs..."
mkdir $cmVendor/asus

echo "Adding Z00A..."
breakfast Z00A
cp -R $securegenBlobs/asus/mofd-common $cmVendor/asus
cp -R $securegenBlobs/asus/Z00A $cmVendor/asus
breakfast Z00A
echo "Done."
echo "Z00A has been added."
echo "All Asus blobs have been added."
