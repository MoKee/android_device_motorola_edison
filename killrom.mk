# Inherit device configuration for Droid Atrix 2.
$(call inherit-product, device/motorola/edison/full_edison.mk)

# Call in the murdrer
$(call inherit-product-if-exists, vendor/nos/killrom/config/common.mk)
$(call inherit-product-if-exists, vendor/google/killrom/config/common.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/nos/killrom/config/gsm.mk)

DEVICE_PACKAGE_OVERLAYS += device/motorola/edison/overlay/killrom

#
# Setup device specific product configuration.
#
PRODUCT_NAME := killrom_edison
PRODUCT_BRAND := ATT
PRODUCT_DEVICE := edison
PRODUCT_MODEL := MB865
PRODUCT_MANUFACTURER := MOTO
PRODUCT_RELEASE_NAME := MOTOROLA ATRIX 2
PRODUCT_SFX := umts

UTC_DATE := $(shell date +%s)
DATE := $(shell date +%Y%m%d)

PRODUCT_BUILD_PROP_OVERRIDES += \
   PRODUCT_NAME=${PRODUCT_DEVICE}_${PRODUCT_SFX} \
   BUILD_NUMBER=${DATE} \
   TARGET_DEVICE=${PRODUCT_DEVICE} \
   BUILD_FINGERPRINT=${PRODUCT_BRAND}/${PRODUCT_DEVICE}_${PRODUCT_SFX}/${PRODUCT_DEVICE_PREFIX}_${PRODUCT_DEVICE}:${PLATFORM_VERSION}/${BUILD_ID}/${DATE}:user/release-keys \
   PRIVATE_BUILD_DESC="${PRODUCT_DEVICE_PREFIX}_${PRODUCT_DEVICE}-user ${PLATFORM_VERSION} ${BUILD_ID} ${DATE} release-keys" \
   PRODUCT_BRAND=${PRODUCT_BRAND} \
   BUILD_UTC_DATE= \
   PRODUCT_DEFAULT_LANGUAGE=en \
   PRODUCT_DEFAULT_REGION=US \

TARGET_BOOTANIMATION_NAME := 540

PRODUCT_PROPERTY_OVERRIDES += \
    ro.killrom.version=KILLRedison

