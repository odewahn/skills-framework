# 🔎 Verification Capability Map (VCM) — Git (Exhaustive)

**Context:** Skill framework: _Git_, MCP tools: **shell_execute (git only)**, **filesystem (read/write/list/edit/move/tree/info)**.

**Result Record Schema (for verifiers to emit)**

```json
{
  "status": "PASS|FAIL",
  "skill": "<skill text>",
  "observations": "<string or list>",
  "evidence": { "stdout": "<captured output>", "stderr": "", "files": [] },
  "hints": ["<next-step or remediation>"]
}
```

---

## Shared Fixture Conventions (for Labs)

- **<WORKDIR>**: fresh temp directory per attempt (use `create_directory`, `list_directory`, `move_file`, `directory_tree`).
- **\<MAIN_REPO>**: repo under `<WORKDIR>/main` (initialized with `git init`).
- **\<BARE_REMOTE>**: bare repo under `<WORKDIR>/remote.git` (`git init --bare`). Add as remote `origin` to `<MAIN_REPO>`.
- **Baseline commit**: initial commit with `README.md` to enable diffs/logs.
- **Reset**: delete `<WORKDIR>` and recreate; or `git reset --hard <baseline>` and `git clean -fdx` when noted.
- **Evidence capture**: `stdout/stderr` from `shell_execute`, file snapshots (`read_text_file`), tree listings.

> Where remote interaction is required, use a **local bare remote**. Where platform features (PRs, CI) are referenced, use **surrogates** (branching, markdown templates, presence of config files) and mark partial/manual as needed.

---

# Skills & Verification Map

## Level 1 — Exploring

### Skill: Identify what Git is and describe its role vs. centralized systems

- **Feasibility (initial):** knowledge check
- **Verification mode:** knowledge check
- **Required fixtures (if lab):** none
- **Knowledge check example:**

  - **Q:** Which statement best describes Git?

    - A) A centralized VCS requiring a constant server connection
    - B) A _distributed_ VCS where each clone is a full repository
    - C) A code editor with built‑in versioning

  - **Correct answer:** B

- **Pass/Fail criteria (initial):** correct option selected
- **Reset needed between attempts (if lab):** false
- **Notes:** Conceptual; reserve labs for operational skills.

---

### Skill: Define core Git concepts: repository, commit, branch, merge, remote

- **Feasibility (initial):** knowledge check
- **Verification mode:** knowledge check
- **Required fixtures (if lab):** none
- **Knowledge check example:**

  - **Q:** Match each concept: (1) _branch_, (2) _commit_, (3) _remote_ → (a) snapshot + metadata, (b) movable pointer to a line of development, (c) another repo reference (e.g., origin)
  - **Correct answer:** 1→b, 2→a, 3→c

- **Pass/Fail criteria:** correct mapping
- **Reset:** false
- **Notes:** Can supplement with a short labeling task from `git log --oneline --decorate --all` output.

---

### Skill: Recognize the difference between working directory, staging area, and commit history

- **Feasibility (initial):** verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** `<MAIN_REPO>` with baseline commit and `file.txt`
- **Suggested probes:**

  1. Modify `file.txt` (unstaged). `git status` → expect _modified: file.txt_ under _Changes not staged_.
  2. `git add file.txt`. `git status` → expect under _Changes to be committed_.
  3. `git commit -m "stage demo"`. `git log -1 --name-status` → shows `file.txt` in history.

- **Pass/Fail criteria:** statuses and history sections match expected phases.
- **Reset:** true (soft reset to baseline or clean recreate)
- **Notes:** Use `read_text_file` evidence snapshots if needed.

---

### Skill: List common commands (`init`, `clone`, `status`, `add`, `commit`) and purposes

- **Feasibility (initial):** verifiable with scaffolding + knowledge check
- **Verification mode:** lab probe _or_ knowledge check
- **Required fixtures:** empty `<WORKDIR>`; optional `<BARE_REMOTE>` for `clone`
- **Suggested probes (lab):**

  - `git init` → verify `.git/` exists (via `list_directory`).
  - `git status` before/after `git add` to show staging effect.
  - Create `<BARE_REMOTE>` then `git clone <BARE_REMOTE> <WORKDIR>/clone` → verify working tree created.

