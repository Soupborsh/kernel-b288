# B288 Pocketbook kernel

This kernel is outdated for PB618, I try to make it work for it.

### Status

It can be compiled but I did not test it. I added `sun8iw10p1-618.dts` and `618_defconfig` extracted from PB618, dts seems to be unused.

# Building/compiling:

## Dependencies:

[gcc-linaro-arm-linux-gnueabihf-4.9-2014.09](https://releases.linaro.org/archive/14.09/components/toolchain/binaries/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz) toolchain is required to build. Stock kernel is built by it.

([gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz](https://releases.linaro.org/archive/15.05/components/toolchain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz) can be used too, 32bit libraries should not be needed.) 

### Arch Linux(multilib repository required):

    sudo pacman -Sy bc inetutils lib32-glibc gcc-libs lib32-gcc-libs lib32-zlib mercurial uboot-tools
    
## Build

    KCFLAGS="-mcpu=cortex-a8 -march=armv7-a -mfpu=neon -mfloat-abi=softfp" make ARCH=arm CROSS_COMPILE=/mnt/mediafiles/Media/Code/SDK/gcc/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin/arm-linux-gnueabihf- -j 6 618_defconfig
    KCFLAGS="-mcpu=cortex-a8 -march=armv7-a -mfpu=neon -mfloat-abi=softfp" make ARCH=arm CROSS_COMPILE=/mnt/mediafiles/Media/Code/SDK/gcc/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux/bin/arm-linux-gnueabihf- -j 6 uImage

Change path in `CROSS_COMPILE=` to your gcc-linaro-arm-linux-gnueabihf-4.9-2014.09 toolchain path, `6` after `-j` change to how many of your CPU cores you want to use for compiling.

There should be `uImage`, `zImage` and `Image` in `arch/arm/boot/`.
