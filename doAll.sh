#!/bin/bash -e

read -p "Where do you want to start the build: " -e dir
export cmHome=$dir/cm13.0

securegen="$(dirname "$(pwd)")"

sh newBuild.sh
(cd $securegen/visualId; bash replaceId.sh)
(cd $securegen/blobs/; bash addBlobs.sh)
(cd $securegen/apps/; bash addPacks.sh)