- **Knowledge check example:** Purpose of `git add`? (stage changes for next commit)
- **Pass/Fail criteria:** expected artifacts (`.git/`, staged entries, clone path) present; correct MCQ if used.
- **Reset:** true
- **Notes:** Keep probes atomic.

---

### Skill: Describe the difference between local and remote repositories

- **Feasibility:** knowledge check
- **Verification mode:** knowledge check
- **Knowledge check example:**

  - **Q:** What does `origin` typically represent?

    - A) Local default branch
    - B) Default remote name
    - C) Git config section for user identity

  - **Correct answer:** B

- **Pass/Fail:** correct option
- **Reset:** false

---

### Skill: Explain the purpose of `.gitignore` and how it affects tracking

- **Feasibility:** auto-verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** `<MAIN_REPO>` with `build/` dir and `secrets.env`
- **Suggested probes:**

  1. Create `.gitignore` with lines: `build/` and `*.env`.
  2. Create `build/output.bin` and `secrets.env`.
  3. `git status --ignored` → verify these appear under _Ignored files_ and not under _Changes_.

- **Pass/Fail:** ignored items listed correctly; `git add .` does _not_ stage ignored files.
- **Reset:** true
- **Notes:** Capture `.gitignore` content as evidence.

---

### Skill: Recall how to configure user information (`git config`) local vs global

- **Feasibility:** verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** `<MAIN_REPO>`
- **Suggested probes:**

  - `git config --global user.name "Learner"`; `git config --global --get user.name` → expect `Learner`.
  - `git config user.email learner@example.com`; `git config --get user.email` → repo-scoped value.

- **Pass/Fail:** values retrievable at scopes; global vs local precedence demonstrable with `git config --list --show-origin`.
- **Reset:** true (optionally unset with `git config --global --unset` / recreate repo)
- **Notes:** Avoid leaking real global config in shared runners; use temp HOME if possible.

---

### Skill: Recognize the structure of a commit (hash, message, author, timestamp)

- **Feasibility:** auto-verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** `<MAIN_REPO>` with at least one commit
- **Suggested probes:**

  - `git log -1 --pretty=format:"%H|%s|%an|%ad" --date=iso-strict`
  - Validate 4 fields present; hash is 40-hex or abbreviated; date parses.

- **Pass/Fail:** regex validations succeed; fields non-empty.
- **Reset:** false
- **Notes:** Store parsed tuple in `evidence.stdout`.

---

### Skill: Identify typical enterprise use cases (collab, tracking, auditability)

- **Feasibility:** knowledge check
- **Verification mode:** knowledge check
- **Knowledge check example:** Which practice improves auditability? (A) Force-push to main, (B) Signed commits with reviews, (C) Amending public history) → **Answer:** B
- **Pass/Fail:** correct answer
- **Reset:** false

---

## Level 2 — Applying

### Skill: Apply Git commands to create and clone repositories

- **Feasibility:** auto-verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** `<BARE_REMOTE>`
- **Suggested probes:**

  1. `git init <MAIN_REPO>`; create baseline commit.
  2. `git init --bare <BARE_REMOTE>`; `git -C <MAIN_REPO> remote add origin <BARE_REMOTE>`; `git push -u origin main`.
  3. `git clone <BARE_REMOTE> <WORKDIR>/clone`; verify `.git/` exists and `origin` set.

- **Pass/Fail:** clone has same HEAD commit; `git -C clone remote get-url origin` equals `<BARE_REMOTE>`.
- **Reset:** true

---

### Skill: Demonstrate adding, staging, and committing changes

- **Feasibility:** auto-verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** `<MAIN_REPO>` with `note.txt`
- **Suggested probes:** append text → `git add note.txt` → `git commit -m "feat: add note"` → `git log -1 --name-only` includes `note.txt`.
- **Pass/Fail:** latest commit message matches; file present in diff.
- **Reset:** true

---

### Skill: Execute branching operations to create and switch branches

