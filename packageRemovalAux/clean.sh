#!/bin/bash

if [ "$1" = "-y" ] || [ "$1" = "-Y" ]; then 
	response="y"
elif [ "$1" = "-n" ] || [ "$1" = "-N" ]; then
	response="N"
else
	read -r -p "Do you wish to remove selected packs (SECGEN_DEL) from the package list? [y/N] " response
fi

case $response in
        [yY][sS]|[yY])
	if ! [ -f `dirname $0`/SECGEN_DEL ]; then
		echo "Missing SECGEN_DEL."
        	exit 1
	fi

        sed 's/\([^\\]$\)/\1 \\\\/g' `dirname $0`/SECGEN_DEL > tmpdel
        egrep -v -x -f tmpdel android_packs > SECGEN_CLEANPACKS
        ;;
    *)
        exit
        ;;
esac

echo "Packs removed successfully."

rm -rf tmpdel

exit
