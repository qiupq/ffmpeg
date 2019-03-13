#!/bin/bash
export PATH="/mnt/ccc/gitPhytec/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/mnt/ccc/gitPhytec/sources/poky/scripts:/mnt/ccc/gitPhytec/build/tmp/sysroots/x86_64-linux/usr/bin/arm-phytec-linux-gnueabi:/mnt/ccc/gitPhytec/build/tmp/sysroots/phyboard-mira-imx6-7/usr/bin/crossscripts:/mnt/ccc/gitPhytec/build/tmp/sysroots/x86_64-linux/usr/sbin:/mnt/ccc/gitPhytec/build/tmp/sysroots/x86_64-linux/usr/bin:/mnt/ccc/gitPhytec/build/tmp/sysroots/x86_64-linux/sbin:/mnt/ccc/gitPhytec/build/tmp/sysroots/x86_64-linux/bin:/mnt/ccc/gitPhytec/sources/poky/scripts:/mnt/ccc/gitPhytec/sources/poky/bitbake/bin:/mnt/aaa/6410/u-boot-2011.03/tools:/opt/qemu3.0/bin:/home/qpq/.local/share/umake/bin:/mnt/aaa/6410/u-boot-2011.03/tools:/opt/qemu3.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/aaa/tools/ssr-charles:/mnt/aaa/tools/ssr-charles"
if [ -f config.h ]; then
	echo "skip configure"
else
	echo "start configure ..."

./configure \
 --prefix=/mnt/aaa/temp/ffmpeg/test_1 \
 --target-os=linux \
 --arch=armv7-a \
 --cpu=cortex-a9 \
 --cross-prefix=arm-phytec-linux-gnueabi- \
 --pkg-config="pkg-config"\
 --sysroot=/mnt/ccc/gitPhytec/build/tmp/sysroots/phyboard-mira-imx6-7\
 --extra-cflags="-march=armv7-a -mfpu=neon  -mfloat-abi=hard -mcpu=cortex-a9 --sysroot=/mnt/ccc/gitPhytec/build/tmp/sysroots/phyboard-mira-imx6-7 -fvisibility=hidden -fdata-sections -ffunction-sections -Os -fPIC -DHAVE_LOCALTIME_R=1 -DHAVE_GMTIME_R=1 -DHAVE_SYS_UIO_H=1 -Dipv6mr_interface=ipv6mr_ifindex -Wno-psabi -fno-short-enums -fno-strict-aliasing -finline-limit=300"\
 --enable-cross-compile \
 --enable-static \
 --enable-version3 \
 --enable-neon \
 --enable-avdevice \
 --enable-avformat \
 --enable-swscale-alpha \
 --enable-swscale \
 --enable-decoder=h264 \
 --enable-pic \
 --enable-ffmpeg \
 --disable-hwaccels \
 --disable-asm \
 --disable-shared \
 --disable-network \
 --disable-rdft \
 --disable-dxva2 \
 --disable-parsers \
 --disable-bsfs \
 --disable-protocols \
 --disable-indevs \
 --disable-outdevs \
 --disable-filters \
 --disable-debug \
 --disable-stripping \
 --disable-armv5te \
 --disable-armv6 \
 --enable-ffplay \
 --enable-ffprobe \
 --disable-avfilter \
 --disable-armv6t2
 
fi
sleep 10
if [ $? -eq 0 ];then
	mkdir -p install
	echo "start build"
	make -j4 2>&1 |tee install/build.log
	make install
else
	echo "configure error"
	exit 0
fi

echo "end of build!!" 

exit 0

#others configure option
--disable-doc 
--disable-pthreads \
--disable-runtime-cpudetect \
--disable-postproc \
--disable-encoders \
--disable-decoders \ 
--disable-muxers \
--disable-demuxers \
--enable-hwaccel=h264_videotoolbox \
