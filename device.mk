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

# This file includes all definitions that apply to ALL mako devices, and
# are also specific to mako devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS := device/motorola/edison/overlay

# Audio
PRODUCT_COPY_FILES += \
    device/motorola/edison/audio/alsa.omap4.so:/system/lib/hw/alsa.omap4.so \
    device/motorola/edison/audio/audio.primary.omap4.so:/system/lib/hw/audio.primary.edison.so \
    device/motorola/edison/audio/audio_policy.omap4.so:/system/lib/hw/audio_policy.omap4.so \
    device/motorola/edison/audio/libasound.so:/system/lib/libasound.so \
    device/motorola/edison/audio/libaudio_ext.so:/system/lib/libaudio_ext.so

# Hardware HALs
PRODUCT_PACKAGES += \
    hwcomposer.edison

# Modem
PRODUCT_PACKAGES += \
    Stk

# Extras
PRODUCT_PACKAGES += \
    openssl

# Root files
PRODUCT_COPY_FILES += \
    device/motorola/edison/root/default.prop:/root/default.prop \
    device/motorola/edison/root/init.rc:/root/init.rc \
    device/motorola/edison/root/init.mapphone_cdma.rc:/root/init.mapphone_cdma.rc \
    device/motorola/edison/root/init.mapphone_umts.rc:/root/init.mapphone_umts.rc \
    device/motorola/edison/root/ueventd.rc:/root/ueventd.rc \
    device/motorola/edison/root/ueventd.mapphone_cdma.rc:/root/ueventd.mapphone_cdma.rc \
    device/motorola/edison/root/ueventd.mapphone_umts.rc:/root/ueventd.mapphone_umts.rc

# Prebuilts
PRODUCT_COPY_FILES += \
    device/motorola/edison/prebuilt/bin/battd:system/bin/battd \
    device/motorola/edison/prebuilt/bin/mount_ext3.sh:system/bin/mount_ext3.sh \
    device/motorola/edison/prebuilt/etc/gps.conf:system/etc/gps.conf \
    device/motorola/edison/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
    device/motorola/edison/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/motorola/edison/prebuilt/etc/vold.fstab:system/etc/vold.fstab \

# copy all kernel modules under the "modules" directory to system/lib/modules
ifneq ($(BOARD_USES_KEXEC),true)
PRODUCT_COPY_FILES += $(shell \
    find device/motorola/edison/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')
endif

$(call inherit-product, device/motorola/common/common.mk)
