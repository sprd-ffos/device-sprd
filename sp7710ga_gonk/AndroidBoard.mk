LOCAL_PATH := $(call my-dir)

#ifeq  ($(strip $(BUILD_SPRD_OTA_PACKAGE)),true)
#$(call add-radio-file,modem_bins/modem.bin)
#$(call add-radio-file,modem_bins/nvitem.bin)
#$(call add-radio-file,modem_bins/dsp.bin)
#$(call add-radio-file,modem_bins/vmjaluna.bin)

#update u-boot if HAVE_BOOT_IMG = true
#$(call add-radio-file,modem_bins/u-boot.bin)
#$(call add-radio-file,modem_bins/u-boot-spl-16k.bin)
#$(call add-radio-file,modem_bins/boot.img)
#$(call add-radio-file,modem_bins/recovery.img)
#$(call add-radio-file,modem_bins/system.img)
#$(call add-radio-file,modem_bins/userdata.img)
#endif

# Compile U-Boot
#ifneq ($(strip $(TARGET_NO_BOOTLOADER)),true)

#INSTALLED_UBOOT_TARGET := $(PRODUCT_OUT)/u-boot.bin
#-include u-boot/AndroidUBoot.mk

#endif # End of U-Boot

# Compile Linux Kernel
include kernel/AndroidKernel.mk
