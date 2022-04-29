################################################################################
#
# pp-tools
#
################################################################################

define PP_TOOLS_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_PP_PATH)/package/pp-tools/bootmsg \
           $(TARGET_DIR)/opt/ppos/bin/bootmsg
    $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_PP_PATH)/package/pp-tools/resize-partitions \
                $(TARGET_DIR)/opt/ppos/bin
    $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_PP_PATH)/package/pp-tools/activate-data-partition \
                $(TARGET_DIR)/opt/ppos/bin
    $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_PP_PATH)/package/pp-tools/enable-updi \
                $(TARGET_DIR)/opt/ppos/bin
    $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_PP_PATH)/package/pp-tools/shutdown-system \
		$(TARGET_DIR)/opt/ppos/bin
    touch $(TARGET_DIR)/resize-me
endef

define PP_TOOLS_INSTALL_INIT_SYSTEMD
        $(INSTALL) -D -m 0644 $(BR2_EXTERNAL_PP_PATH)/package/pp-tools/resize-partitions.service \
                $(TARGET_DIR)/usr/lib/systemd/system/reboot.service
        $(INSTALL) -D -m 0644 $(BR2_EXTERNAL_PP_PATH)/package/pp-tools/activate-data-partition.service \
                $(TARGET_DIR)/usr/lib/systemd/system/activate-data-partition.service
        $(INSTALL) -D -m 0644 $(BR2_EXTERNAL_PP_PATH)/package/pp-tools/sshdconfig.service \
                $(TARGET_DIR)/usr/lib/systemd/system/sshdconfig.service

	# Systemd logging to RAM
	$(INSTALL) -D -m 0644 $(BR2_EXTERNAL_PP_PATH)/package/pp-tools/journald.conf \
	        $(TARGET_DIR)/etc/systemd/journald.conf
endef

$(eval $(generic-package))