- **Feasibility:** auto-verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** `<MAIN_REPO>`
- **Suggested probes:** `git switch -c feature/x`; verify `git branch --show-current` is `feature/x`; create commit; switch back to `main` and verify divergence.
- **Pass/Fail:** branches exist; HEAD reflects expected branch; logs differ.
- **Reset:** true

---

### Skill: Use `git log`, `git diff`, and `git status` to inspect history and changes

- **Feasibility:** auto-verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** `<MAIN_REPO>` with staged and unstaged edits
- **Suggested probes:**

  - `git status` shows both sections.
  - `git diff` (unstaged) shows expected hunk.
  - `git diff --staged` shows staged hunk.
  - `git log -n 2 --oneline` shows two commit lines.

- **Pass/Fail:** outputs contain expected filenames/hunks/counts.
- **Reset:** true

---

### Skill: Implement basic merges and recognize merge conflicts

- **Feasibility:** verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** `<MAIN_REPO>` with `main` and `feature/conflict` branches making incompatible edits to same line
- **Suggested probes:**

  - Attempt `git merge feature/conflict` on `main` → expect conflict; `git status` lists conflicted file.
  - Resolve by editing markers and `git add`; `git commit` completes merge.

- **Pass/Fail:** conflict appears when expected; final merge commit exists and `git status` clean.
- **Reset:** true
- **Notes:** Capture before/after file contents.

---

### Skill: Perform pushes and pulls with a remote

- **Feasibility:** auto-verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** `<MAIN_REPO>` + `<BARE_REMOTE>` + `<WORKDIR>/clone`
- **Suggested probes:**

  - From `<MAIN_REPO>`, create commit and `git push`.
  - From `clone`, `git pull` and verify it receives the commit (matching hash).

- **Pass/Fail:** hashes match across repos; remotes configured.
- **Reset:** true

---

### Skill: Illustrate how to create and manage `.gitignore` for common project types

- **Feasibility:** auto-verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** `<MAIN_REPO>` with representative directories (`node_modules/`, `dist/`, `*.log`)
- **Suggested probes:** create patterns in `.gitignore`; create files/dirs; `git status --ignored` shows them ignored; ensure needed files remain tracked.
- **Pass/Fail:** ignore rules work; no accidental ignores of tracked files.
- **Reset:** true

---

### Skill: Demonstrate undo operations (`git checkout`/`switch`, `git reset`, `git revert`) in simple cases

- **Feasibility:** verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** `<MAIN_REPO>` with at least 2 commits
- **Suggested probes:**

  - Create a bad edit; `git restore --staged`/`git checkout -- <file>` to discard.
  - `git reset --hard <baseline>` then verify working tree restored.
  - `git revert <commit>` creates a new inverse commit.

- **Pass/Fail:** tree matches expected states after each operation; revert commit exists.
- **Reset:** true
- **Notes:** Prefer `git restore/switch` modern cmds; accept legacy equivalents.

---

### Skill: Apply tagging for marking releases or milestones

- **Feasibility:** auto-verifiable
- **Verification mode:** lab probe
- **Required fixtures:** `<MAIN_REPO>`
- **Suggested probes:** `git tag -a v1.0 -m "release v1.0"`; `git show v1.0 --no-patch`; `git describe --tags` on HEAD.
- **Pass/Fail:** annotated tag exists; points to HEAD; message matches.
- **Reset:** false (tags can persist) or true if needed

---

### Skill: Use Git GUIs or IDE integrations to visualize commit history

- **Feasibility:** knowledge check (CLI-only environment)
- **Verification mode:** knowledge check
- **Knowledge check example:** Which CLI command approximates a visual history? → `git log --graph --oneline --decorate --all`
- **Pass/Fail:** correct answer
- **Reset:** false

---

## Level 3 — Building

### Skill: Develop feature branches using Git Flow or trunk-based conventions

- **Feasibility:** verifiable with scaffolding (process conformance via structure)
- **Verification mode:** lab probe
- **Required fixtures:** `<MAIN_REPO>` with `main` default
- **Suggested probes:**

  - Create `feature/<ticket-id>-short-desc` branch; at least 1 commit; open a surrogate “PR” by preparing `pr/feature-<id>.md` with checklist.
  - Fast-forward/merge back via `--no-ff` per policy; verify merge commit present when required.

