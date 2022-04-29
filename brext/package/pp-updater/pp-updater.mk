################################################################################
#
# pp-updater
#
################################################################################

PP_UPDATER_DEPENDENCIES = systemd copy-overlays

define PP_UPDATER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_PPOS_PATH)/package/pp-updater/extract-update \
                $(TARGET_DIR)/opt/ppos/bin
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_PPOS_PATH)/package/pp-updater/update-firmware \
		$(TARGET_DIR)/opt/ppos/bin
        $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_PPOS_PATH)/package/pp-updater/partitions \
                $(TARGET_DIR)/opt/ppos/bin
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_PPOS_PATH)/package/pp-updater/reactivate-previous-release \
		$(TARGET_DIR)/opt/ppos/bin
        $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_PPOS_PATH)/package/pp-updater/backup-config \
                $(TARGET_DIR)/opt/ppos/bin
        $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_PPOS_PATH)/package/pp-updater/restore-config \
                $(TARGET_DIR)/opt/ppos/bin
        $(INSTALL) -D -m 0444 $(BR2_EXTERNAL_PPOS_PATH)/VERSION \
                $(TARGET_DIR)/etc/ppos.version
        $(INSTALL) -D -m 0444 $(BR2_EXTERNAL_PPOS_PATH)/PIVERSION \
                $(TARGET_DIR)/etc/raspberrypi.version
        $(INSTALL) -D -m 0444 $(BR2_EXTERNAL_PPOS_PATH)/package/pp-updater/config-files \
                $(TARGET_DIR)/opt/ppos/etc/config-files
        $(INSTALL) -D -m 0444 $(BR2_EXTERNAL_PPOS_PATH)/package/pp-updater/services \
                $(TARGET_DIR)/opt/ppos/etc/services
	echo "Installing kernel"
        $(INSTALL) -D -m 0644 $(BUILD_DIR)/linux-custom/arch/arm/boot/zImage $(TARGET_DIR)/usr/lib/firmware/rpi
	echo "Installing updater"
	$(INSTALL) -D -m 755 $(BR2_EXTERNAL_PPOS_PATH)/../scripts/updater.sh $(TARGET_DIR)/tmp/updater.sh

endef

$(eval $(generic-package))
