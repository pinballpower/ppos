################################################################################
#
# pp-dmdreader
#
################################################################################

PP_DMDREADER_VERSION = master
PP_DMDREADER_SITE = $(call github,pinballpower,code_dmdreader,$(PP_DMDREADER_VERSION))

PP_DMDREADER_DEPENDENCIES = host-pkgconf boost libdrm sdl2 mesa3d

PP_DMDREADER_CONF_OPTS += \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_BOOST_STATIC_LIBS=OFF

define PP_DMDREADER_INSTALL_CONF
endef

define PP_DMDREADER_INSTALL_INIT_SYSTEMD
endef

PP_DMDREADER_POST_INSTALL_TARGET_HOOKS += PP_DMDREADER_INSTALL_CONF

$(eval $(cmake-package))
