#!/bin/bash

read -r -p "Você deseja adicionar a lista de pacotes (SECGEN_CLEANPACKS) à build? [y/N] " response

case $response in
        [yY][sS]|[yY]) 

	if ! [ -f ./SECGEN_CLEANPACKS ]; then
        	echo "Não há na pasta raiz da build uma lista de pacotes limpa (SECGEN_CLEANPACKS).
		      Por favor, rode o script clean.sh antes dess"
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

echo "Os pacotes foram inseridos na build."

exit
