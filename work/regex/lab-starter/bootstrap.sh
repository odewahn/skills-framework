#!/usr/bin/env bash
set -euo pipefail

LAB_ROOT="${LAB_ROOT:-$(pwd)/labs}"
SEEDS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/seeds"

echo ">> Creating lab directories at: ${LAB_ROOT}"
mkdir -p "${LAB_ROOT}/workspace"

echo ">> Seeding fixtures into workspace..."
rsync -a --delete "${SEEDS_DIR}/fixtures/" "${LAB_ROOT}/workspace/"

echo ">> Writing quick examples (tips.txt)"
cat > "${LAB_ROOT}/workspace/tips.txt" <<'EOF'
Examples to try:
  # Lines that start with Sep
  grep '^Sep' logs/system.log

  # Lines that end with 'ssh2'
  grep 'ssh2$' logs/system.log

  # IP addresses (very loose)
  grep -E '([0-9]{1,3}\.){3}[0-9]{1,3}' data/users.txt

  # Extract emails from HTML
  grep -Eo '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}' web/sample.html

  # Replace ERROR with ERR using sed (preview)
  sed -E 's/ERROR/ERR/g' logs/app-error.log | head -n 5

  # awk: show lines where status code is 500 in app-error.log
  awk '/ERROR/ && /500/' logs/app-error.log

  # grep only matches
  grep -Eo 'user=[^ ]+' logs/app-error.log
EOF

echo ">> Bootstrap complete."
