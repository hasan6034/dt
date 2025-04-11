#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_PACKAGES += \
    com.android.hardware.boot \
    android.hardware.boot-service.default_recovery

PRODUCT_PACKAGES += \
    create_pl_dev \
    create_pl_dev.recovery

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
TARGET_EXCLUDES_AUDIOFX := true

PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.soundtrigger@2.3-impl:32

PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    audio.primary.default \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.stub

PRODUCT_PACKAGES += \
    libaudiofoundation.vendor \
    libalsautils \
    libnbaio_mono \
    libtinycompress \
    libdynproc \
    libhapticgenerator

PRODUCT_PACKAGES += \
    BesLoudness \
    MtkInCallService

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.audio-impl \
    android.hardware.bluetooth@1.1.vendor \
    libbluetooth_audio_session

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4 \
    android.hardware.camera.provider@2.4.vendor \
    android.hardware.camera.provider@2.5 \
    android.hardware.camera.provider@2.5.vendor \
    android.hardware.camera.provider@2.6 \
    android.hardware.camera.provider@2.6.vendor \
    android.hardware.camera.device@3.2 \
    android.hardware.camera.device@3.2.vendor \
    android.hardware.camera.device@3.3 \
    android.hardware.camera.device@3.3.vendor \
    android.hardware.camera.device@3.4 \
    android.hardware.camera.device@3.4.vendor \
    android.hardware.camera.device@3.5 \
    android.hardware.camera.device@3.5.vendor \
    android.hardware.camera.device@3.6 \
    android.hardware.camera.device@3.6.vendor

PRODUCT_PACKAGES += \
    libcamera_metadata_shim \
    libcamera_metadata.vendor \
    libexif.vendor:64 \
    libpng.vendor:64

# ConsumerIr
PRODUCT_PACKAGES += \
    android.hardware.ir-service.example

# Cgroup
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups_30.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles_30.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@4.0.vendor \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.memtrack-service.mediatek-mali

PRODUCT_PACKAGES += \
    libdrm.vendor \
    libion.vendor \
    libui.vendor \
    libunwindstack.vendor \
    libutilscallstack.vendor \
    libgralloctypes.vendor \
    libprocessgroup.vendor \
    libjsoncpp.vendor \
    libsqlite.vendor \
    libssl.vendor \
    libtinyxml

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey \
    android.hardware.drm@1.4.vendor \
    libprotobuf-cpp-lite-3.9.1-vendorcompat

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.selene \
    com.fingerprints.extension@1.0.vendor \

PRODUCT_PACKAGES += \
    vendor.goodix.hardware.biometrics.fingerprint@2.1.vendor

# FM
PRODUCT_PACKAGES += \
    FMRadio

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0-impl \
    libgatekeeper.vendor:64

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss.measurement_corrections@1.1.vendor \
    android.hardware.gnss.visibility_control@1.0.vendor \
    android.hardware.gnss-V1-ndk.vendor \
    android.hardware.gnss@2.1.vendor \
    libcurl.vendor:64 \
    libexpat.vendor

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.mediatek \
    android.hardware.health-service.mediatek-recovery

PRODUCT_PACKAGES += \
    android.hardware.health@1.0.vendor

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.allocator@1.0.vendor \
    libhidlmemory.vendor \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder.vendor

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc \
    $(LOCAL_PATH)/configs/idc/uinput-goodix.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-goodix.idc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-goodix.kl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/excluded-input-devices.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/excluded-input-devices.xml

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor \
    android.hardware.hardware_keystore.km41.xml \
    libkeymaster4_1support.vendor \
    libkeymaster41.vendor \
    libpuresoftkeymasterdevice.vendor \
    libsoft_attestation_cert.vendor

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.xiaomi

# Linker
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Lineage Health
PRODUCT_PACKAGES += \
    vendor.lineage.health-service.default

PRODUCT_PACKAGES += \
    libprocessgroup_shim \
    libshim_audio \
    libbase_shim \
    libshim_beanpod \

# Media
PRODUCT_PACKAGES += \
    libavservices_minijail_vendor \
    libcodec2_hidl@1.2.vendor \
    libcodec2_soft_common.vendor \
    libsfplugin_ccodec_utils.vendor \
    libstagefright_softomx_plugin.vendor \
    libstagefright_foundation-v33

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/media,$(TARGET_COPY_OUT_VENDOR)/etc) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/seccomp,$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy)

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor \
    libtextclassifier_hash.vendor

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2021-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    com.android.nfc_extras \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_nfc/com.nxp.mifare.xml 

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_PACKAGES += \
    CarrierConfigOverlaySelene \
    FrameworksResOverlaySelene \
    SettingsOverlaySelene \
    SystemUIOverlaySelene \
    TelephonyOverlaySelene \
    WifiResOverlaySelene

