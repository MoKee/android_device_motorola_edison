## Specify phone tech before including full_phone
$(call inherit-product, vendor/mk/config/gsm.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540
# Inherit some common CM stuff.
$(call inherit-product, vendor/mk/config/common_full_phone.mk)

# Inherit device configuration for Droid Atrix 2.
$(call inherit-product, device/motorola/edison/full_edison.mk)

## Device identifier. This must come after all inclusions

PRODUCT_NAME := mk_edison
PRODUCT_BRAND := MOTO
PRODUCT_DEVICE := edison
PRODUCT_MODEL := MB865
PRODUCT_MANUFACTURER := Motorola
PRODUCT_RELEASE_NAME := MB865
PRODUCT_SFX := umts

# Enable Torch
PRODUCT_PACKAGES += Torch