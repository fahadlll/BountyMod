export THEOS_DEVICE_IP = localhost
export THEOS_DEVICE_PORT = 2222

TARGET := iphone:clang:latest:15.0
ARCHS := arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BountyMod

BountyMod_FILES = Tweak.x
BountyMod_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
