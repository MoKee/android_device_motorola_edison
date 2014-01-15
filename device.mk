# Copyright (C) 2013 The CyanogenMod Project
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
# This is the product configuration for a full edison
#

DEVICE_FOLDER := device/motorola/edison

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay

$(call inherit-product, device/motorola/omap4-common/common.mk)

# Hardware HALs
PRODUCT_PACKAGES += \
    power.edison \
    camera.edison \
    lights.edison \
    hwcomposer.edison

# Modem
PRODUCT_PACKAGES += \
    Stk

# Extras
PRODUCT_PACKAGES += \
    openssl \
    strace

# Kexec rootfs files
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/init.mapphone.rc:root/init.mapphone_cdma.rc \
    $(DEVICE_FOLDER)/init.mapphone.rc:root/init.mapphone_umts.rc \
    $(DEVICE_FOLDER)/init.target.rc:root/init.target.rc \
    $(DEVICE_FOLDER)/kexec/devtree:system/etc/kexec/devtree \
    $(OUT)/ramdisk.img:system/etc/kexec/ramdisk.img \
    $(OUT)/kernel:system/etc/kexec/kernel

# Prebuilts
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += fstab.mapphone_umts

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/motorola/edison/edison-vendor.mk)
$(call inherit-product, vendor/motorola/omap4-common/omap4-common-imgtec-vendor-blobs.mk)
