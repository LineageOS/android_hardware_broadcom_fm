LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

#
# UIM Application
#

ifneq ($(BOARD_UIM_BUILDCFG_INCLUDE_DIR),)
  uim_buildcfg_C_INCLUDES := $(BOARD_UIM_BUILDCFG_INCLUDE_DIR)
  uim_buildcfg_CFLAGS += -DHAS_UIM_BUILDCFG
else
  uim_buildcfg_C_INCLUDES :=
  uim_buildcfg_CFLAGS += -DHAS_NO_UIM_BUILDCFG
endif

LOCAL_C_INCLUDES:= \
    $(LOCAL_PATH)/include \
    $(uim_buildcfg_C_INCLUDES)

LOCAL_SRC_FILES:= \
    uim.c \
    upio.c \
    brcm_hci_dump.c \
    btsnoop.c \
    utils.c

LOCAL_CLANG := false
LOCAL_CFLAGS:= -c -W -Wall -O2 -D_POSIX_SOURCE -DUIM_DEBUG -DBLUEDROID_ENABLE_V4L2 $(uim_buildcfg_CFLAGS)
LOCAL_SHARED_LIBRARIES:= libnetutils libcutils liblog

LOCAL_MODULE := brcm-uim-sysfs
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)
