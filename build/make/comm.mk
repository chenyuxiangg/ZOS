# set current file env path
COMM_CURRENT_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))

# set global env path, every mk file can use
G_PROJECT_PATH := $(dir $(COMM_CURRENT_PATH))/../..
G_KERNEL_PATH := $(G_PROJECT_PATH)/kernel
G_BUILD_PATH := $(G_PROJECT_PATH)/build
G_TEST_PATH := $(G_PROJECT_PATH)/test
G_OUTPUT_PATH := $(G_PROJECT_PATH)/output

# set compiler info
CROSS = $(CROSS_COMPILER_PATH)/riscv32-unknown-elf-
CC = $(CROSS)gcc
LD = $(CROSS)ld
AR = $(CROSS)ar
OBJDUMP = $(CROSS)objdump
OBJCOPY = $(CROSS)objcopy
GDB := $(CROSS)gdb

# set hide command
HIDE := @

# set linker file
ZOS_LD := $(G_BUILD_PATH)/zos.ld

# some comm function
define build_module_target
	$(HIDE)echo "[Start]	Processing in $(G_PROJECT_PATH)/$(1)"
	$(HIDE)echo "[Make]	Make for $(basename $(notdir $(1))).a"
	$(HIDE)$(MAKE) -C $(G_PROJECT_PATH)/$(1) all
	$(HIDE)echo "[End]	build Successful for lib$(basename $(notdir $(1))).a"

endef

define add_libs
	ifeq ($(ZOS_CFG_$(shell echo $(1) | tr a-z A-Z)), y)
	LIBS += -l$(1)
	endif
endef