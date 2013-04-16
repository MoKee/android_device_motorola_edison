PRODUCT_MAKEFILES := $(LOCAL_DIR)/full_edison.mk
ifeq ($(TARGET_PRODUCT),aokp_edison)
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/aokp.mk
endif
ifeq ($(TARGET_PRODUCT),cna_edison)
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/cna.mk
endif
ifeq ($(TARGET_PRODUCT),killrom_edison)
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/killrom.mk
endif
