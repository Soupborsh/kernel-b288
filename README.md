# B288 Pocketbook kernel

This kernel is outdated for PB618, I try to make it work for it.

### Status

It can be compiled, touchscreen proprietary module does not work. I added `sun8iw10p1-618.dts` and `618_defconfig` extracted from PB618, dts seems to be unused.

# Building/compiling:

## Dependencies:

[gcc-linaro-arm-linux-gnueabihf-4.9-2014.09](https://releases.linaro.org/archive/14.09/components/toolchain/binaries/gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz)

It additionally requires `lib32-gcc-libs lib32-zlib lib32-glibc` on Arch Linux.

stock kernel is built by it, although, we can use slightly newer 64bit version:

[gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz](https://releases.linaro.org/archive/15.05/components/toolchain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz)

### Arch Linux:

    sudo pacman -S bc inetutils gcc-libs mercurial uboot-tools
    
## Build

    make ARCH=arm CROSS_COMPILE=*CHANGE_PATH*/arm-linux-gnueabihf- -j$(nproc) 618_defconfig
    make ARCH=arm CROSS_COMPILE=*CHANGE_PATH*/arm-linux-gnueabihf- -j$(nproc) uImage

There should be `uImage`, `zImage` and `Image` in `arch/arm/boot/`. You can boot uImage from preinstalled U-Boot(see [linux-sunxi wiki](https://linux-sunxi.org/PocketBook_Basic_Lux_4_(PB618)#Preinstalled_U-Boot_shell.2Fmonitor_entry) to enter into it's shell/monitor).
