###########################################################################
#
#  Copyright (c) 2013-2016, ARM Limited, All Rights Reserved
#  SPDX-License-Identifier: Apache-2.0
#
#  Licensed under the Apache License, Version 2.0 (the "License"); you may
#  not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
###########################################################################

# Toolchain
PREFIX:=arm-none-eabi-
GDB:=$(PREFIX)gdb
OBJDUMP:=$(PREFIX)objdump

NEO_PY=deploy/neo/neo.py
UVISOR_DIR=deploy/TARGET_IGNORE/uvisor
UVISOR_GIT_CFG=$(UVISOR_DIR)/.git/config

.PHONY: all deploy clean uvisor uvisor-lib

all: uvisor

deploy: clean uvisor

uvisor: $(UVISOR_GIT_CFG)
	make -C $(UVISOR_DIR)

$(NEO_PY):
	

$(UVISOR_GIT_CFG):
	git submodule update --init $(UVISOR_DIR)

clean: $(UVISOR_GIT_CFG)
	make -C $(UVISOR_DIR) clean
