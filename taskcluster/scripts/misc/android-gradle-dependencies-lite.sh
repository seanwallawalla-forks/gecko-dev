#!/bin/bash -vex

set -x -e

echo "running as" $(id)

set -v

cd $GECKO_PATH

# Needed for Nexus
export PATH=$MOZ_FETCHES_DIR/jdk-8/bin:$PATH

. taskcluster/scripts/misc/android-gradle-dependencies/before.sh

export MOZCONFIG=mobile/android/config/mozconfigs/android-arm-gradle-dependencies/nightly-lite
./mach build
./mach android gradle-dependencies

. taskcluster/scripts/misc/android-gradle-dependencies/after.sh
