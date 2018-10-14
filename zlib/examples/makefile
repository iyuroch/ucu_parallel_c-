CC := gcc
LIB_C := bin
DEPS := $(wildcard *.h)
LIB_DIR := ../library/bin
LIB_NAME := zlib
CFLAGS := -L$(LIB_DIR) -l$(LIB_NAME)
OPT := -O3
DBG := -ggdb
SRC_FILES := $(wildcard *.c)
OUT_FILES := $(patsubst %.c,$(LIB_C)/%,$(SRC_FILES))

$(LIB_C)/% : %.c
	@mkdir -p $(LIB_C)
	$(CC) $< -o $@ $(CFLAGS)

.PHONY: build
build : $(OUT_FILES)

.PHONY: opt
opt : clean add_opt build

.PHONY: add_opt
add_opt: 
	$(eval CFLAGS += $(OPT))

.PHONY: dbg
dbg : clean add_dbg build

.PHONY: add_dbg
add_dbg:
	$(eval CFLAGS += $(DBG))

.PHONY: clean
clean:
	@rm -rf $(LIB_C)
