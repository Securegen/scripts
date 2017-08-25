#!/bin/bash -e

##VARS##
asus=('Z00A')
lg=('d855' 'h815')
motorola=('peregrine' 'osprey' 'surnia' 'victara' 'harpia' 'falcon' 'lux' 'merlin' 'athene')
samsung=('klte' 'i9300')
xiaomi=('gemini')
builtDevices=""
##SRAV##

##Functions##
Build_device (){
	echo -e  "\tBuilding for $1 - `date +%x` `date +%T`" | tee -a log.txt
	brunch $1
	if [ $? -eq 0 ]; then
		echo "Done."
		echo -e "\tBuild for $1 completed - `date +%x` `date +%T`" | tee -a log.txt
	else
		echo -e "\tError building for $1 - `date +%x` `date +%T`" | tee -a log.txt
	fi
	builtDevices="$builtDevices $1"
}

Build_brand (){
	echo "Building Securegen for $1 devices - `date +%x` `date +%T`" | tee -a log.txt
	for device in "${@:2}"; do
                Build_device $device
	done
	echo "Finished building for all $1 devices - `date +%x` `date +%T`" | tee -a log.txt
}
##SNOITCNUF##

if [ -z ${cmHome+x} ]; then
	if ( [[ ! -z "$1" ]]; [[ -d $1/build ]]; [[ -d $1/android ]]; [[ -d $1/.repo ]] ) then
		cmHome=$1
		shift
	else
		while true; do
			read -p "Enter the path to the build dir: " -e cmHome;
			if ( [[ -d $cmHome/build ]]; [[ -d $cmHome/android ]]; [[ -d $cmHome/.repo ]] ) then
				break;
			fi
			echo "Not a build dir. Try again."
		done
	fi
fi

cd $cmHome
echo "Preparing to build..."
source build/envsetup.sh

if [ $# -eq 0 ]; then
	echo "Building Securegen for all devices - `date +%x` `date +%T`" | tee -a log.txt
	Build_brand "Asus" ${asus[@]}
	Build_brand "LG" ${lg[@]}
	Build_brand "Motorola" ${motorola[@]}
	Build_brand "Samsung" ${samsung[@]}
	Build_brand "Xiaomi" ${xiaomi[@]}
	echo -e "Finished building for all devices - `date +%x` `date +%T`\n" | tee -a log.txt
else
	echo "Building Securegen for $@ - `date +%x` `date +%T`" | tee -a log.txt
	input="$@"
	if input="${input//Asus/ }"; then
		Build_brand "Asus" ${asus[@]}
	fi
	if input="${input//LG/ }"; then
		Build_brand "LG" ${lg[@]}
	fi
	if input="${input//Motorola/ }"; then
		Build_brand "Motorola" ${motorola[@]}
	fi
	if input="${input//Samsung/ }"; then
		Build_brand "Samsung" ${samsung[@]}
	fi
	if input="${input//Xiaomi/ }"; then
		Build_brand "Xiaomi" ${xiaomi[@]}
	fi
	IFS=' ' read -r -a remainingDevices <<< "$input"
	for device in "$remainingDevices"; do
		if [[ $builtDevices != *$device* ]]; then
			Build_device $device
		fi
	done
	echo -e "All select devices have been built - `date +%x` `date +%T`\n" | tee -a log.txt
fi
