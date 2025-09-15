
# 🧪 Lab Environment Blueprint (LEB)

The Lab Environment Blueprint defines the **practical environment** that learners interact with when working on skills in the framework.
It translates requirements from the **Verification Capability Map (VCM)** into concrete setup instructions (fixtures, datasets, repos, scripts).

Its purpose is to:

* Document the **fixtures** required (repositories, datasets, configuration files).
* Specify the **bootstrap process** for creating the lab environment.
* Define how the environment can be **reset/cleaned** between attempts.
* Keep labs **lightweight and reproducible** (size and runtime constraints).
* Ensure verifiers have a known starting point to run probes consistently.
* **Generate runnable scripts (`bootstrap.sh`, `reset.sh`, `verify.sh`) and a `Makefile`.**
* **Bundle everything into a downloadable ZIP with a README.md.**

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

## Environment Context

* **OS base image:** \[e.g., Linux, Ubuntu 22.04]
* **Available commands/tools:** \[git, sqlite3, jq, ls, etc.]
* **Network access:** \[true/false; describe if limited]
* **Timeouts:** \[default execution time, e.g., 30s]
* **Size/runtime guidelines:** \[e.g., repos ≤ 5 MB, DB ≤ 5000 rows, setup ≤ 20s]
* **Reset strategy:** \[docker reset, script cleanup, fixture re-seed]

---

## Fixtures

List all required inputs the learner needs:

* **Repositories:**

  * Name: \[repo name]
  * Structure: \[branches, commits, tags seeded]
  * Size: \[small/medium/large]
  * Notes: \[special setup, e.g., merge conflicts pre-seeded]

* **Datasets/Files:**

  * Path: \[file path]
  * Format: \[JSON, CSV, SQL]
  * Size: \[rows, KB]
  * Notes: \[intended use, e.g., “used for SELECT queries”]

* **Configuration files:**

  * Path: \[e.g., .gitignore, .gitattributes]
  * Seed contents: \[summary or link to snippet]

---

## Bootstrap Process

* **Setup script path:** `bootstrap.sh`

* **Steps performed:**

  1. Create directory structure
  2. Initialize repo / seed DB / copy files
  3. Install dependencies (if needed)
  4. Verify setup integrity (sanity checks)

* **Expected runtime:** \[in seconds]

* **Verification of success:** \[command(s) or checks to confirm ready state]

---

## Reset / Cleanup Strategy

* **Reset script path:** `reset.sh`

* **Steps performed:**

  1. Clear learner changes
  2. Restore fixtures to baseline
  3. Verify integrity of reset state

* **Expected runtime:** \[in seconds]

---

## Verification Strategy

* **Verification script path:** `verify.sh`
* **Checks performed:**

  * Ensure seeded branches, tags, commits exist.
  * Run tests if fixtures include code.
  * Confirm repo/file integrity after bootstrap/reset.

---

## Orchestration

* **Makefile** included with the following targets:

  * `make up` → bootstrap labs
  * `make verify` → run verification
  * `make reset` → wipe + rebuild baseline
  * `make clean` → remove lab directory only
  * `make reup` → clean + bootstrap
  * `make show` → list workspace contents
  * `make help` → show help text

---

## Packaging

* **README.md** auto-generated with usage guide:

  * Setup instructions
  * Quick-start commands (`make up`, `make verify`, `make reset`)
  * Makefile command reference
  * Troubleshooting notes

* **ZIP archive** (`lab-starter.zip`) includes:

  * `bootstrap.sh`
  * `reset.sh`
  * `verify.sh`
  * `Makefile`
  * `README.md`

Learners can download the zip, extract, and immediately run:

```bash
make up
make verify
```

---

## Default README.md (auto-included in ZIP)

````markdown
# 📘 Lab Starter Environment

This bundle contains everything you need to spin up and reset a self-contained lab environment for practicing skills from the **# 🧩 Git Skill Framework

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
**.

---

## 🚀 Quick Start

1. Extract the ZIP archive:
   ```bash
   unzip lab-starter.zip
   cd lab-starter
````

2. Bootstrap the environment:

   ```bash
   make up
   ```

3. Verify the setup:

   ```bash
   make verify
   ```

4. Reset back to a clean state at any time:

   ```bash
   make reset
   ```

---

## 📂 Contents

* `bootstrap.sh` → Seeds all fixtures (repos, files, configs).
* `reset.sh` → Wipes learner changes and rebuilds baseline.
* `verify.sh` → Runs sanity checks (branches, commits, tags, tests).
* `Makefile` → Convenience targets (`up`, `verify`, `reset`, `clean`, `reup`, `show`).
* `README.md` → This usage guide.

---

## 🛠️ Makefile Commands

| Command       | Description                                          |
| ------------- | ---------------------------------------------------- |
| `make up`     | Bootstrap labs (create fixtures)                     |
| `make verify` | Run sanity checks over fixtures                      |
| `make reset`  | Wipe and rebuild baseline                            |
| `make clean`  | Remove labs only                                     |
| `make reup`   | Clean + bootstrap fresh                              |
| `make show`   | List workspace contents (excluding `.git` internals) |
| `make help`   | Show command help                                    |

---

## ⚡ Environment Notes

* **OS base image:** Ubuntu 22.04 (recommended)
* **Tools required:** `git` (≥2.34), `make`, `bash`
* **Optional tools:** `jq`, `sqlite3` (depending on fixtures)
* **Default workspace:** `./labs` (overridable with `LAB_ROOT=/path make up`)

---

## 🧹 Resetting & Cleaning

* `make reset` → Full reset (wipes and re-runs bootstrap).
* `make clean` → Deletes the labs directory only.
* `make reup` → Equivalent to `make clean` + `make up`.

---

## 🧪 Verification

The verification script checks:

* Correct branches, commits, and tags exist.
* Repo state matches baseline (no missing fixtures).
* Optional tests run successfully (e.g., `git bisect` finds seeded bug).

Run with:

```bash
make verify
```

---

## 🔒 Safety

All repos and files are **local and sandboxed**.
No external network calls are made (remotes are simulated with local bare repos).

---

## 🙋 Help

```bash
make help
```

```

---

## Example Lab Environment (Git)

- **Fixture:** Repo with `main` and `feature` branches, 5 commits each.  
- **Bootstrap:** `git init`, add commits programmatically.  
- **Reset:** Remove repo directory and recreate from seed script.  
- **Verify:** Run `git log`, `git branch` to confirm seeded state.  
- **Size:** < 1 MB, runtime < 10s.  
- **Orchestration:** Use `make up`, `make verify`, `make reset`.  
- **Packaging:** Deliver as `git-lab-starter.zip`.  
