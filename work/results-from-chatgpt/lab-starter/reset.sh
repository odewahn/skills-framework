\
    #!/usr/bin/env bash
    set -euo pipefail

    LAB_ROOT="${LAB_ROOT:-./labs}"
    echo "==> Resetting lab at $LAB_ROOT"
    rm -rf "$LAB_ROOT"
    "$(dirname "$0")/bootstrap.sh"
    echo "==> Reset complete."
