#!/bin/sh

set -x

# enter scripts working directory
cd "$(cd "$(dirname "$0")" && pwd)"

CROSS_PREFIX=/mnt/mediafiles/Media/Code/SDK/gcc/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin/arm-linux-gnueabihf-
dpkg -s ccache > /dev/null 2>&1
if [ $? -eq 0 ] ;
then
	# package installed
	CROSS_PREFIX="ccache ${CROSS_PREFIX}"
fi

#NCPUS=`cat /proc/cpuinfo | grep processor | wc -l`
NCPUS=6
#make HOSTCC="${CROSS_PREFIX}" ARCH=arm CROSS_COMPILE="${CROSS_PREFIX}" -j ${NCPUS} $1
make ARCH=arm CROSS_COMPILE="${CROSS_PREFIX}" -j ${NCPUS} $1
[ $? != 0 ] && exit

if [ $1 = "modules" ] ; then
	rm -rf modules_build
	mkdir modules_build
	find . -path ./modules_build -prune -o -name '*.ko' -print -exec cp -f \{} modules_build \;
fi


