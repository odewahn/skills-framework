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

# 🧩 Git Skill Framework

---

### Level 1 – Exploring

_Focus: learn the basics and build foundational understanding._

- Identify what Git is and describe its role in version control compared to centralized systems.
- Define core Git concepts: repository, commit, branch, merge, remote.
- Recognize the difference between a working directory, staging area, and commit history.
- List common Git commands and their purposes (`init`, `clone`, `status`, `add`, `commit`).
- Describe the difference between local and remote repositories.
- Explain the purpose of `.gitignore` and how it affects version tracking.
- Recall how to configure user information (`git config`) at local vs. global scope.
- Recognize the structure of a commit (hash, message, author, timestamp).
- Identify typical enterprise use cases: code collaboration, change tracking, auditability.

---

### Level 2 – Applying

_Focus: use foundational knowledge in real scenarios with guidance._

- Apply Git commands to create and clone repositories.
- Demonstrate adding, staging, and committing changes.
- Execute branching operations to create and switch between branches.
- Use `git log`, `git diff`, and `git status` to inspect repository history and changes.
- Implement basic merges and recognize merge conflicts.
- Perform pushes and pulls with a remote (e.g., GitHub, GitLab, Bitbucket).
- Illustrate how to create and manage `.gitignore` for common project types.
- Demonstrate undo operations (`git checkout`, `git reset`, `git revert`) in simple cases.
- Apply tagging for marking releases or milestones.
- Use Git GUIs or IDE integrations to visualize commit history.

---

### Level 3 – Building

_Focus: deliver projects independently and solve real problems._

- Develop feature branches using Git Flow or trunk-based development conventions.
- Construct meaningful commit messages aligned with enterprise standards.
- Organize branches for parallel work and collaborative contributions.
- Solve common merge conflicts and explain conflict resolution strategies.
- Produce pull requests (or merge requests) and participate in code reviews.
- Modify history safely with interactive rebasing (`git rebase -i`).
- Present repository history clearly with visualization tools (`git log --graph`).
- Design `.gitignore` and `.gitattributes` rules to support team/project needs.
- Use stashing (`git stash`) to manage context switching in active work.
- Implement shallow clones, sparse checkouts, or submodules for large projects.
- Integrate Git hooks for local automation (e.g., linting, pre-commit checks).

---

### Level 4 – Advancing

_Focus: optimize, integrate, and analyze in complex environments._

- Analyze commit history to trace bugs or regressions (`git bisect`).
- Evaluate branching strategies (Git Flow, trunk-based, GitHub Flow) for enterprise teams.
- Optimize repository performance (pruning, garbage collection, large file handling).
- Integrate Git with CI/CD systems for automated builds and deployments.
- Adapt workflows to enterprise compliance requirements (signed commits, audit trails).
- Compare and critique different conflict-resolution approaches (merge vs. rebase).
- Lead adoption of code review workflows with pull requests and approvals.
- Integrate Git with external tools (issue trackers, project management systems).
- Adapt submodules, monorepos, or subtrees for complex project structures.
- Evaluate and optimize use of Git LFS (Large File Storage).
- Lead team-wide migration projects (e.g., SVN to Git).

---

### Level 5 – Innovating

_Focus: establish best practices, create new solutions, and mentor others._

- Define enterprise Git standards (commit message conventions, branching models).
- Create training and mentoring resources to upskill colleagues in Git.
- Innovate automation solutions with custom hooks and CI/CD pipelines.
- Establish governance for repository structure, permissions, and security.
- Propose improvements to enterprise Git usage (e.g., mono-repo vs. multi-repo).
- Lead development of internal tooling around Git (dashboards, bots, scripts).
- Formulate strategies for scaling Git in large organizations (mirroring, replication).
- Mentor peers in advanced history rewriting, repository repair, and recovery.


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
