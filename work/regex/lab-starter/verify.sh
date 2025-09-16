#!/usr/bin/env bash
set -euo pipefail

LAB_ROOT="${LAB_ROOT:-$(pwd)/labs}"
WS="${LAB_ROOT}/workspace"

fail() { echo "VERIFICATION: FAIL - $1" >&2; exit 1; }
pass() { echo "VERIFICATION: PASS - $1"; }

# Tool checks
for cmd in grep sed awk; do
  command -v "$cmd" >/dev/null 2>&1 || fail "Required tool '$cmd' not found in PATH"
done
pass "Required tools present (grep, sed, awk)"

# Fixture checks
[[ -f "${WS}/logs/system.log" ]] || fail "Missing logs/system.log"
[[ -f "${WS}/logs/app-error.log" ]] || fail "Missing logs/app-error.log"
[[ -f "${WS}/data/users.txt" ]] || fail "Missing data/users.txt"
[[ -f "${WS}/data/users.csv" ]] || fail "Missing data/users.csv"
[[ -f "${WS}/web/sample.html" ]] || fail "Missing web/sample.html"
[[ -f "${WS}/../workspace/tips.txt" || -f "${WS}/tips.txt" ]] || true # tolerate absent
pass "Fixtures exist"

# Sanity probes (basic regex ops)
grep -q '^Sep' "${WS}/logs/system.log" || fail "Anchor ^ did not match expected lines in system.log"
grep -q 'ssh2$' "${WS}/logs/system.log" || fail "Anchor $ did not match expected lines in system.log"
grep -Eq '([0-9]{1,3}\.){3}[0-9]{1,3}' "${WS}/data/users.txt" || fail "IP regex did not match in users.txt"
grep -Eq '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}' "${WS}/web/sample.html" || fail "Email regex did not match in sample.html"
awk '/ERROR/' "${WS}/logs/app-error.log" | grep -q 'ERROR' || fail "awk/grep pipeline did not surface ERRORs"

pass "Sanity regex probes succeeded"
echo "All checks passed."
