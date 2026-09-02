include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MyLauncherMenu
MyLauncherMenu_FILES = Tweak.xm
MyLauncherMenu_CFLAGS = -fobjc-arc
MyLauncherMenu_ARCHS = arm64 arm64e

include $(THEOS)/makefiles/tweak.mk
