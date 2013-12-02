
MALI := libUMP libEGL_mali.so libGLESv1_CM_mali.so libGLESv2_mali.so libMali.so ump.ko mali.ko



SPRD_FM_APP := FMPlayer

#FFOS specific macros, may move into a new file someday
ENABLE_LIBRECOVERY := true
PRODUCT_PROPERTY_OVERRIDES := \
	ro.moz.omx.hw.max_width=720 \
	ro.moz.omx.hw.max_height=576 \
	ro.moz.ril.query_icc_count=true

# original apps copied from generic_no_telephony.mk
PRODUCT_PACKAGES := \
	DeskClock \
	Bluetooth \
	Calculator \
	Calendar \
	CertInstaller \
	DrmProvider \
	Email \
	Exchange2 \
	Gallery2 \
	InputDevices \
	LatinIME \
	Music \
	MusicFX \
	Provision \
	QuickSearchBox \
	SystemUI \
	CalendarProvider \
	bluetooth-health \
	hciconfig \
	hcitool \
	hcidump \
	bttest\
	hostapd \
	wpa_supplicant.conf \
	audio.a2dp.default \
        SoundRecorder \
        libmorpho_facesolid.so

# own copyright packages files
PRODUCT_PACKAGES += \
    AudioProfile \
    ValidationTools \
    libvalidationtoolsjni \
    vtserver	\
	\
    libstagefright_sprd_mpeg4enc	\
    libstagefright_sprd_mpeg4dec \
    libstagefright_sprd_h264dec	\
    libstagefright_sprd_aacdec \
    libstagefright_sprd_mp3dec

# prebuild files
PRODUCT_PACKAGES += \
    ES_File_Explorer.apk

PRODUCT_PACKAGES += \
	modem_control\
	mcom_monitor \
	nvitemd \
	charge \
	vcharged7 \
	poweroff_alarm \
	mplayer \
	sqlite3 \
	calibration_init \
	gralloc.$(TARGET_PLATFORM) \
	hwcomposer.$(TARGET_PLATFORM) \
	camera.$(TARGET_PLATFORM) \
	lights.$(TARGET_PLATFORM) \
	audio.primary.$(TARGET_PLATFORM) \
	audio_policy.$(TARGET_PLATFORM) \
	tinymix \
	sensors.$(TARGET_PLATFORM) \
	libmbbms_tel_jni.so \
	$(MALI) \
	zram.sh \
	libsprdstreamrecoder \
	libvtmanager\
   fm.$(TARGET_PLATFORM)

PRODUCT_PACKAGES += \
            $(SPRD_FM_APP)
PRODUCT_COPY_FILES := \
	$(BOARDDIR)/init.rc:root/init.rc \
	$(BOARDDIR)/init.sc7710g.rc:root/init.sc7710g.rc \
	$(BOARDDIR)/init.sc7710g.usb.rc:root/init.sc7710g.usb.rc \
	$(BOARDDIR)/ueventd.sc7710g.rc:root/ueventd.sc7710g.rc \
	$(BOARDDIR)/fstab.sc7710g:root/fstab.sc7710g \
	$(BOARDDIR)/vold.fstab:system/etc/vold.fstab \
	$(BOARDDIR)/modem_images.info:root/modem_images.info \
	$(BOARDDIR)/nvitem.cfg:root/nvitem.cfg \
	frameworks/base/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/base/data/etc/android.hardware.screen.landscape.xml:system/etc/permissions/android.hardware.screen.landscape.xml \
	frameworks/base/data/etc/android.hardware.screen.portrait.xml:system/etc/permissions/android.hardware.screen.portrait.xml \
	frameworks/base/data/etc/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \

#$(call inherit-product, $(BOARDDIR)/../common/apps/engineeringmodel/module.mk)
#$(call inherit-product, $(BOARDDIR)/../common/apps/modemassert/module.mk)
#$(call inherit-product, hardware/broadcom/wlan/bcmdhd/firmware/bcm40181/device-bcm.mk)
#$(call inherit-product, $(BOARDDIR)/../common/apps/modemassert/module.mk)
#$(call inherit-product, device/sprd/partner/ublox/device-ublox-gps.mk)
#$(call inherit-product, device/sprd/partner/nmi/device-nmi-atv.mk)

