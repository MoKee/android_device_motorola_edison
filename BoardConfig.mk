# inherit from common
-include device/motorola/omap4-kexec-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/motorola/edison/BoardConfigVendor.mk

# Processor
TARGET_BOOTLOADER_BOARD_NAME := edison

# Kernel
BOARD_KERNEL_CMDLINE := root=/dev/ram0 rw mem=1023M@0x80000000 console=null vram=10300K omapfb.vram=0:8256K,1:4K,2:2040K init=/init ip=off mmcparts=mmcblk1:p7(pds),p15(boot),p16(recovery),p17(cdrom),p18(misc),p19(cid),p20(kpanic),p21(system),p22(cache),p23(preinstall),p24(webtop),p25(userdata) mot_sst=1 androidboot.bootloader=0x0A74
BOARD_KERNEL_BASE := 0x80000000
BOARD_PAGE_SIZE := 0x4096

# Kernel Build
TARGET_KERNEL_SOURCE := kernel/motorola/omap4-kexec-common
TARGET_KERNEL_CONFIG := mapphone_edison_defconfig

TARGET_USES_CUSTOM_INITFILES := true
