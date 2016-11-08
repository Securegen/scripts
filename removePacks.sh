#!/bin/bash -e

if [ -z ${cmHome+x} ]; then
	read -p "Enter the path to the build dir: " -e cmHome;
fi

securegen="$(dirname "$(pwd)")"
securegenPRA=$securegen/scripts/packageRemovalAux

cd $cmHome
bash $securegenPRA/gather.sh -y
bash $securegenPRA/clean.sh -y
bash $securegenPRA/catToBuild.sh -y
