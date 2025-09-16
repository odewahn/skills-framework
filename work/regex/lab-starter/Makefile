# Makefile for lab-starter
LAB_ROOT ?= $(PWD)/labs

.PHONY: up verify reset clean reup show help

up:
	@bash bootstrap.sh

verify:
	@bash verify.sh

reset:
	@bash reset.sh

clean:
	@echo "Removing $(LAB_ROOT)"
	@rm -rf "$(LAB_ROOT)"

reup: clean up

show:
	@echo "Workspace contents:"
	@find "$(LAB_ROOT)" -maxdepth 3 -not -path "*/.git/*" -print | sed 's|^|  |'

help:
	@echo "Targets:"
	@echo "  make up     - Bootstrap labs (create fixtures)"
	@echo "  make verify - Run verification checks"
	@echo "  make reset  - Wipe & restore baseline"
	@echo "  make clean  - Remove labs directory"
	@echo "  make reup   - Clean + bootstrap"
	@echo "  make show   - List workspace contents"
