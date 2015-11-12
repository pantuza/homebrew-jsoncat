#
# Makefile to handle Jsoncat build process to Mac OS X 
#

FORMULA_DIR := Formula

JSONCAT_FORMULA := jsoncat.rb

LIMBO := /dev/null


GREP := $(shell which grep)
AWK := $(shell which awk)

TARBALL_URL := $(shell $(GREP) 'url' $(FORMULA_DIR)/$(JSONCAT_FORMULA) | $(AWK) '{print $$2}')

SHA256 := $(shell wget $(TARBALL_URL) &> $(LIMBO) | shasum --algorithm 256 | cut -d " " -f 1)

CURR_SHA256 := $(shell $(GREP) 'sha256' $(FORMULA_DIR)/$(JSONCAT_FORMULA) | $(AWK) '{print $$2}')

help:
	@echo "Json cat build process"


update: geturl

geturl: $(FORMULA_DIR)/$(JSONCAT_FORMULA)
	@echo $(CURR_SHA256)
	@echo $(SHA256)
	
