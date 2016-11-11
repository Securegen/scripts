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
securegenPRA=$securegen/scripts/packageRemovalAux

cd $cmHome
bash $securegenPRA/gather.sh -y
bash $securegenPRA/clean.sh -y
bash $securegenPRA/catToBuild.sh -y
