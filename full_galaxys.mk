#
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := Galaxy S
PRODUCT_DEVICE := SGH-T959
PRODUCT_MODEL := SGH-T959
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung

# Kernel Targets
ifeq ($(TARGET_PREBUILT_KERNEL),)
ifeq ($(TARGET_KERNEL_CONFIG),)
TARGET_PREBUILT_KERNEL := device/samsung/galaxys/kernel
endif # TARGET_KERNEL_CONFIG
endif # TARGET_PREBUILT_KERNEL

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)


PRODUCT_COPY_FILES += \
    device/samsung/galaxys/init.smdkc110.rc:root/init.smdkc110.rc

PRODUCT_POLICY := android.policy_phone


PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    rild.libpath=/system/lib/libreference-ril.so \
    rild.libargs=-d /dev/ttyS0 \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15



# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

#
# Copy galaxys specific prebuilt files
#

#
# Wifi
#
PRODUCT_COPY_FILES += \
    device/samsung/galaxys/prebuilt/wifi/libwlservice.so:system/lib/libwlservice.so \
    device/samsung/galaxys/prebuilt/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt \
    device/samsung/galaxys/prebuilt/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
    device/samsung/galaxys/prebuilt/wifi/bcm4329_aps.bin:system/etc/wifi/bcm4329_aps.bin \
    device/samsung/galaxys/prebuilt/wifi/bcm4329_mfg.bin:system/etc/wifi/bcm4329_mfg.bin \
    device/samsung/galaxys/prebuilt/wifi/bcm4329_sta.bin:system/etc/wifi/bcm4329_sta.bin \
    device/samsung/galaxys/prebuilt/wifi/wifi.conf:system/etc/wifi/wifi.conf \
    device/samsung/galaxys/prebuilt/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/galaxys/prebuilt/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/galaxys/prebuilt/wifi/wlservice:system/bin/wlservice \
    device/samsung/galaxys/prebuilt/wifi/wpa_supplicant:system/bin/wpa_supplicant



#
# Display (3D)
#
PRODUCT_COPY_FILES += \
    device/samsung/galaxys/prebuilt/egl/egl.cfg:system/lib/egl/egl.cfg \
    device/samsung/galaxys/prebuilt/egl/libEGL_POWERVR_SGX540_120.so:system/lib/egl/libEGL_POWERVR_SGX540_120.so \
    device/samsung/galaxys/prebuilt/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    device/samsung/galaxys/prebuilt/egl/libGLESv1_CM_POWERVR_SGX540_120.so:system/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
    device/samsung/galaxys/prebuilt/egl/libGLESv2_POWERVR_SGX540_120.so:system/lib/egl/libGLESv2_POWERVR_SGX540_120.so

#
# Sensors, Lights etc
#
PRODUCT_COPY_FILES += \
    device/samsung/galaxys/prebuilt/hw/copybit.s5pc110.so:system/lib/hw/copybit.s5pc110.so \
    device/samsung/galaxys/prebuilt/hw/lights.default.so:system/lib/hw/lights.default.so \
    device/samsung/galaxys/prebuilt/hw/sensors.SGH-T959.so:system/lib/hw/sensors.SGH-T959.so \
    device/samsung/galaxys/prebuilt/hw/gralloc.s5pc110.so:system/lib/hw/gralloc.s5pc110.so

#
# Keys
#
PRODUCT_COPY_FILES += \
    device/samsung/galaxys/prebuilt/keylayout/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl \
    device/samsung/galaxys/prebuilt/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/galaxys/prebuilt/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/galaxys/prebuilt/keylayout/melfas-touchkey.kl:system/usr/keylayout/melfas-touchkey.kl \
    device/samsung/galaxys/prebuilt/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/galaxys/prebuilt/keychars/s3c-keypad.kcm.bin:system/usr/keychars/s3c-keypad.kcm.bin \
    device/samsung/galaxys/prebuilt/keychars/sec_jack.kcm.bin:system/usr/keychars/sec_jack.kcm.bin \
    device/samsung/galaxys/prebuilt/keychars/melfas-touchkey.kcm.bin:system/usr/keychars/melfas-touchkey.kcm.bin \
    device/samsung/galaxys/prebuilt/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/samsung/galaxys/prebuilt/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin  


