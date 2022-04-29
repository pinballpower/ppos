################################################################################
#
# configtxt
#
################################################################################

CONFIGTXT_DEPENDENCIES = rpi-firmware

define CONFIGTXT_INSTALL_TARGET_CMDS
        echo "# Enable I2C and SPI" >> $(BINARIES_DIR)/rpi-firmware/config.txt
	echo "dtparam=i2c=on" >> $(BINARIES_DIR)/rpi-firmware/config.txt
	echo "dtparam=spi=on" >> $(BINARIES_DIR)/rpi-firmware/config.txt

        # Add VC4 overlay
        sed -i s/.*vc4-*kms-v3d.*//g $(BINARIES_DIR)/rpi-firmware/config.txt
        echo "dtoverlay=vc4-fkms-v3d,audio=off" >> $(BINARIES_DIR)/rpi-firmware/config.txt

        # Make sure it gets registered in systemd
        mkdir -p $(TARGET_DIR)/usr/lib/udev/rules.d
        cp $(BR2_EXTERNAL_PPOS_PATH)/package/configtxt/60-drm.rules \
		$(TARGET_DIR)/usr/lib/udev/rules.d/60-drm.rules
endef


define CONFIGTXT_QUIET_INSTALL_TARGET_CMDS
 	echo "INstalling quiet cmdline.txt"
        $(INSTALL) -D -m 644 $(BR2_EXTERNAL_PPOS_PATH)/package/configtxt/cmdline.quiet \
                $(BINARIES_DIR)/rpi-firmware/cmdline.txt
endef

define CONFIGTXT_VERBOSE_INSTALL_TARGET_CMDS
	echo "Installing verbose cmdline.txt"
        $(INSTALL) -D -m 644 $(BR2_EXTERNAL_PPOS_PATH)/package/configtxt/cmdline.verbose \
                $(BINARIES_DIR)/rpi-firmware/cmdline.txt
endef

ifeq ($(BR2_PACKAGE_CONFIGTXT_QUIET),y)
CONFIGTXT_POST_INSTALL_TARGET_HOOKS += CONFIGTXT_QUIET_INSTALL_TARGET_CMDS
else
CONFIGTXT_POST_INSTALL_TARGET_HOOKS += CONFIGTXT_VERBOSE_INSTALL_TARGET_CMDS
endif

$(eval $(generic-package))

