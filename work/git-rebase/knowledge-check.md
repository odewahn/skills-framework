Got it. You want me to **populate the Knowledge Check Bank** with actual questions based on the **Git Rebase Skill Framework** you outlined, following the markdown schema you provided.

Since the framework spans Levels 1–5, the best practice is:

- **Level 1 (Exploring):** Heavier coverage, multiple MCQs and a few T/F or short answer.
- **Levels 2–4:** Fewer but targeted, mostly scenario-based.
- **Level 5 (Innovating):** Usually reflective or open-ended, so minimal checks (mentoring focus).

Here’s a first draft of the **Knowledge Check Bank for Git Rebase**:

---

# 📝 Knowledge Check Bank – Git Rebase

---

## Level 1 – Exploring

### Question 1 (MCQ)

- **Skill:** Identify what `git rebase` is and describe its role compared to `git merge`.
- **Question:** How does `git rebase` differ from `git merge`?
- **Type:** MCQ
- **Options:**
  A) Rebase replays commits onto a new base, while merge creates a new merge commit
  B) Rebase deletes old commits, while merge preserves them
  C) Rebase is used only on remote branches, while merge is local only
  D) Rebase is safer than merge for public branches
- **Correct Answer:** A
- **Explanation:** Rebase rewrites history by replaying commits; merge preserves all history with a merge commit.
- **Hints:** Think “replay vs. combine.”

---

### Question 2 (True/False)

- **Skill:** Recall the risks of rebasing shared/public branches.
- **Question:** Rebasing public branches is safe as long as you use `--interactive`.
- **Type:** True/False
- **Correct Answer:** False
- **Explanation:** Rebasing rewrites history, which causes issues for collaborators on public branches, regardless of interactive mode.
- **Hints:** Golden rule: never rebase public/shared branches.

---

### Question 3 (MCQ)

- **Skill:** Define the difference between interactive and non-interactive rebases.
- **Question:** Which statement best describes `git rebase -i`?
- **Type:** MCQ
- **Options:**
  A) It performs a rebase without requiring user input
  B) It allows editing, squashing, and reordering commits
  C) It automatically merges branches with a merge commit
  D) It deletes all commits after the base commit
- **Correct Answer:** B
- **Explanation:** Interactive rebase (`-i`) lets developers rewrite commit history more flexibly.
- **Hints:** “-i” = “interactive editing.”

---

### Question 4 (Short Answer)

- **Skill:** List the basic steps in a simple rebase.
- **Question:** Name the **four main steps** in a simple rebase workflow.
- **Type:** Short Answer
- **Correct Answer:** Checkout branch → Run `git rebase` → Resolve conflicts → Run `git rebase --continue`.
- **Explanation:** This sequence represents the standard rebase process.
- **Hints:** Think: checkout, rebase, fix, continue.

---

### Question 5 (MCQ)

- **Skill:** Describe what happens to commit hashes after a rebase.
- **Question:** After rebasing, what happens to the commit hashes of rebased commits?
- **Type:** MCQ
- **Options:**
  A) They stay the same
  B) They are replaced with new hashes
  C) Only the last commit gets a new hash
  D) Hashes only change if using `--interactive`
- **Correct Answer:** B
- **Explanation:** Rebasing rewrites history; every rebased commit gets a new hash.
- **Hints:** “New base = new hashes.”

---

## Level 2 – Applying

### Question 6 (MCQ)

- **Skill:** Demonstrate a basic rebase of a feature branch onto the latest `main`.
- **Question:** What is the correct sequence to rebase `feature` onto `main`?
- **Type:** MCQ
- **Options:**
  A) `git checkout main` → `git rebase feature`
  B) `git checkout feature` → `git rebase main`
  C) `git merge feature` → `git checkout main`
  D) `git rebase feature main`
- **Correct Answer:** B
- **Explanation:** Always rebase the feature branch **onto** the base branch.
- **Hints:** “Feature moves onto main.”

---

### Question 7 (MCQ)

- **Skill:** Execute `git rebase -i` to reorder, squash, and edit commits.
- **Question:** In an interactive rebase, what keyword squashes a commit into the one above it?
- **Type:** MCQ
- **Options:**
  A) squash
  B) fixup
  C) merge
  D) drop
- **Correct Answer:** A
- **Explanation:** “squash” combines commits while letting you edit the commit message.
- **Hints:** Think “squash = combine.”

---

### Question 8 (True/False)

- **Skill:** Implement `git rebase --abort` and `--skip`.
- **Question:** `git rebase --abort` discards the entire rebase process and restores the branch to its original state.
- **Type:** True/False
- **Correct Answer:** True
- **Explanation:** `--abort` cancels the rebase entirely, restoring the branch before the operation.
- **Hints:** Abort = undo completely.

---

## Level 3 – Building

### Question 9 (Short Answer)

- **Skill:** Construct clean commit histories by squashing, splitting, or editing commits.
- **Question:** Which three actions can you take during an interactive rebase to improve commit history clarity?
- **Type:** Short Answer
- **Correct Answer:** Squash commits, split commits, edit commit messages.
- **Explanation:** These actions help maintain logical, readable commit histories.
- **Hints:** Think “rewrite for clarity.”

---

### Question 10 (MCQ)

- **Skill:** Integrate `git rerere` to optimize repeated conflict resolutions.
- **Question:** What does `git rerere` do?
- **Type:** MCQ
- **Options:**
  A) Automatically reverts conflicts to the original state
  B) Records conflict resolutions and reuses them
  C) Resolves conflicts by picking remote changes first
  D) Prevents conflicts during rebases
- **Correct Answer:** B
- **Explanation:** `rerere` stands for “reuse recorded resolution.”
- **Hints:** Rerere = reuse resolution.

---

## Level 4 – Advancing

### Question 11 (MCQ)

- **Skill:** Analyze when to prefer `rebase` vs. `merge` in enterprise branching strategies.
- **Question:** Which scenario is **best suited** for rebasing instead of merging?
- **Type:** MCQ
- **Options:**
  A) Merging hotfixes into production urgently
  B) Updating a feature branch with the latest changes from `main` before PR
  C) Combining two long-lived release branches
  D) Integrating multiple developers’ work simultaneously
- **Correct Answer:** B
- **Explanation:** Rebasing is best for keeping feature branches up-to-date without merge commits.
- **Hints:** Think “clean history.”

---

### Question 12 (True/False)

- **Skill:** Establish reset and recovery strategies (e.g., `git reflog`) after failed rebases.
- **Question:** `git reflog` allows you to recover commits lost during a rebase.
- **Type:** True/False
- **Correct Answer:** True
- **Explanation:** Reflog tracks branch movements, so you can reset to lost commits.
- **Hints:** “Reflog = time machine.”

---

Would you like me to **continue fleshing this out through Level 5 (Innovating)** with reflective-style checks, or keep Levels 1–4 as the main focus since they’re more directly testable?
