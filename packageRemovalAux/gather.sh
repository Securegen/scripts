#!/bin/bash

if ( [[ -d ./build ]]; [[ -d ./android ]]; [[ -d ./.repo ]] ) then

	if [ "$1" = "-y" ] || [ "$1" = "-Y" ]; then 
		response="y"
	elif [ "$1" = "-n" ] || [ "$1" = "-N" ]; then
		response="N"
	else
		read -r -p "Você deseja aglutinar a lista de pacotes em um arquivo (android_packs)? [y/N] " response
	fi

	case $response in
		[yY][sS]|[yY]) 

		for i in $(find ./build/ ./vendor/ ./device/ -name *.mk); do grep -le  "PRODUCT_PACKAGES\s*[:+]=" $i; done > MKS

		list=$(cat MKS)
		for i in $(echo $list);
		do
			if ! [ -f $i.bak ]; then
				\cp $i $i.bak
			else
				\cp $i.bak $i
			fi
		done

		scrip.pl $(echo $list| grep -v .bak)

		sed "s/\s*PRODUCT_PACKAGES\s*[:+]=//g" android_packages_raw | sed s/^"\s"*'\\'*//g | sed /^$/d | sed 's/\([^\\]$\)/\1 \\/g' | sort -u | sed -e '1i\\nPRODUCT_PACKAGES += \\' > android_packs
		rm -rf android_packages_raw

		rm -rf /tmp/MAKE*

		echo "PRONTO"

		;;
	*)
		exit
		;;
	esac

	else
		echo "Você não se encontra em um ambiente de compilação"
fi
