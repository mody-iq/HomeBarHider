TARGET := iphone:clang:latest:15.0
ARCHS = arm64e
THEOS_PACKAGE_SCHEME = roothide
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HomeBarHider

HomeBarHider_FILES = Tweak.x
HomeBarHider_CFLAGS = -fobjc-arc
HomeBarHider_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
