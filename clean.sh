#!/bin/bash

read -r -p "Você deseja remover da lista de pacotes os pacotes de remoção (SECGEN_DEL)? [y/N] " response

case $response in
        [yY][sS]|[yY])
	if ! [ -f ./SECGEN_DEL ]; then
		echo "Não há na pasta raiz da build uma lista de remoções de pacotes (SCGEN_DEL)"
        	exit 1
	fi

        sed 's/\([^\\]$\)/\1 \\\\/g' SECGEN_DEL > tmpdel
        egrep -v -x -f tmpdel android_packs > SECGEN_PACKS
        ;;
    *)
        exit
        ;;
esac

echo "Os pacotes foram removidos da lista."

rm -rf tmpdel

exit
