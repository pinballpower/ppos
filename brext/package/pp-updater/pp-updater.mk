################################################################################
#
# pp-updater
#
################################################################################

PP_UPDATER_DEPENDENCIES = systemd

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
        $(INSTALL) -D -m 0444 $(BR2_EXTERNAL_PPOS_PATH)/package/pp-updater/config-files \
                $(TARGET_DIR)/opt/ppos/etc/config-files
        $(INSTALL) -D -m 0444 $(BR2_EXTERNAL_PPOS_PATH)/package/pp-updater/services \
                $(TARGET_DIR)/opt/ppos/etc/services
	echo "Installing kernel"
        $(INSTALL) -D -m 0644 $(BUILD_DIR)/linux-custom/arch/arm64/boot/Image.gz $(TARGET_DIR)/usr/lib/firmware/rpi
	echo "Installing updater"
	$(INSTALL) -D -m 755 $(BR2_EXTERNAL_PPOS_PATH)/updater.sh $(TARGET_DIR)/tmp/updater.sh

	# Partition resizing and /data
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_PPOS_PATH)/package/pp-tools/resize-partitions \
                $(TARGET_DIR)/opt/ppos/bin
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_PPOS_PATH)/package/pp-tools/activate-data-partition \
                $(TARGET_DIR)/opt/ppos/bin

endef

define PP_UPDATER_INSTALL_INIT_SYSTEMD
        $(INSTALL) -D -m 0644 $(BR2_EXTERNAL_PPOS_PATH)/package/pp-updater/resize-partitions.service \
                $(TARGET_DIR)/usr/lib/systemd/system/resize-partitions.service
        $(INSTALL) -D -m 0644 $(BR2_EXTERNAL_PPOS_PATH)/package/pp-updater/activate-data-partition.service \
                $(TARGET_DIR)/usr/lib/systemd/system/activate-data-partition.service
endef

$(eval $(generic-package))
