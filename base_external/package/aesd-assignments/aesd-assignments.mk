##############################################################
#
# AESD-ASSIGNMENTS
# modification: 27DEC2025, by Arnaud SIMO
##############################################################

AESD_ASSIGNMENTS_VERSION = cb8b5229f7e6c5617ffca42fca1951cf80c1043d
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-simo-2021.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Configuration
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/finder-app/conf
	$(INSTALL) -m 0644 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/

	# Binaire writer
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
