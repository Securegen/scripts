# Scripts
Scripts to help us at the development process, making it easier to add/remove packages and to build the whole thing.

# How to use

## Package Removal

Use the scrips on the packageRemoval dir to remova packages that come with CyanogenMod and will no be used by Securegen.

Copy all files from /packageRemovel to the build root.

Run gather.sh so it generates the android_packs file.

Run clean.sh. It will remove from android_packs all files on SECGEN_DEL and store then on SECGEN_CLEANPACKS.

Run catToBuild.sh. It will return the cleaned packs, stored on SECGEN_CLEANPACKS, to the build.

## Start a new build

Just run the newBuild.sh script and follow the instructions.