- **Pass/Fail:** branch naming pattern matches; merge policy (`--no-ff` or squash) reflected in history.
- **Reset:** true
- **Notes:** Use regex to validate branch names.

---

### Skill: Construct meaningful commit messages aligned with enterprise standards

- **Feasibility:** verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** convention regex (e.g., Conventional Commits)
- **Suggested probes:** create 3+ commits; validate each subject against `^(build|chore|ci|docs|feat|fix|perf|refactor|revert|style|test)(\(.+\))?: .{1,72}$` and body wrap ≤72 cols if provided.
- **Pass/Fail:** all messages conform; provide hints for nonconforming samples.
- **Reset:** true

---

### Skill: Organize branches for parallel work and collaborative contributions

- **Feasibility:** verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** two feature branches diverging from `main`
- **Suggested probes:** ensure both features can be merged without conflicts (or resolved); verify `git log --graph --decorate --oneline --all` reflects parallel lines of work.
- **Pass/Fail:** both features merged cleanly; history shows intended topology.
- **Reset:** true

---

### Skill: Solve common merge conflicts and explain conflict resolution strategies

- **Feasibility:** verifiable with scaffolding + partial manual review
- **Verification mode:** lab probe + short reflection note
- **Required fixtures:** conflicting edits on same hunk across branches
- **Suggested probes:** trigger conflict → learner resolves → commit; capture a one-paragraph rationale in `RESOLUTION.md`.
- **Pass/Fail:** repo clean; merge commit present; `RESOLUTION.md` exists with non-empty rationale.
- **Reset:** true

---

### Skill: Produce pull requests (merge requests) and participate in code reviews

- **Feasibility:** manual review (platform-dependent) with lab surrogate
- **Verification mode:** manual review + surrogate lab
- **Required fixtures:** `pr/` folder template (`pull_request_template.md`)
- **Suggested probes:** require filled template (`Title`, `Summary`, `Screenshots`, `Risk`, `Checklist`) in `pr/<branch>.md`.
- **Pass/Fail:** template completed; links to commits/branches valid. Reviewer checks content quality.
- **Reset:** false

---

### Skill: Modify history safely with interactive rebasing (`git rebase -i`)

- **Feasibility:** verifiable with scaffolding (outcome-based)
- **Verification mode:** lab probe
- **Required fixtures:** branch with 3 commits intended to be squashed into 1
- **Suggested probes:** after instructions to run `git rebase -i HEAD~3` (or autosquash via `fixup!`/`squash!`), verify `git log -3 --oneline` shows 1 consolidated commit with combined changes.
- **Pass/Fail:** commit count reduced; tree equals expected; no reflog errors.
- **Reset:** true

---

### Skill: Present repository history clearly with visualization tools (`git log --graph`)

