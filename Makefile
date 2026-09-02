include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MyLauncherMenu
MyLauncherMenu_FILES = Tweak.xm
MyLauncherMenu_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/tweak.mk
