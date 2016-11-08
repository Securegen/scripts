#!/bin/bash

if [ "$1" = "-y" ] || [ "$1" = "-Y" ]; then 
	response="y"
elif [ "$1" = "-n" ] || [ "$1" = "-N" ]; then
	response="N"
else
	read -r -p "Você deseja remover da lista de pacotes os pacotes de remoção (SECGEN_DEL)? [y/N] " response
fi

case $response in
        [yY][sS]|[yY])
	if ! [ -f `dirname $0`/SECGEN_DEL ]; then
		echo "Não há na pasta raiz da build uma lista de remoções de pacotes (SCGEN_DEL)"
        	exit 1
	fi

        sed 's/\([^\\]$\)/\1 \\\\/g' `dirname $0`/SECGEN_DEL > tmpdel
        egrep -v -x -f tmpdel android_packs > SECGEN_CLEANPACKS
        ;;
    *)
        exit
        ;;
esac

echo "Os pacotes foram removidos da lista."

rm -rf tmpdel

exit
