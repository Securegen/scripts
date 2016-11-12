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

cd $cmHome
echo "Preparing to build all devices..."
source build/envsetup.sh

#LG devices
echo "Bulding LG devices..."

echo "Building d855..."
brunch d855
echo "Done."
echo "d855 has been built."
echo "All LG devices have been built."

#Motorola devices
echo "Building Motorola devices..."

echo "Building peregrine..."
brunch peregrine
echo "Done."
echo "peregrine has been built."

echo "Building osprey..."
brunch osprey
echo "Done."
echo "osprey has been built."

echo "Building surnia..."
brunch surnia
echo "Done."
echo "surnia has been built."

echo "Building victara..."
brunch victara
echo "Done."
echo "victara has been built."
echo "All Motorola devices have been built."

#Samsung devices
echo "Building Samsung devices..."

echo "Building klte..."
brunch klte
echo "Done."
echo "klte has been built."

echo "Building i9300..."
brunch i9300
echo "Done."
echo "i9300 has been built."
echo "All Samsung devices have been built."

#Asus devices
echo "Building Asus devices..."

echo "Building Z00A..."
brunch Z00A
echo "Done."
echo "Z00A has been built."
echo "All Asus devices have been built."
