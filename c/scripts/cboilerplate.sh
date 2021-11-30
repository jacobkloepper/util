#!/bin/bash

# make directories
mkdir src inc bin bin/build doc scripts

# make files
touch src/main.c inc/common.h doc/readme.txt scripts/setup.sh Makefile

# populate main.c
cat << EOT >> src/main.c
#include <stdio.h>
#include "common.h"

int main() {
    printf("%s\n", HELLO_WORLD);

    return 0;
}

EOT

# populate common.h
cat << EOT >> inc/common.h
#ifndef __COMMON_H__
#define __COMMON_H__

#define HELLO_WORLD ("Hello world")

#endif /* __COMMON_H__ */

EOT

# populate setup.sh
cat << EOT >> scripts/setup.sh
#!/bin/bash
echo "Setup script..."

EOT

# populate Makefile
cat << EOT >> Makefile
CC = gcc
CC_FLAGS = -Iinc -Wall -Wextra -Wpedantic
LD_FLAGS =

TARGET_DIR = bin
SOURCE_DIR = src
BUILD_DIR = \$(TARGET_DIR)/build
INCLUDE_DIR = inc
SCRIPT_DIR = scripts

TARGET = \$(TARGET_DIR)/prog
SOURCES = \$(wildcard \$(SOURCE_DIR)/*.c)
OBJECTS = \$(subst \$(SOURCE_DIR),\$(BUILD_DIR),\$(SOURCES:.c=.o))
HEADERS = \$(wildcard \$(INCLUDE_DIR)/*.h)

.PHONY: all run clean setup

all: \$(TARGET) setup run

\$(TARGET): \$(OBJECTS)
	@echo Linking \$@
	@\$(CC) \$(LD_FLAGS) \$(OBJECTS) -o \$(TARGET)

\$(BUILD_DIR)/%.o: \$(SOURCE_DIR)/%.c \$(HEADERS)
	@echo Building \$@
	@\$(CC) -c \$(CC_FLAGS) -o \$@ \$<

run:
	./\$(TARGET)

clean:
	@echo Cleaning
	@rm -f \$(TARGET_DIR)/*
	@rm -f \$(BUILD_DIR)/*.o

setup:
	@echo Setting up
	@sh \$(SCRIPT_DIR)/setup.sh

EOT
