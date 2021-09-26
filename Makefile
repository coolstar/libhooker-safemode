TARGET = iphone:latest:11.0
ARCHS = arm64

INSTALL_TARGET_PROCESSES = SafeMode

include $(THEOS)/makefiles/common.mk

XCODEPROJ_NAME = SafeMode

SafeMode_XCODEFLAGS = SWIFT_OLD_RPATH=/usr/lib/libswift/stable
SafeMode_XCODE_SCHEME = SafeMode
SafeMode_CODESIGN_FLAGS = -SSafeMode.entitlements

include $(THEOS_MAKE_PATH)/xcodeproj.mk
