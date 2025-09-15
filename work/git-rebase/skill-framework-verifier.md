Got it ✅ — here’s the **full, exhaustive Verification Capability Map (VCM) for Git Rebase, Levels 1–4** in a single mega Markdown file.
This maps every skill to verification feasibility, fixtures, probes, pass/fail, reset, and notes.

---

# 🔎 Verification Capability Map (VCM) — Git Rebase

The VCM bridges the **Git Rebase Skill Framework** and the **MCP tools** (shell probes, file checks, scaffolding repos).
Level 5 skills are **out of scope** (manual reflection only).

---

## Level 1 — Exploring

### Skill: Identify what `git rebase` is and describe its role compared to `git merge`

- **Feasibility:** knowledge check
- **Verification mode:** MCQ
- **Knowledge check example:**
  Q: Which best describes `git rebase` vs. `git merge`?

  - A) Rebase discards commits, merge preserves them
  - B) Rebase replays commits on a new base, merge creates a merge commit
  - C) Rebase deletes the branch, merge preserves it
    **Correct:** B

- **Pass/Fail criteria:** Correct option chosen
- **Reset needed:** false

---

### Skill: Define the difference between interactive (`git rebase -i`) and non-interactive rebases

- **Feasibility:** knowledge check
- **Mode:** MCQ
- **Q:** What does `-i` add to the rebase process?

  - A) Faster execution
  - B) Ability to edit, squash, reorder commits
  - C) Prevents conflicts
    **Correct:** B

---

### Skill: Recognize typical use cases for rebasing

- **Feasibility:** knowledge check
- **Mode:** Short-answer
- **Pass/Fail:** Must mention _linear history_ or _updating feature branches_

---

### Skill: Recall risks of rebasing shared/public branches

- **Feasibility:** knowledge check
- **Mode:** MCQ
- **Q:** Why avoid rebasing public branches?

  - A) It causes merge commits
  - B) It rewrites history, disrupting collaborators
  - C) It slows down performance
    **Correct:** B

---

### Skill: List basic steps in a simple rebase

- **Feasibility:** knowledge check
- **Mode:** Ordering question
- **Steps:** checkout → rebase → resolve conflicts → continue
- **Pass/Fail:** Correct sequence

---

### Skill: Explain how rebasing differs from fast-forward merges

- **Feasibility:** knowledge check
- **Mode:** Short-answer
- **Pass/Fail:** Must mention _rebase rewrites commits_ vs. _FF merge moves branch pointer_

---

### Skill: Identify commands in rebase workflows

- **Feasibility:** knowledge check
- **Mode:** Matching question (`git rebase`, `--continue`, `--abort`, `--skip`)

---

### Skill: Describe what happens to commit hashes after a rebase

- **Feasibility:** knowledge check
- **Mode:** Short-answer
- **Pass/Fail:** Must mention _new hashes are generated_

---

### Skill: Recognize meaning of “upstream branch” in rebase

- **Feasibility:** knowledge check
- **Mode:** MCQ
- **Q:** What does upstream branch mean?

  - A) Remote tracking branch
  - B) Branch you are rebasing onto
  - C) The oldest commit in history
    **Correct:** B

---

## Level 2 — Applying

### Skill: Demonstrate a basic rebase of feature onto `main`

- **Feasibility:** auto-verifiable
- **Mode:** lab probe
- **Fixtures:** Repo with `main` (ahead by 1 commit), `feature` (with 2 commits)
- **Probes:**

  - `git checkout feature && git rebase main`
  - `git log --oneline --graph`

- **Pass/Fail:** `feature` commits appear on top of latest `main`, no merge commit
- **Reset:** true

---

### Skill: Apply `git pull --rebase`

- **Feasibility:** auto-verifiable
- **Fixtures:** Remote with commits ahead, local branch with diverging commits
- **Probes:** Run `git pull --rebase` and confirm linear history
- **Pass/Fail:** No merge commit introduced

---

### Skill: Use `git rebase --onto`

- **Feasibility:** verifiable with scaffolding
- **Fixtures:** Branch chain A→B→C, learner must rebase C onto A
- **Probes:** `git log` confirms C’s parent is A
- **Pass/Fail:** Correct ancestry

---

### Skill: Execute `git rebase -i` to reorder, squash, edit

- **Feasibility:** verifiable with scaffolding (interactive stdin)
- **Fixtures:** Repo with 3 commits, prompt learner to squash 2 into 1
- **Probes:** `git log` shows squashed history
- **Pass/Fail:** Expected commit count and messages
- **Reset:** true

---

### Skill: Perform conflict resolution during rebase

- **Feasibility:** verifiable with scaffolding
- **Fixtures:** Repo with conflicting changes
- **Probes:** Learner must resolve file, `git add`, then `git rebase --continue`
- **Pass/Fail:** Conflict resolved, rebase completed

---

