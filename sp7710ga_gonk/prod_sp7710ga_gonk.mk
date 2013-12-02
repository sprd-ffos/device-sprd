#
# Copyright (C) 2007 The Android Open Source Project
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

TARGET_PLATFORM := sc7710
TARGET_BOARD := sp7710ga_gonk
BOARDDIR := device/sprd/$(TARGET_BOARD)

DEVICE_PACKAGE_OVERLAYS := $(BOARDDIR)/overlay
PRODUCT_PACKAGE_OVERLAYS := vendor/sprd/operator/cmcc/specA/overlay

PRODUCT_AAPT_CONFIG := hdpi

PRODUCT_PROPERTY_OVERRIDES := \
	keyguard.no_require_sim=true \
	ro.com.android.dataroaming=false \
	persist.msms.phone_count=1 \
	persist.msms.phone_default=0 \
        lmk.autocalc=false \
        ksm.support=false    \
        zram.support=true \
        zram_for_android.enable=true \
        ro.build.product.lowmem=1 \
        ro.callfirewall.disabled=true \
	ro.msms.phone_count=1 \
	ro.modem.count=1 \
	ro.modem.w.enable=1 \
	ro.modem.w.tty=/dev/ts0710mux \
	ro.modem.w.eth=veth \
	ro.modem.w.id=0 \
	ro.modem.w.count=1 \
	ro.debuggable=0 

ifeq ($(TARGET_LOWCOST_SUPPORT),true)
  PRODUCT_PROPERTY_OVERRIDES += persist.sys.lowcost=true
endif

ifeq ($(TARGET_BUILD_VARIANT),user)
  PRODUCT_PROPERTY_OVERRIDES += persist.sys.sprd.modemreset=1
#yingmin.piao for #Bug189515 kdump switch 20130715
  PRODUCT_PROPERTY_OVERRIDES += persist.sys.kdump.enable=0
else
  PRODUCT_PROPERTY_OVERRIDES += persist.sys.sprd.modemreset=0
  #yingmin.piao for #Bug189515 kdump switch 20130715
  PRODUCT_PROPERTY_OVERRIDES += persist.sys.kdump.enable=1
endif

ifeq ($(TARGET_HVGA_ENABLE), true)
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=160
else
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=240
endif

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage

PRODUCT_PACKAGES := \
	MsmsPhone \
	Settings \
	MsmsStk \
	Stk1 \
	framework2 \
	Launcher2

# prebuild files
PRODUCT_PACKAGES += \

# packages files
PRODUCT_PACKAGES += \
	Camera

PRODUCT_COPY_FILES := \
	$(BOARDDIR)/sprd-keypad.kl:system/usr/keylayout/sprd-keypad.kl \
	$(BOARDDIR)/ft5x0x_ts.idc:system/usr/idc/ft5x0x_ts.idc \
	$(BOARDDIR)/headset-keyboard.kl:system/usr/keylayout/headset-keyboard.kl

#$(call inherit-product, frameworks/native/build/phone-hdpi-256-dalvik-heap.mk)
$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

# include classified configs
$(call inherit-product, $(BOARDDIR)/base.mk)
$(call inherit-product-if-exists, vendor/sprd/proprietories/sp7710ga/vendor-blobs.mk)
#$(call inherit-product, $(BOARDDIR)/proprietories.mk)
#$(call inherit-product, vendor/sprd/operator/cucc/specA/res/boot/boot_res.mk)

# Switch for Low Cost case
TARGET_LOWCOST_SUPPORT := true

# include standard configs
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)

# Overrides
PRODUCT_NAME := sp7710ga_gonk
PRODUCT_DEVICE := $(TARGET_BOARD)
PRODUCT_MODEL := SP7710
PRODUCT_BRAND := Spreadtrum
PRODUCT_MANUFACTURER := Spreadtrum


PRODUCT_PACKAGES += $(MULTILANGUAGE_PRODUCT_PACKAGES)
PRODUCT_LOCALES := zh_CN zh_TW en_US fr_BE in_ID hi_IN ru_RU es_ES vi_VN bn_BD th_TH te_IN am_ET ar_EG cs_CZ pt_BR tl_PH ta_IN my_MM ce_PH uk_UA de_AT de_BE de_CH de_DE de_LI de_LU pl_PL

