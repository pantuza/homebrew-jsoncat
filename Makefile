#
# Makefile to handle Jsoncat build process to Mac OS X
#

FORMULA_DIR := Formula

JSONCAT_FORMULA := jsoncat.rb

LIMBO := /dev/null

GIT := $(shell which git)
GREP := $(shell which grep)
AWK := $(shell which awk)

TARBALL_URL := $(shell $(GREP) 'url' $(FORMULA_DIR)/$(JSONCAT_FORMULA) | $(AWK) '{print $$2}')

SHA256 := $(shell wget -q -O- $(TARBALL_URL) | shasum --algorithm 256 | cut -d " " -f 1)

CURR_SHA256 := $(shell $(GREP) 'sha256' $(FORMULA_DIR)/$(JSONCAT_FORMULA) | $(AWK) '{print $$2}')


help:
	@echo "Json cat build process"
	@echo "Target rules:"
	@echo "    'make update': Verifies if there is a new version of Jsoncat."
	@echo "                   If yes, it will update Formula file"
	@echo "     'make install': Install jsoncat from Tap source formula"
	@echo "     'audit': Runs the brew audit tool"
	@echo "     'test': Run the jsoncat formula tests"


# Checks if there is a new tarball and update formula hash
update:
	@if [ "$(CURR_SHA256)" != "$(SHA256)" ]; then \
		echo "Updating formula SHA256 from $(CURR_SHA256) to $(SHA256)"; \
		sed -i 's/$(CURR_SHA256)/"$(SHA256)"/' $(FORMULA_DIR)/$(JSONCAT_FORMULA); \
		echo "Formula file diff:"; \
		$(GIT) diff $(FORMULA_DIR)/$(JSONCAT_FORMULA); \
	else \
		echo "No changes at Tarball. Nothing to update. Aborting.."; \
	fi;


# Remove jsoncat and its tap, then reinstall
install:
	brew remove jsoncat
	brew untap pantuza/homebrew-jsoncat
	brew tap pantuza/homebrew-jsoncat
	brew install --verbose jsoncat


#  Runs brew audit tool
audit: install
	brew audit --strict --online jsoncat
	

# Test the jsoncat installation
test: audit
	brew test --verbose jsoncat