### Skill: Implement `git rebase --abort` and `--skip`

- **Feasibility:** auto-verifiable with scaffolding
- **Fixtures:** Repo mid-rebase with conflict
- **Probes:** Learner runs `git rebase --abort` → confirm branch reset to pre-rebase state
- **Pass/Fail:** History restored

---

### Skill: Illustrate difference between squash vs. fixup

- **Feasibility:** knowledge check (optional lab)
- **Mode:** MCQ
- **Q:** What does `fixup` do compared to `squash`?
  **Correct:** Both combine commits, but `fixup` discards the commit message

---

### Skill: Use `git log --oneline --graph` to verify history

- **Feasibility:** auto-verifiable
- **Fixtures:** After rebase, learner must run `git log --oneline --graph`
- **Pass/Fail:** Output shows linear history without merge nodes

---

### Skill: Apply best practices for commit messages during rebasing

- **Feasibility:** manual review (commit style guide)
- **Verification mode:** instructor checks commit log for clarity

---

## Level 3 — Building

### Skill: Construct clean commit histories

- **Feasibility:** auto-verifiable with scaffolding
- **Fixtures:** Repo with messy commits (typos, WIP)
- **Probes:** Rebase -i, squash/edit to clean history
- **Pass/Fail:** Commit log matches expected cleaned version

---

### Skill: Develop workflows integrating rebasing + code review

- **Feasibility:** manual review or lab
- **Fixtures:** Repo with feature PR
- **Verification:** Learner rebases/squashes before merge
- **Pass/Fail:** Squashed history ready for review

---

### Skill: Solve complex conflict scenarios

- **Feasibility:** scaffolded lab
- **Fixtures:** Repo with multi-file conflicts
- **Pass/Fail:** Rebase completes, files resolved correctly

---

### Skill: Modify commit sequences to remove sensitive commits

- **Feasibility:** scaffolded lab
- **Fixtures:** Repo with secret token in one commit
- **Probes:** Learner rebase -i drop/edit commit
- **Pass/Fail:** Secret no longer in history

---

### Skill: Organize long-lived branches by rebasing periodically

- **Feasibility:** scaffolded lab
- **Fixtures:** Long-lived branch behind main
- **Pass/Fail:** Branch rebased cleanly onto latest main

---

### Skill: Present before/after comparisons to teammates

- **Feasibility:** knowledge check (explain log graphs)
- **Mode:** Short-answer

---

### Skill: Design scripts or aliases for rebase tasks

- **Feasibility:** auto-verifiable (check `.gitconfig`)
- **Probes:** Inspect alias config via `git config --get alias.rebaseX`

---

### Skill: Integrate `git rerere`

- **Feasibility:** scaffolded lab
- **Fixtures:** Repo with repeatable conflict scenario
- **Probes:** Check `git config rerere.enabled`, confirm reuse of resolution

---

### Skill: Produce consistent histories for bisect/debug

- **Feasibility:** scaffolded lab
- **Pass/Fail:** Commit log clean, no meaningless commits

---

## Level 4 — Advancing

### Skill: Analyze when to prefer rebase vs. merge

- **Feasibility:** knowledge check
- **Mode:** Case-based question
- **Pass/Fail:** Justifies rebase for feature branches, merge for integration

---

### Skill: Evaluate impact of rebasing on CI/CD

- **Feasibility:** manual review (discussion)

---

### Skill: Optimize workflows with `git pull --rebase` + hooks

- **Feasibility:** scaffolded lab
- **Fixtures:** Repo with pre-push hook enforcing rebase
- **Pass/Fail:** Hook rejects pushes with merge commits

---

### Skill: Critique commit histories & propose rebase strategies

- **Feasibility:** manual review of log analysis

---

### Skill: Integrate rebasing into GitHub/GitLab PR policies

- **Feasibility:** knowledge check (case-based)

---

### Skill: Adapt rebase to monorepos/polyrepos

- **Feasibility:** manual review

---

### Skill: Lead team in handling conflicts collaboratively

- **Feasibility:** manual review

---

### Skill: Compare rebasing vs. cherry-picking vs. merging

- **Feasibility:** knowledge check
- **Mode:** MCQ

---

### Skill: Establish reset/recovery strategies (`git reflog`)

- **Feasibility:** scaffolded lab
- **Fixtures:** Repo with failed rebase
- **Probes:** Learner uses `git reflog` + `git reset`
- **Pass/Fail:** Branch restored

---

# Summary

- **Level 1:** All knowledge checks.
- **Level 2:** Mostly auto-verifiable labs, some scaffolding for conflicts & interactive rebases.
- **Level 3:** Heavy use of scaffolding repos, verification via logs & config.
- **Level 4:** Mix of case-based knowledge checks, labs with hooks & reflog recovery, and manual review for team/enterprise-level strategy.
- **Level 5:** Out of scope (manual reflection).
