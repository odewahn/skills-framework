# 👩‍🏫 Preparation Instructor Blueprint (PIB)

The Preparation Instructor Blueprint defines how an instructor (human or AI-assisted) helps learners **prepare for verification** without exposing the actual verification items.
It leverages the **Skill Framework (SF)**, **Verification Capability Map (VCM)**, **Knowledge Check Blueprint (KCB)**, and **Lab Environment Blueprint (LEB)** to provide **distinct but aligned preparation activities**.

---

## Purpose

* Make a quick **initial assessment** of learner’s current level.
* Guide learners toward the **skills relevant** to their upcoming verification.
* Provide **practice activities** that are different from the real verification, but cover the same skill areas.
* Build familiarity with the **lab environment (LEB)**.
* Encourage **reflection and self-assessment**.

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

## 1. Assessment Phase

**Goal:** estimate learner’s starting level (Exploring → Innovating).

* **Background questions:**

  * “How often do you use this tool/technology?”
  * “What kinds of problems have you solved with it before?”
  * “When did you last practice these skills?”

* **KCB warm-ups:**
  Select a handful of **sample knowledge questions**, re-phrased or varied from the official KCB.

  * Use different scenarios or wording.
  * Cover multiple domains (definitions, concepts, recognition).

* **Scenario probe:**
  Ask learner to **explain their approach** to a common task (not solve it fully).
  Example: “Imagine you needed to share your work with a teammate. What steps would you take?”

* **Outcome:** Instructor places learner into a **tentative level band** (Exploring, Applying, Building, etc.).

---

## 2. Preparation Strategy

Adjust activities based on learner’s estimated level:

### Level 1–2 (Exploring / Applying)

* Emphasize **core concepts** and guided practice.
* Use alternative KCB questions with simpler contexts.
* Assign **step-by-step walkthroughs** in the LEB.
* Encourage learners to **compare outputs** of commands or tools.

### Level 3–4 (Building / Advancing)

* Focus on **applied problem solving**.
* Create **scenario-based drills** (different from verification probes).
* Use **modified VCM probes**: similar skill check, but different setup/fixtures.
* Ask learners to **predict outcomes** of actions before trying them in the lab.

### Level 5 (Innovating)

* Focus on **coaching, strategy, and system-level thinking**.
* Encourage learners to **teach back** a concept or mentor a peer.
* Pose **enterprise or “what if” scenarios** that require analysis.
* Ask them to design or critique workflows, not just perform steps.

---

## 3. Practice Exercise Design Rules

* Exercises must be **different in surface form** from verification (no reuse of actual questions/probes).
* Cover the **same underlying skills**.
* Encourage **explanation of reasoning** (not just execution).
* Use the **LEB fixtures** but with **variations** (different filenames, data, branch names, etc.).
* End with **reflection prompts**:

  * “What did you learn here?”
  * “How will this help you in verification?”

---

## 4. Instructor Flow

1. **Check-in:** gather background + run warm-up KCB items.
2. **Level placement:** place learner in tentative level band.
3. **Select prep path:** choose exercises from SF aligned to their level.
4. **Practice & reflect:** run activities in LEB (with guidance or variations).
5. **Confidence check:** ask learner what they still feel uncertain about.
6. **Next steps:** recommend reading, peer discussion, or a `make reset` in the LEB before attempting verification.

---

## Example Structure (Generic)

* **Skill focus (from SF):** “Execute branching operations.”
* **Verification probe (VCM):** check branch exists with `git branch`.
* **Prep exercise (PIB):**

  * Task: “Create two new branches with meaningful names, switch between them, and describe how you confirmed which branch is active.”
  * Variation ensures it’s not the same as verification, but covers the same skill.
