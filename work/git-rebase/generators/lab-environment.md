
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

This bundle contains everything you need to spin up and reset a self-contained lab environment for practicing skills from the **# 🧩 Git Rebase Skill Framework

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