#
# Vold
#
PRODUCT_COPY_FILES += \
    device/samsung/galaxys/prebuilt/vold.fstab:system/etc/vold.fstab 

#
# Camera
#
PRODUCT_COPY_FILES += \
    device/samsung/galaxys/prebuilt/camera/libarccamera.so:system/lib/libarccamera.so \
    device/samsung/galaxys/prebuilt/camera/libcamerafirmwarejni.so:system/lib/libcamerafirmwarejni.so \
    device/samsung/galaxys/prebuilt/camera/libcamera.so:system/lib/libcamera.so \
    device/samsung/galaxys/prebuilt/camera/libseccameraadaptor.so:system/lib/libseccameraadaptor.so \
    device/samsung/galaxys/prebuilt/camera/libseccamera.so:system/lib/libseccamera.so

#
# RIL
#
PRODUCT_COPY_FILES += \
    device/samsung/galaxys/prebuilt/ril/libril.so:system/lib/libril.so \
    device/samsung/galaxys/prebuilt/ril/libril-reference.so:system/lib/libril-reference.so \
    device/samsung/galaxys/prebuilt/ril/libsecril-client.so:system/lib/libsecril-client.so \
    device/samsung/galaxys/prebuilt/ril/drexe:system/bin/drexe \
    device/samsung/galaxys/prebuilt/ril/efsd:system/bin/efsd \
    device/samsung/galaxys/prebuilt/ril/efsd30:system/bin/efsd30 \
    device/samsung/galaxys/prebuilt/ril/rilclient-test:system/bin/rilclient-test

#
# OMX
#
PRODUCT_COPY_FILES += \
    device/samsung/galaxys/prebuilt/omx/libs263domxoc.so:system/lib/libs263domxoc.so \
    device/samsung/galaxys/prebuilt/omx/libs263eomxoc.so:system/lib/libs263eomxoc.so \
    device/samsung/galaxys/prebuilt/omx/libs264domxoc.so:system/lib/libs264domxoc.so \
    device/samsung/galaxys/prebuilt/omx/libs264eomxoc.so:system/lib/libs264eomxoc.so \
    device/samsung/galaxys/prebuilt/omx/libsaacdomxoc.so:system/lib/libsaacdomxoc.so \
    device/samsung/galaxys/prebuilt/omx/libsaaceomxoc.so:system/lib/libsaaceomxoc.so \
    device/samsung/galaxys/prebuilt/omx/libsac3domxoc.so:system/lib/libsac3domxoc.so \
    device/samsung/galaxys/prebuilt/omx/libsamrdomxoc.so:system/lib/libsamrdomxoc.so \
    device/samsung/galaxys/prebuilt/omx/libsamreomxoc.so:system/lib/libsamreomxoc.so \
    device/samsung/galaxys/prebuilt/omx/libsdiv3domxoc.so:system/lib/libsdiv3domxoc.so \
    device/samsung/galaxys/prebuilt/omx/libsflacdomxoc.so:system/lib/libsflacdomxoc.so \
    device/samsung/galaxys/prebuilt/omx/libsmp3domxoc.so:system/lib/libsmp3domxoc.so \
    device/samsung/galaxys/prebuilt/omx/libsmp4fmocn.so:system/lib/libsmp4fmocn.so \
    device/samsung/galaxys/prebuilt/omx/libsmp4vdomxoc.so:system/lib/libsmp4vdomxoc.so \
    device/samsung/galaxys/prebuilt/omx/libsmp4veomxoc.so:system/lib/libsmp4veomxoc.so \
    device/samsung/galaxys/prebuilt/omx/libsvc1domxoc.so:system/lib/libsvc1domxoc.so \
    device/samsung/galaxys/prebuilt/omx/libswmadomxoc.so:system/lib/libswmadomxoc.so \
    device/samsung/galaxys/prebuilt/omx/libswmv7domxoc.so:system/lib/libswmv7domxoc.so \
    device/samsung/galaxys/prebuilt/omx/libswmv8domxoc.so:system/lib/libswmv8domxoc.so \

# libspeech
PRODUCT_COPY_FILES += device/samsung/galaxys/prebuilt/audio/libspeech.so:system/lib/libspeech.so


# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.startheapsize=8m \
    dalvik.vm.heapsize=48m

# GalaxyS uses high-density artwork where available
PRODUCT_LOCALES := hdpi



