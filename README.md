# Scripts
Scripts to help us at the development process, making it easier to add/remove packages and to build the whole thing

# How to use

Copy all scripts to the build root.

Run gather.sh so it generates the android_packs file.

Run clean.sh. It will remove from android_packs all files on SECGEN_DEL and store then on SECGEN_CLEANPACKS.

Run catToBuild.sh. It will return the cleaned packs, stored on SECGEN_CLEANPACKS, to the build.