PRODUCT_ENFORCE_RRO_TARGETS := *

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.0 \
    android.hardware.power@1.0.vendor \
    android.hardware.power@1.1 \
    android.hardware.power@1.1.vendor \
    android.hardware.power@1.2 \
    android.hardware.power@1.2.vendor \
    android.hardware.power@1.3 \
    android.hardware.power@1.3.vendor \
    android.hardware.power-service.lineage-libperfmgr \

PRODUCT_PACKAGES += \
    libmtkperf_client_vendor \
    libmtkperf_client

PRODUCT_PACKAGES += \
    vendor.mediatek.hardware.mtkpower@1.0.vendor \
    vendor.mediatek.hardware.mtkpower@1.1.vendor \
    vendor.mediatek.hardware.mtkpower@1.2-service.stub

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Power Off Alarm
PRODUCT_PACKAGES += \
    PowerOffAlarm

# Properties
include $(LOCAL_PATH)/configs/props/vendor_logtag.mk

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/props/board_id/odm,$(TARGET_COPY_OUT_ODM)/etc/properties) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/props/board_id/product,$(TARGET_COPY_OUT_PRODUCT)/etc/properties) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/props/board_id/system,$(TARGET_COPY_OUT_SYSTEM)/etc/properties) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/props/board_id/system_ext,$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/properties) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/props/board_id/vendor,$(TARGET_COPY_OUT_VENDOR)/etc/properties)

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio.config@1.3.vendor \
    android.hardware.radio@1.6.vendor

# Radio (IMS)
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

PRODUCT_PACKAGES += \
    libnetutils.vendor:64 \
    libshim_sink \
    libui_shim

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-com.mediatek.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.mediatek.ims.xml

# Recovery
PRODUCT_COPY_FILES += \
    vendor/xiaomi/selene/proprietary/vendor/firmware/focaltech_ts_fw_.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/focaltech_ts_fw_.bin \
    vendor/xiaomi/selene/proprietary/vendor/firmware/focaltech_ts_fw_huaxing.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/focaltech_ts_fw_huaxing.bin \
    vendor/xiaomi/selene/proprietary/vendor/firmware/focaltech_ts_fw_xinli.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/focaltech_ts_fw_xinli.bin \
    vendor/xiaomi/selene/proprietary/vendor/firmware/mt6631_fm_v1_coeff.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/mt6631_fm_v1_coeff.bin \
    vendor/xiaomi/selene/proprietary/vendor/firmware/mt6631_fm_v1_patch.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/mt6631_fm_v1_patch.bin \
    vendor/xiaomi/selene/proprietary/vendor/firmware/novatek_ts_fw.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/novatek_ts_fw.bin \
    vendor/xiaomi/selene/proprietary/vendor/firmware/novatek_ts_mp.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/novatek_ts_mp.bin

# Rootdir
PRODUCT_PACKAGES += \
    fstab.mt6768 \
    fstab.mt6768.ramdisk \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6768.rc \
    init.mt6768.usb.rc \
    init.project.rc \
    init.sensor_1_0.rc \
    init.target.rc \
    init.nfc.rc \
    ueventd.mtk.rc

PRODUCT_PACKAGES += \
    init.recovery.mt6768.rc

# Secure Element
PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.2.vendor

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors-service.xiaomi-multihal \
    android.frameworks.sensorservice@1.0.vendor \
    libpower.vendor:64 \
    libsensorndkbridge \
    libshim_sensors \
    libshim_watermark

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/lineage/interfaces/power-libperfmgr \
    hardware/mediatek/libmtkperf_client \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/mediatek \
    hardware/xiaomi

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal-service.mediatek

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb-service.mediatek \
    android.hardware.usb.gadget-service.mediatek

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.mediatek

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v32/arm64/arch-arm-armv8-a/shared/vndk-core/libbinder.so:$(TARGET_COPY_OUT_VENDOR)/lib/libbinder-v32.so \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-core/libbinder.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libbinder-v32.so \
    prebuilts/vndk/v32/arm64/arch-arm-armv8-a/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib/libhidlbase-v32.so \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhidlbase-v32.so \
    prebuilts/vndk/v32/arm64/arch-arm-armv8-a/shared/vndk-sp/libutils.so:$(TARGET_COPY_OUT_VENDOR)/lib/libutils-v32.so \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-sp/libutils.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libutils-v32.so

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    hostapd \
    libwifi-hal-wrapper \
    wpa_supplicant

PRODUCT_PACKAGES += \
    android.hardware.tetheroffload.config@1.0.vendor \
    android.hardware.tetheroffload.control@1.1.vendor

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/wifi/,$(TARGET_COPY_OUT_VENDOR)/etc/wifi)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/selene/selene-vendor.mk)

# Speed profile services and wifi-service to reduce RAM and storage
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# Speed profile services and wifi-service to reduce RAM and storage.
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# Always preopt extracted APKs to prevent extracting out of the APK for gms
# modules.
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true

# Use a profile based boot image for this device. Note that this is currently a
# generic profile and not Android Go optimized.
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt

# Do not generate libartd.
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
