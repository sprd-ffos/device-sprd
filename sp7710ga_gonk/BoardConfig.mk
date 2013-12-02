#
# Copyright (C) 2011 The Android Open-Source Project
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
export RAM512_BINGEN_SUPPORT := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_CORTEX_CACHE_LINE_32 := true

TARGET_BOARD_PLATFORM := sc7710
TARGET_BOOTLOADER_BOARD_NAME := sp7710g2

# Enable the optimized DEX
ifneq ($(filter user, $(TARGET_BUILD_VARIANT)),)
WITH_DEXPREOPT=true
endif

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true

# config u-boot
#TARGET_NO_BOOTLOADER := false
#UBOOT_DEFCONFIG := sp7710g2

# config kernel

ifeq ($(TARGET_HVGA_ENABLE), true)
KERNEL_DEFCONFIG := sp7710ga-native-hvga_defconfig
else
KERNEL_DEFCONFIG := sp7710ga-native_defconfig
endif
USES_UNCOMPRESSED_KERNEL := true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8

# define for modem_control and nvitemd
BOARD_SP7710GA        := true

# use default init.rc
TARGET_PROVIDES_INIT_RC := true

#select 2M,3M or 5M
CAMERA_SUPPORT_SIZE := 3M

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BK := true
BOARD_HAVE_FM_BEKEN := true
BOARD_USE_SPRD_FMAPP := true
# board specific modules
BOARD_USES_TINYALSA_AUDIO := true
BOARD_USES_LINE_CALL := false
BOARD_USE_VETH := true
BOARD_SPRD_RIL := true
BOARD_SAMSUNG_RIL := false
#TARGET_RECOVERY_UI_LIB := librecovery_ui_sp8810
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION     := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd

# close CMCC FEATURE,resolve can't auto connect ap.
HAVE_WLAN_CMCC_FEATURE := false

WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/etc/wifi/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/etc/wifi/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_AP      := "/etc/wifi/fw_bcmdhd_apsta.bin"
USE_CAMERA_STUB := true
USE_OPENGL_RENDERER := true
TARGET_BOARD_CAMERA_ROTATION := true
TARGET_BOARD_SP7710_CAMERA := true

BOARD_GPS := ublox

BOARD_USES_GENERIC_AUDIO := false
AUDIO_MUX_PIPE := true

# sensor config
USE_INVENSENSE_LIB := NULL
USE_SPRD_SENSOR_LIB := true
BOARD_HAVE_ACC := Lis3dh
BOARD_ACC_INSTALL := 5
BOARD_HAVE_ORI := Akm
BOARD_ORI_INSTALL := 7
BOARD_HAVE_PLS := LTR558ALS

USE_BOOT_AT_DIAG := true

BOARD_SP7710G2 := true
#############################################
#which to update
UPDATE_ANDROID_IMG := true
UPDATE_MODEM_IMG := true
UPDATE_BOOTLOADER_IMG := true
ERASE_USER_DATA := true
ERASE_PRODUCT_INFO := true
#how to update
#NEED_REBOOT := true
#should always be true,for incremental update is not done by this
SPRD_OTA_UPDATE := true
##############################################
