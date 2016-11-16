#!/bin/bash -e

##Functions##
#LG devices
Build_d855 (){

	echo "Building d855..."
	brunch d855
	echo "Done."
	echo "d855 has been built."
}

#Motorola devices
Build_peregrine (){

	echo "Building peregrine..."
	brunch peregrine
	echo "Done."
	echo "peregrine has been built."
}

Build_osprey (){

	echo "Building osprey..."
	brunch osprey
	echo "Done."
	echo "osprey has been built."
}

Build_surnia (){

	echo "Building surnia..."
	brunch surnia
	echo "Done."
	echo "surnia has been built."
}

Build_victara (){

	echo "Building victara..."
	brunch victara
	echo "Done."
	echo "victara has been built."
}

#Samsung devices
Build_klte (){

	echo "Building klte..."
	brunch klte
	echo "Done."
	echo "klte has been built."
}

Build_i9300 (){

	echo "Building i9300..."
	brunch i9300
	echo "Done."
	echo "i9300 has been built."
}

#Asus devices
Build_Z00A (){

	echo "Building Z00A..."
	brunch Z00A
	echo "Done."
	echo "Z00A has been built."
}

##SNOITCNUF##

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
echo "Preparing to build..."
source build/envsetup.sh


if [ $# -eq 0 ]; then
	echo "Building all devices..."

	#LG devices
	echo "Bulding LG devices..."
	Build_d855
	echo "All LG devices have been built."

	#Motorola devices
	echo "Building Motorola devices..."
	Build_peregrine
	Build_osprey
	Build_surnia
	Build_victara
	echo "All Motorola devices have been built."

	#Samsung devices
	echo "Building Samsung devices..."
	Build_klte
	Build_i9300
	echo "All Samsung devices have been built."

	#Asus devices
	echo "Building Asus devices..."
	Build_Z00A
	echo "All Asus devices have been built."

	echo "All done."
else
	echo "Building $@..."

	#LG devices
	if [$@ == *"LG"*]; then
		echo "Bulding LG devices..."
		Build_d855
		echo "All LG devices have been built."
	else
		if [$@ == *"d855"*]; then
			Build_d855
		fi
	fi

	#Motorola devices
	if [$@ == *"Motorola"*]; then
		echo "Building Motorola devices..."
		Build_peregrine
		Build_osprey
		Build_surnia
		Build_victara
		echo "All Motorola devices have been built."
	else
		if [$@ == *"peregrine"*]; then
			Build_peregrine
		fi

		if [$@ == *"osprey"*]; then
			Build_osprey
		fi

		if [$@ == *"surnia"*]; then
			Build_surnia
		fi

		if [$@ == *"victara"*]; then
			Build_victara
		fi
	fi

	#Samsung devices
	if [$@ == *"Samsung"*]; then
		echo "Building Samsung devices..."
		Build_klte
		Build_i9300
		echo "All Samsung devices have been built."
	else
		if [$@ == *"klte"*]; then
			Build_klte
		fi

		if [$@ == *"i9300"*]; then
			Build_i9300
		fi
	fi

	#Asus devices
	if [$@ == *"Asus"*]; then
		echo "Building Asus devices..."
		Build_Z00A
		echo "All Asus devices have been built."
	else
		if [$@ == *"Z00A"*]; then
			Build_Z00A
		fi
	fi

	echo "All done."
fi
