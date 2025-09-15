Perfect — we’ll build a **Git Knowledge Check Bank** across all levels, with a **strong focus on Level 1 (Exploring)** (8–10 questions), then provide a smaller set for Levels 2–4 (3–4 each), and a couple of thought-style checks for Level 5 (since those are less auto-verifiable).

---

# 📚 Git Knowledge Check Bank

---

## Level 1 – Exploring

### Q1 (MCQ)

- **Skill:** Identify what Git is and describe its role in version control compared to centralized systems
- **Question:** Which statement best describes Git?
- **Type:** MCQ
- **Options:**
  A) A centralized system where one server holds the codebase
  B) A distributed version control system where each clone is a full repository
  C) A cloud-only system requiring constant internet access
  D) A file-sharing protocol for sending code between developers
- **Correct Answer:** B
- **Explanation:** Git is distributed, not centralized — each developer has the full repository.
- **Hints:** Think “every developer has the whole history.”

---

### Q2 (True/False)

- **Skill:** Recognize the difference between a working directory, staging area, and commit history
- **Question:** The staging area (index) is where you prepare changes before committing them.
- **Type:** True/False
- **Correct Answer:** True
- **Explanation:** The staging area is a middle step between working changes and the permanent commit.
- **Hints:** Think: “workspace → staging → history.”

---

### Q3 (MCQ)

- **Skill:** List common Git commands and their purposes
- **Question:** Which Git command is used to initialize a new repository?
- **Type:** MCQ
- **Options:**
  A) `git init`
  B) `git clone`
  C) `git status`
  D) `git commit`
- **Correct Answer:** A
- **Explanation:** `git init` creates a new repository; `git clone` copies an existing one.
- **Hints:** Think “start fresh.”

---

### Q4 (Short Answer)

- **Skill:** Describe the difference between local and remote repositories
- **Question:** Can you use Git without a remote repository? If yes, how?
- **Type:** Short Answer
- **Correct Answer:** Yes — by running `git init` locally and committing changes without adding a remote.
- **Explanation:** Remotes are optional, only needed for collaboration.
- **Hints:** Local repos stand alone.

---

### Q5 (MCQ)

- **Skill:** Explain the purpose of `.gitignore` and how it affects version tracking
- **Question:** Which files would you typically include in a `.gitignore`?
- **Type:** MCQ
- **Options:**
  A) Source code files (`.py`, `.js`)
  B) Build artifacts or temporary files (`.log`, `.class`)
  C) Project documentation (`README.md`)
  D) Git configuration (`.git/config`)
- **Correct Answer:** B
- **Explanation:** `.gitignore` excludes temporary or generated files from version control.
- **Hints:** Think “don’t track garbage.”

---

### Q6 (MCQ)

- **Skill:** Recall how to configure user information (`git config`) at local vs. global scope
- **Question:** Which command sets the author name for all repositories on a machine?
- **Type:** MCQ
- **Options:**
  A) `git config --local user.name "Alice"`
  B) `git config --system user.name "Alice"`
  C) `git config --global user.name "Alice"`
  D) `git config user.name "Alice"`
- **Correct Answer:** C
- **Explanation:** The `--global` flag applies across all repos for a user account.
- **Hints:** Think “applies everywhere.”

---

### Q7 (True/False)

- **Skill:** Recognize the structure of a commit (hash, message, author, timestamp)
- **Question:** Every commit in Git has a unique SHA-1 hash identifier.
- **Type:** True/False
- **Correct Answer:** True
- **Explanation:** SHA-1 hashes uniquely identify commits by their content.
- **Hints:** Think “hash = fingerprint.”

---

### Q8 (MCQ)

- **Skill:** Identify typical enterprise use cases
- **Question:** Which of the following is **not** a typical enterprise use case of Git?
- **Type:** MCQ
- **Options:**
  A) Code collaboration
  B) Auditability of changes
  C) Binary file storage as a primary database
  D) Change tracking
- **Correct Answer:** C
- **Explanation:** Git is not optimized as a primary store for large binary files.
- **Hints:** Think: Git is for text/code.

---

## Level 2 – Applying

### Q9 (MCQ)

- **Skill:** Execute branching operations to create and switch branches
- **Question:** Which command creates and switches to a new branch called `feature-x`?
- **Type:** MCQ
- **Options:**
  A) `git branch feature-x`
  B) `git checkout -b feature-x`
  C) `git switch -c feature-x`
  D) Both B and C
- **Correct Answer:** D
- **Explanation:** Both `checkout -b` and `switch -c` create + switch. `git branch` creates only.
- **Hints:** Think “create + move.”

---

### Q10 (True/False)

- **Skill:** Perform pushes and pulls with a remote
- **Question:** `git push` sends commits from the local repository to the remote.
- **Type:** True/False
- **Correct Answer:** True
- **Explanation:** `push` uploads local commits; `pull` fetches and merges.
- **Hints:** Push = out, Pull = in.

---

### Q11 (Short Answer)

- **Skill:** Demonstrate undo operations (`git checkout`, `git reset`, `git revert`)
- **Question:** Which Git command creates a new commit that undoes a previous commit?
- **Type:** Short Answer
- **Correct Answer:** `git revert`
- **Explanation:** Unlike `reset`, `revert` creates a safe undo commit.
- **Hints:** Think “safe undo.”

---

## Level 3 – Building

### Q12 (MCQ)

- **Skill:** Construct meaningful commit messages aligned with standards
- **Question:** Which is the **best** commit message style for enterprise projects?
- **Type:** MCQ
- **Options:**
  A) “stuff”
  B) “fixed bugs and changes”
  C) “Fix: resolve null pointer exception in login controller”
  D) “update”
- **Correct Answer:** C
- **Explanation:** Good messages are descriptive, scoped, and actionable.
- **Hints:** Think “professional and precise.”

---

### Q13 (True/False)

- **Skill:** Solve common merge conflicts
- **Question:** A merge conflict occurs when two commits modify the same line in a file.
- **Type:** True/False
- **Correct Answer:** True
- **Explanation:** Conflicts arise when Git cannot auto-merge overlapping edits.
- **Hints:** Think “same spot, different edits.”

---

### Q14 (Short Answer)

- **Skill:** Use stashing to manage context switching
- **Question:** Which command saves uncommitted changes temporarily?
- **Type:** Short Answer
- **Correct Answer:** `git stash`
- **Explanation:** It stores changes away, so you can work on something else.
- **Hints:** Think “hide work, come back later.”

---

## Level 4 – Advancing

### Q15 (MCQ)

- **Skill:** Analyze commit history to trace bugs (`git bisect`)
- **Question:** Which command helps find the commit that introduced a bug?
- **Type:** MCQ
- **Options:**
  A) `git blame`
  B) `git log`
  C) `git bisect`
  D) `git revert`
- **Correct Answer:** C
- **Explanation:** `git bisect` performs a binary search through history to find the culprit commit.
- **Hints:** Think “narrow down.”

---

### Q16 (True/False)

- **Skill:** Optimize repository performance
- **Question:** Running `git gc` (garbage collection) can help reduce repo size and improve performance.
- **Type:** True/False
- **Correct Answer:** True
- **Explanation:** It cleans unused objects and compresses history.
- **Hints:** Think “spring cleaning.”

---

### Q17 (Short Answer)

- **Skill:** Adapt workflows to compliance requirements
- **Question:** What Git feature ensures commits are verified as coming from a trusted source?
- **Type:** Short Answer
- **Correct Answer:** Signed commits (GPG or SSH signatures)
- **Explanation:** Signed commits enforce authenticity and integrity.
- **Hints:** Think “cryptographic trust.”
