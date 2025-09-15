# 📝 Knowledge Check Blueprint (KCB)

The Knowledge Check Blueprint (KCB) is a companion to the **Verification Capability Map (VCM)**.
Where the VCM handles lab-based or manual verification, the KCB is focused on **knowledge checks** — multiple-choice or short-answer questions designed to verify **Level 1 (Exploring)** skills, and occasionally simple recall items in higher levels.

Its purpose is to:

* Provide a structured bank of questions aligned directly to skills in the framework.
* Support multiple question types (MCQ, True/False, Short Answer).
* Document correct answers, distractors, and hints for remediation.
* Ensure that knowledge checks can be delivered consistently and reused across labs, quizzes, or courses.

---

## Skill Framework Link

# 🧩 Git Rebase Skill Framework

---

### Level 1 – Exploring

_Focus: learn the basics and build foundational understanding._

- Identify what `git rebase` is and describe its role compared to `git merge`.
- Define the difference between **interactive** (`git rebase -i`) and **non-interactive** rebases.
- Recognize the typical use cases for rebasing: linearizing history, updating feature branches.
- Recall the risks of rebasing shared/public branches.
- List the basic steps in a simple rebase: checkout, rebase, resolve conflicts, continue.
- Explain how rebasing differs from fast-forward merges.
- Identify commands associated with rebase workflows: `git rebase`, `--continue`, `--abort`, `--skip`.
- Describe what happens to commit hashes after a rebase.
- Recognize the meaning of “upstream branch” in the context of rebase.

---

### Level 2 – Applying

_Focus: use foundational knowledge in real scenarios with guidance._

- Demonstrate a **basic rebase** of a feature branch onto the latest `main`.
- Apply `git pull --rebase` to keep local branches in sync with remote without merge commits.
- Use `git rebase --onto` to change the base of a branch.
- Execute `git rebase -i` to reorder, squash, and edit commits.
- Perform conflict resolution during a rebase and complete the process with `--continue`.
- Implement `git rebase --abort` and `--skip` when appropriate.
- Illustrate the difference between squashing and fixup commits in an interactive rebase.
- Use `git log --oneline --graph` to verify branch history before and after rebase.
- Apply best practices for commit messages when rebasing.

---

### Level 3 – Building

_Focus: deliver projects independently and solve real problems._

- Construct clean commit histories by squashing, splitting, or editing commits strategically.
- Develop workflows that integrate rebasing with **code review** processes (e.g., squash before PR).
- Solve complex conflict scenarios during multi-commit rebases.
- Modify commit sequences to remove sensitive or mistaken commits.
- Organize long-lived branches by periodically rebasing them onto `main`.
- Present before-and-after comparisons of history to teammates to explain rebase results.
- Design scripts or aliases that simplify common rebase tasks.
- Integrate `git rerere` to optimize repeated conflict resolutions during rebases.
- Produce consistent branch histories that facilitate bisecting and debugging.

---

### Level 4 – Advancing

_Focus: optimize, integrate, and analyze in complex environments._

- Analyze when to prefer `rebase` vs. `merge` in enterprise branching strategies.
- Evaluate the impact of rebasing on **CI/CD pipelines** and automated builds.
- Optimize team workflows by standardizing use of `git pull --rebase` and pre-push hooks.
- Critique existing commit histories and propose rebase strategies to simplify them.
- Integrate rebasing practices with **GitHub/GitLab PR policies** (e.g., squash merges).
- Adapt rebase strategies to monorepos or polyrepo setups.
- Lead teams in handling rebase conflicts collaboratively during large-scale integrations.
- Compare rebasing with cherry-picking and merging to articulate trade-offs.
- Establish reset and recovery strategies (e.g., `git reflog`) after failed rebases.

---

### Level 5 – Innovating

_Focus: establish best practices, create new solutions, and mentor others._

- Define organizational standards for rebase use across teams/projects.
- Mentor developers in safe and effective rebasing, with emphasis on collaboration risks.
- Innovate tooling (aliases, Git hooks, custom scripts) to automate safe rebasing.
- Propose branching strategies (trunk-based, GitHub Flow, GitLab Flow) with rebasing built-in.
- Lead development of training materials and documentation on rebasing best practices.
- Establish policies for rebasing in regulated or high-compliance environments.
- Create decision frameworks for rebase vs. merge vs. cherry-pick in enterprise contexts.


---

## Question Record Schema (Markdown)

Each knowledge check should include the following fields:

* **Skill:** The skill from the framework this question checks.
* **Question:** The actual prompt to the learner.
* **Type:** MCQ | True/False | Short Answer
* **Options (if MCQ):** List of possible answers (A, B, C...).
* **Correct Answer:** The correct response.
* **Explanation:** Why the answer is correct and why others are not.
* **Hints:** Helpful cues, recall tips, or links to labs/docs.

---

# Knowledge Check Bank

## Example Skill: Identify the purpose of a primary key in a relational database

### Question 1 (MCQ)

* **Skill:** Identify the purpose of a primary key in a relational database
* **Question:** What is the role of a primary key in a table?
* **Type:** MCQ
* **Options:**
  A) It enforces uniqueness of rows
  B) It stores the row’s creation date
  C) It links the table to a foreign schema
  D) It defines the order of rows
* **Correct Answer:** A
* **Explanation:** The primary key uniquely identifies each row in a table.
* **Hints:**

  * Remember: keys = uniqueness
  * See lab: CREATE TABLE with PRIMARY KEY
