\
    #!/usr/bin/env bash
    set -euo pipefail

    LAB_ROOT="${LAB_ROOT:-./labs}"
    REPO_NAME="sample-repo"
    WORK_DIR="$LAB_ROOT/$REPO_NAME"
    BARE_REMOTE="$LAB_ROOT/remote/$REPO_NAME.git"

    fail() { echo "VERIFICATION FAILED: $*" >&2; exit 1; }
    ok() { echo "✓ $*"; }

    [ -d "$WORK_DIR/.git" ] || fail "Working repo not found at $WORK_DIR; run 'make up'"
    [ -d "$BARE_REMOTE" ] || fail "Bare remote not found at $BARE_REMOTE; run 'make up'"

    pushd "$WORK_DIR" >/dev/null

    git rev-parse --verify main >/dev/null 2>&1 || fail "Branch 'main' missing"
    git rev-parse --verify feature >/dev/null 2>&1 || fail "Branch 'feature' missing"
    ok "Branches exist: main, feature"

    git show-ref --tags | grep -q "refs/tags/v1.0" || fail "Tag v1.0 missing"
    ok "Tag exists: v1.0"

    test -f ".gitignore" && grep -q "node_modules/" .gitignore && grep -q "\*.log" .gitignore || fail ".gitignore missing expected rules"
    ok ".gitignore contains expected entries"

    # Remote sanity
    git remote get-url origin >/dev/null 2>&1 || fail "Remote 'origin' not configured"
    git fetch -q origin || fail "Fetch from origin failed"
    ok "Fetch from origin succeeded"

    # Try a no-op push to confirm permissions
    git push -q origin main || fail "Push to origin failed"
    ok "Push to origin succeeded"

    # Log and graph checks
    git log --oneline | head -n 1 >/dev/null || fail "No commits found"
    ok "Commits present"

    popd >/dev/null

    echo "=== VERIFICATION PASSED ==="
