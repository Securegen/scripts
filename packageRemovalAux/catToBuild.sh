#!/bin/bash

if [ "$1" = "-y" ] || [ "$1" = "-Y" ]; then 
	response="y"
elif [ "$1" = "-n" ] || [ "$1" = "-N" ]; then
	response="N"
else
	read -r -p "Do you wish to add the packages list (SECGEN_CLEANPACKS) to the build? [y/N] " response
fi

case $response in
        [yY][sS]|[yY]) 

	if ! [ -f ./SECGEN_CLEANPACKS ]; then
        	echo "Missing SECGEN_CLEANPACKS. Run clena.sh first."
	        exit 1
	fi

	if [ -f vendor/cm/config/common_full.mk.original ]; then
		\cp vendor/cm/config/common_full.mk.original vendor/cm/config/common_full.mk
	else
		\cp vendor/cm/config/common_full.mk vendor/cm/config/common_full.mk.original
	fi
        cat SECGEN_CLEANPACKS >> vendor/cm/config/common_full.mk
        ;;
    *)
        exit
        ;;
esac

echo "Package list included successfully."

exit
