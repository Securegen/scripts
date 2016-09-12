#!/bin/bash -e

read -p "Where do you want to start the build: " -e dir
export cmHome=$dir/cm13.0

sh newBuild.sh
sh visualId/replaceId.sh
sh blobs/addBlobs.sh
sh apps/addPacks.sh
