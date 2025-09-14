\
    # Makefile for Lab Starter
    SHELL := /usr/bin/env bash
    .SHELLFLAGS := -eu -o pipefail -c

    LAB_ROOT ?= ./labs

    .PHONY: up verify reset clean reup show help package

    up:
    	@echo "==> Bootstrapping lab into $(LAB_ROOT)"
    	@LAB_ROOT="$(LAB_ROOT)" bash ./bootstrap.sh

    verify:
    	@LAB_ROOT="$(LAB_ROOT)" bash ./verify.sh

    reset:
    	@LAB_ROOT="$(LAB_ROOT)" bash ./reset.sh

    clean:
    	@echo "==> Removing labs directory $(LAB_ROOT)"
    	@rm -rf "$(LAB_ROOT)"

    reup: clean up

    show:
    	@echo "==> Listing workspace (excluding .git internals where possible)"
    	@find "$(LAB_ROOT)" -maxdepth 3 -not -path "*/.git/*" -print 2>/dev/null || true

    help:
    	@echo "Lab Starter Makefile"
    	@echo ""
    	@echo "Targets:"
    	@echo "  make up       - Bootstrap labs"
    	@echo "  make verify   - Run verification"
    	@echo "  make reset    - Wipe + rebuild baseline"
    	@echo "  make clean    - Remove lab directory only"
    	@echo "  make reup     - Clean + bootstrap"
    	@echo "  make show     - List workspace contents"
    	@echo "  make package  - Build lab-starter.zip"
    	@echo ""
    	@echo "Variables:"
    	@echo "  LAB_ROOT      - Workspace path (default ./labs)"

    package:
    	@zip -qr lab-starter.zip bootstrap.sh reset.sh verify.sh Makefile README.md
    	@echo "Created lab-starter.zip"
