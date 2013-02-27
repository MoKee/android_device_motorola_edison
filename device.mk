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

# Hardware HALs
PRODUCT_PACKAGES += \
    camera.edison \
    lights.edison

ifeq ($(BOARD_USES_KEXEC),true)
PRODUCT_PACKAGES += \
    hwcomposer.edison
endif

# Modem
PRODUCT_PACKAGES += \
    Stk

# Root files
PRODUCT_COPY_FILES += \
    device/motorola/edison/root/default.prop:/root/default.prop \
    device/motorola/edison/root/init.mapphone_cdma.rc:/root/init.mapphone_cdma.rc \
    device/motorola/edison/root/init.mapphone_umts.rc:/root/init.mapphone_umts.rc \
    device/motorola/edison/root/ueventd.mapphone_cdma.rc:/root/ueventd.mapphone_cdma.rc \
    device/motorola/edison/root/ueventd.mapphone_umts.rc:/root/ueventd.mapphone_umts.rc \
    device/motorola/edison/root/init.usb.rc:/root/init.usb.rc

# Kexec files and ti ducati or rootfs files
ifeq ($(BOARD_USES_KEXEC),true)
PRODUCT_COPY_FILES += \
    device/motorola/edison/kexec/devtree:system/etc/kexec/devtree \
    $(OUT)/ramdisk.img:system/etc/kexec/ramdisk.img \
    device/motorola/edison/prebuilt/etc/firmware/ducati-m3.bin:system/etc/firmware/ducati-m3.bin \
    $(OUT)/kernel:system/etc/kexec/kernel
else
PRODUCT_COPY_FILES += \
    device/motorola/edison/root/default.prop:/system/etc/rootfs/default.prop \
    device/motorola/edison/root/init.rc:/system/etc/rootfs/init.rc \
    device/motorola/edison/root/init.mapphone_cdma.rc:/system/etc/rootfs/init.mapphone_cdma.rc \
    device/motorola/edison/root/init.mapphone_umts.rc:/system/etc/rootfs/init.mapphone_umts.rc \
    device/motorola/edison/root/init.usb.rc:/system/etc/rootfs/init.usb.rc \
    device/motorola/edison/root/ueventd.rc:/system/etc/rootfs/ueventd.rc \
    device/motorola/edison/root/ueventd.mapphone_cdma.rc:/system/etc/rootfs/ueventd.mapphone_cdma.rc \
    device/motorola/edison/root/ueventd.mapphone_umts.rc:/system/etc/rootfs/ueventd.mapphone_umts.rc \
    $(OUT)/root/sbin/adbd:system/etc/rootfs/sbin/adbd
endif

# Prebuilts
PRODUCT_COPY_FILES += \
    device/motorola/edison/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
    device/motorola/edison/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/motorola/edison/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/motorola/edison/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# copy all kernel modules under the "modules" directory to system/lib/modules
ifneq ($(BOARD_USES_KEXEC),true)
PRODUCT_COPY_FILES += $(shell \
    find device/motorola/edison/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')
endif

$(call inherit-product, device/motorola/omap4-common/common.mk)
