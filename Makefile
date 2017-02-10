##
# Makefile
#
#  Created on: Feb 10, 2017
#      Author: rp
##

.PHONY : dummy first_rule all test clean install

.NONPARALLEL :

###
# variables
###
AUTO_GEN_SRC_OBJ	:= $(patsubst src/%.c,src/%.o,$(wildcard src/*.c))
_TEST_FILES			:= $(patsubst src/%.c,test/%.o,$(wildcard src/*.c))
_TEST_FILES			+= $(patsubst test/%.c,test/%.o,$(wildcard test/*.c))
AUTO_GEN_TEST_OBJ	:= $(filter-out test/main.o,$(_TEST_FILES))

T_IFLAGS			+= -I include
T_CFLAGS			+= -fno-strict-aliasing -Wall -Werror -g -DUNIT_TEST
T_LDFLAGS			+= 

S_IFLAGS			+= -I include
S_CFLAGS			+= -fno-strict-aliasing -Wall -Werror -g
S_LDFLAGS			+= 

TARGET				:= pstats
BIN					:= $(TARGET)
TEST_BIN			:= test_$(TARGET)

###
# rules
###
first_rule : all

all : build_src

test : build_test run_test

clean :
	@rm -rf $(BIN) $(TEST_BIN) $(AUTO_GEN_SRC_OBJ) $(AUTO_GEN_TEST_OBJ)
	@echo -e "clean: done"

#
# test related
test/%.o : src/%.c
	@echo "    [CC] $@"
	@$(CC) $(T_IFLAGS) $(T_CFLAGS) -c $^ -o $@

test/%.o : test/%.c
	@echo "    [CC] $@"
	@$(CC) $(T_IFLAGS) $(T_CFLAGS) -c $^ -o $@

build_test : $(TEST_BIN)

$(TEST_BIN) : $(AUTO_GEN_TEST_OBJ)
	@echo "    [CC] $@"
	@$(CC) $(T_CFLAGS) $^ -o $@ $(T_LDPATH)

run_test :
	@echo " !! No UTs to run !!"

#
# src related
src/%.o : src/%.c
	@echo "    [CC] $@"
	@$(CC) $(S_IFLAGS) $(S_CFLAGS) -c $^ -o $@

build_src : $(BIN)
$(BIN) : $(AUTO_GEN_SRC_OBJ)
	@echo "    [CC] $@"
	@$(CC) $(S_CFLAGS) $^ -o $@ $(S_LDPATH)
