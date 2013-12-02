#
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

########################################################################
# Spreadtrum defined quick commands for Android Building
########################################################################

# a quick command to install kernel header files for userspace building
function kheader()
{
	T=$(gettop)
	if [ ! "$T" ]; then
		echo "Couldn't locate the top of the tree.  Try setting TOP."
		return
	fi
	mkdir -p $OUT/obj/KERNEL
	make -C $T/kernel O=$OUT/obj/KERNEL ARCH=arm CROSS_COMPILE=arm-eabi- headers_install
}

# a quick command to launch kernel menuconfig 
function kmconfig()
{
	T=$(gettop)
	if [ ! "$T" ]; then
		echo "Couldn't locate the top of the tree.  Try setting TOP."
		return
	fi
	mkdir -p $OUT/obj/KERNEL
	make -C $T/kernel O=$OUT/obj/KERNEL ARCH=arm CROSS_COMPILE=arm-eabi- menuconfig
}

# a quick command to launch kernel menuconfig and update .config to kernel
function kuconfig()
{
	T=$(gettop)
	if [ ! "$T" ]; then
		echo "Couldn't locate the top of the tree.  Try setting TOP."
		return
	fi
	KERNEL_DEFCONFIG=$(get_build_var KERNEL_DEFCONFIG)
	mkdir -p $OUT/obj/KERNEL
	make -C $T/kernel O=$OUT/obj/KERNEL ARCH=arm CROSS_COMPILE=arm-eabi- menuconfig
	cp $OUT/obj/KERNEL/.config $T/kernel/arch/arm/configs/$KERNEL_DEFCONFIG
}

# a quick command to update kernel config to the corresponding defconfig
function kdconfig()
{
	T=$(gettop)
	if [ ! "$T" ]; then
		echo "Couldn't locate the top of the tree.  Try setting TOP."
		return
	fi
	KERNEL_DEFCONFIG=$(get_build_var KERNEL_DEFCONFIG)
	mkdir -p $OUT/obj/KERNEL
	make -C $T/kernel O=$OUT/obj/KERNEL ARCH=arm CROSS_COMPILE=arm-eabi- $KERNEL_DEFCONFIG
}

# a quick command to clean kernel building files
function kclean()
{
	T=$(gettop)
	if [ ! "$T" ]; then
		echo "Couldn't locate the top of the tree.  Try setting TOP."
		return
	fi
	make -C $T/kernel O=$OUT/obj/KERNEL ARCH=arm CROSS_COMPILE=arm-eabi- mrproper
}

# a quick command to run kernel make
function kmk()
{
	T=$(gettop)
	if [ ! "$T" ]; then
		echo "Couldn't locate the top of the tree.  Try setting TOP."
		return
	fi
	make -C $T/kernel O=$OUT/obj/KERNEL ARCH=arm CROSS_COMPILE=arm-eabi- $*
}

# a quick command to clean u-boot building files
function uclean()
{
	T=$(gettop)
	if [ ! "$T" ]; then
		echo "Couldn't locate the top of the tree.  Try setting TOP."
		return
	fi
	make -C $T/u-boot O=$OUT/obj/u-boot mrproper
}

# a quick command to clean u-boot building files
function umk()
{
	T=$(gettop)
	if [ ! "$T" ]; then
		echo "Couldn't locate the top of the tree.  Try setting TOP."
		return
	fi
	make -C $T/u-boot O=$OUT/obj/u-boot $*
}

# a quick command to config u-boot
function uconfig()
{
	T=$(gettop)
	if [ ! "$T" ]; then
		echo "Couldn't locate the top of the tree.  Try setting TOP."
		return
	fi
	make -C $T/u-boot O=$OUT/obj/u-boot $(get_build_var UBOOT_DEFCONFIG)_config
}

