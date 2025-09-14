\
    #!/usr/bin/env bash
    set -euo pipefail

    LAB_ROOT="${LAB_ROOT:-./labs}"
    REPO_NAME="sample-repo"
    REMOTE_DIR="$LAB_ROOT/remote"
    WORK_DIR="$LAB_ROOT/$REPO_NAME"
    BARE_REMOTE="$REMOTE_DIR/$REPO_NAME.git"

    echo "==> Creating lab workspace at: $LAB_ROOT"
    mkdir -p "$LAB_ROOT"
    mkdir -p "$REMOTE_DIR"

    if [ -d "$WORK_DIR" ]; then
      echo "==> Removing existing work dir to ensure a clean bootstrap"
      rm -rf "$WORK_DIR"
    fi

    echo "==> Initializing working repository"
    mkdir -p "$WORK_DIR"
    pushd "$WORK_DIR" >/dev/null

    git init -q
    git config user.name "Lab User"
    git config user.email "labuser@example.com"

    cat > .gitignore <<'EOF'
    node_modules/
    *.log
    .DS_Store
    EOF

    echo "# Sample Repo" > README.md
    echo "Initial content" > app.txt
    git add .
    git commit -q -m "chore: initial commit on main"

    echo "Line 2" >> app.txt
    git add app.txt
    git commit -q -m "feat: add second line"

    echo "==> Create feature branch and commits"
    git switch -q -c feature
    echo "Feature work 1" > feature.txt
    git add feature.txt
    git commit -q -m "feat(feature): add feature file"

    echo "Feature work 2" >> feature.txt
    git add feature.txt
    git commit -q -m "feat(feature): expand feature"

    git switch -q main

    echo "==> More commits on main"
    echo "Line 3" >> app.txt
    git add app.txt
    git commit -q -m "feat: add third line"

    echo "Line 4" >> app.txt
    git add app.txt
    git commit -q -m "feat: add fourth line"

    echo "==> Tag v1.0 on main"
    git tag -a v1.0 -m "v1.0 release"

    echo "==> Prepare local bare remote and set as origin"
    if [ -d "$BARE_REMOTE" ]; then
      rm -rf "$BARE_REMOTE"
    fi
    git init -q --bare "$BARE_REMOTE"
    git remote add origin "$BARE_REMOTE"
    git push -q -u origin main
    git push -q origin feature
    git push -q origin --tags

    echo "==> Sanity checks"
    git branch --list | grep -q "main"
    git branch --list | grep -q "feature"
    git tag | grep -q "^v1\.0$"
    git log --oneline | head -n 1 >/dev/null

    popd >/dev/null

    echo "==> Bootstrap complete."
    echo "Repo path: $WORK_DIR"
    echo "Remote: $BARE_REMOTE"
