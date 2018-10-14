CC := gcc
LIB_C := bin
LIB_NAME := libzlib
OBJ_DIR := obj
SRC_FILES := $(wildcard *.c)
OBJ_FILES := $(patsubst %.c,$(OBJ_DIR)/%.o,$(SRC_FILES))
DEPS := $(wildcard *.h)
CFLAGS := -I.
AR := ar
AR_FLAGS := rcs
OPT := -O3
DBG := -ggdb

$(OBJ_DIR)/%.o : %.c $(DEPS)
	@mkdir -p $(OBJ_DIR)
	$(CC) -c -fPIC $< -o $@ $(CFLAGS)

build : $(OBJ_FILES)
	@mkdir -p $(LIB_C)
	ar rcs $(LIB_C)/$(LIB_NAME).a $(OBJ_FILES)
	$(CC) -shared $(OBJ_FILES) -o $(LIB_C)/$(LIB_NAME).so
	ar rcs $(LIB_C)/$(LIB_NAME).so.a $(LIB_C)/$(LIB_NAME).so 
	@echo "Exporting as LD_LIBRARY_PATH, you can move this library \
		to shared library folder or add next command to bash_rc profile"
	export LD_LIBRARY_PATH=$(PWD)


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
	@rm -rf $(OBJ_DIR)
