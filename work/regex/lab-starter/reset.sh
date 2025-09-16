#!/usr/bin/env bash
set -euo pipefail

LAB_ROOT="${LAB_ROOT:-$(pwd)/labs}"
SEEDS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/seeds"

if [[ -d "${LAB_ROOT}/workspace" ]]; then
  echo ">> Removing workspace at ${LAB_ROOT}/workspace"
  rm -rf "${LAB_ROOT}/workspace"
fi

echo ">> Restoring workspace from seeds"
mkdir -p "${LAB_ROOT}/workspace"
rsync -a --delete "${SEEDS_DIR}/fixtures/" "${LAB_ROOT}/workspace/"

echo ">> Reset done."