- **Feasibility:** auto-verifiable
- **Verification mode:** lab probe
- **Required fixtures:** multiple branches merged
- **Suggested probes:** run `git log --graph --oneline --decorate --all -n 20`; ensure output contains graph characters (`*`, `|`, `\`, `/`) and expected branch names.
- **Pass/Fail:** output includes structure and refs; evidence captured.
- **Reset:** false

---

### Skill: Design `.gitignore` and `.gitattributes` rules to support team/project needs

- **Feasibility:** verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** binary sample, text sample with LF, path needing attributes
- **Suggested probes:**

  - `.gitattributes`: `*.sh text eol=lf` and `*.png binary`.
  - Verify `git check-attr eol -- script.sh` → `lf`; `git check-attr -a -- image.png` includes `binary`.

- **Pass/Fail:** attributes resolve as expected; ignore list effective.
- **Reset:** true

---

### Skill: Use stashing (`git stash`) to manage context switching

- **Feasibility:** auto-verifiable
- **Verification mode:** lab probe
- **Required fixtures:** dirty working tree
- **Suggested probes:** `git stash push -m "wip"`; ensure `git status` clean; `git stash list` contains entry; `git stash pop` restores changes.
- **Pass/Fail:** list count increments then decrements; file content restored.
- **Reset:** true

---

### Skill: Implement shallow clones, sparse checkouts, or submodules for large projects

- **Feasibility:** verifiable with scaffolding (local)
- **Verification mode:** lab probe
- **Required fixtures:** `<BARE_REMOTE>` with history; a nested repo for submodule tests
- **Suggested probes:**

  - **Shallow clone:** `git clone --depth 1 <BARE_REMOTE> shallow`; verify `git rev-list --count HEAD` small and `--shallow` file exists.
  - **Sparse checkout:** enable (`git sparse-checkout init`), set patterns, verify only expected paths present.
  - **Submodules:** add local submodule; verify `.gitmodules` and `git submodule status`.

- **Pass/Fail:** each feature configured and observable.
- **Reset:** true

---

### Skill: Integrate Git hooks for local automation (e.g., linting, pre-commit)

- **Feasibility:** verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** executable `.git/hooks/pre-commit`
- **Suggested probes:** pre-commit script blocks commits containing `WIP` in subject; attempt to commit `"WIP: test"` → expect non-zero; then commit with valid subject → succeeds.
- **Pass/Fail:** hook prevents invalid commit; allows valid one.
- **Reset:** true

---

## Level 4 — Advancing

### Skill: Analyze commit history to trace bugs or regressions (`git bisect`)

- **Feasibility:** verifiable with scaffolding
- **Verification mode:** lab probe
- **Required fixtures:** seeded history where a specific commit introduces failure (e.g., file contains `BUG=true`)
- **Suggested probes:** scripted test = grep for `BUG=true`; run bisect start/good/bad; verify identified hash matches known bad.
- **Pass/Fail:** correct commit found; evidence includes bisect log.
- **Reset:** true

---

### Skill: Evaluate branching strategies (Git Flow, trunk-based, GitHub Flow) for teams

- **Feasibility:** knowledge check + manual review (contextual)
- **Verification mode:** short scenario MCQ + reflection
- **Knowledge check example:** Scenario with urgent hotfix on trunk-based: best next step? → create hotfix branch from `main`, fix, merge, tag, deploy, back-merge.
- **Pass/Fail:** correct MCQ; reviewer approves brief rationale.
- **Reset:** false

---

### Skill: Optimize repository performance (pruning, GC, large file handling)

- **Feasibility:** verifiable with scaffolding (partial)
- **Verification mode:** lab probe
- **Required fixtures:** repo with many loose objects (simulate by many small commits)
- **Suggested probes:** `git count-objects -v` before/after `git gc --aggressive` and `git prune`; expect pack/size improvements.
- **Pass/Fail:** pack size reduced or loose objects decreased.
- **Reset:** true
- **Notes:** LFS not available in this environment; focus on GC/prune.

---

### Skill: Integrate Git with CI/CD systems for automated builds and deployments

- **Feasibility:** verifiable (presence-only) + manual review
- **Verification mode:** lab probe (files) + manual review
- **Required fixtures:** CI config files (e.g., `.github/workflows/ci.yml`)
- **Suggested probes:** verify workflow file exists and references `on: [push]` and basic steps; cannot execute.
- **Pass/Fail:** files present with valid YAML structure; reviewer checks content quality.
- **Reset:** false

---

### Skill: Adapt workflows to enterprise compliance (signed commits, audit trails)

- **Feasibility:** knowledge check + presence checks
- **Verification mode:** knowledge check + lab (DCO trailers)
- **Required fixtures:** commit trailers (`Signed-off-by:`) enforced via hook
- **Suggested probes:** hook requires `Signed-off-by:`; verify commit contains trailer.
- **Pass/Fail:** commits include required trailer; MCQ on signed vs unsigned implications.
- **Reset:** true
- **Notes:** Full GPG signing not feasible without `gpg`.

---

### Skill: Compare and critique conflict-resolution approaches (merge vs. rebase)

- **Feasibility:** knowledge check + manual review
- **Verification mode:** scenario MCQ + short reflection
- **Pass/Fail:** correct MCQ; reflection addresses trade-offs (history clarity, commit hashes, CI impact).
- **Reset:** false

---

### Skill: Lead adoption of code review workflows with pull requests and approvals

- **Feasibility:** manual review
- **Verification mode:** portfolio/sample PRs or surrogate docs
- **Pass/Fail:** reviewer assessment of policy docs/templates.
- **Reset:** false

---

### Skill: Integrate Git with external tools (issue trackers, PM systems)

- **Feasibility:** knowledge check + presence check
- **Verification mode:** MCQ + lab
- **Required fixtures:** commit messages referencing issues (e.g., `Fixes #123`), `CONTRIBUTING.md`
- **Suggested probes:** regex presence of `#<id>` in commit messages; links in docs.
- **Pass/Fail:** patterns found; docs exist.
- **Reset:** false

---

### Skill: Adapt submodules, monorepos, or subtrees for complex structures

- **Feasibility:** verifiable with scaffolding (submodules, monorepo layout) + knowledge check (subtrees)
- **Verification mode:** lab probe + knowledge check
- **Required fixtures:** multi-package folder structure; local submodule
- **Suggested probes:** verify `.gitmodules`, `git submodule status`, and top-level workspace layout; MCQ on when to prefer subtree.
- **Pass/Fail:** structures present; correct MCQ.
- **Reset:** true

---

### Skill: Evaluate and optimize use of Git LFS

- **Feasibility:** knowledge check (no `git lfs`)
- **Verification mode:** knowledge check
- **Pass/Fail:** correct answers on concepts/limits.
- **Reset:** false

---

### Skill: Lead team-wide migration projects (e.g., SVN→Git)

- **Feasibility:** knowledge check + manual review
- **Verification mode:** short plan artifact reviewed by SME
- **Pass/Fail:** reviewer approval of migration plan outline and risk controls.
- **Reset:** false

---

## Level 5 — Innovating (Manual Review Focus)

### Skill: Define enterprise Git standards (commit conventions, branching models)

- **Feasibility:** manual review
- **Verification mode:** standards document submission
- **Pass/Fail:** reviewer checks clarity, applicability, consensus process.

---

### Skill: Create training and mentoring resources to upskill colleagues

- **Feasibility:** manual review
- **Verification mode:** training deck/guide + sample exercises
- **Pass/Fail:** reviewer assessment (accuracy, engagement, alignment).

---

### Skill: Innovate automation with custom hooks and CI/CD pipelines

- **Feasibility:** manual review + presence checks
- **Verification mode:** code artifacts + docs
- **Pass/Fail:** reviewer validates design and sample runs/logs (where available).

---

### Skill: Establish governance for repo structure, permissions, and security

- **Feasibility:** manual review
- **Verification mode:** governance doc + RACI
- **Pass/Fail:** reviewer approval against org controls.

---

### Skill: Propose improvements to enterprise Git usage (mono vs multi‑repo)

- **Feasibility:** manual review
- **Verification mode:** proposal doc
- **Pass/Fail:** reviewer assessment of trade-off analysis.

---

### Skill: Lead development of internal tooling around Git (dashboards, bots, scripts)

- **Feasibility:** manual review
- **Verification mode:** demo + repo links (or local surrogates)
- **Pass/Fail:** reviewer verifies utility and robustness.

---

### Skill: Formulate strategies for scaling Git in large orgs (mirroring, replication)

- **Feasibility:** manual review
- **Verification mode:** strategy doc + diagrams
- **Pass/Fail:** reviewer approval.

---

### Skill: Mentor peers in advanced history rewriting, repository repair, and recovery

- **Feasibility:** manual review
- **Verification mode:** portfolio + retrospectives
- **Pass/Fail:** reviewer endorses mentoring evidence and outcomes.

---

## Author Notes & Next Steps

- For each lab, pre-build a **fixture script** that sets up `<WORKDIR>`, `<MAIN_REPO>`, `<BARE_REMOTE>`, and baseline commits; emit paths as outputs so verifiers can reuse them.
- Use **regex validations** for commit messages/branch names; keep patterns configurable per org.
- Where platform features are out-of-scope (PRs, CI runs, signed commits), use **surrogate artifacts** and mark **manual review** explicitly.
- Prefer **idempotent** probes and include **reset** guidance so labs are repeatable.
