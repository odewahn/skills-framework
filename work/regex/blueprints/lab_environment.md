
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

# 🧩 Skill Framework: Regular Expressions with Bash

### Level 1 – Exploring

_Focus: learn the basics and build foundational understanding._

- Identify what regular expressions are and their purpose in Bash text processing.
- Define the difference between literal characters and regex metacharacters.
- Recognize common metacharacters: `.`, `*`, `+`, `?`.
- List common shorthand character classes: `\d`, `\w`, `\s`.
- Describe explicit character classes: `[abc]`, `[a-z]`, `[^0-9]`.
- Explain the role of anchors: `^` (start of line), `$` (end of line).
- Recall the syntax for grouping `()`, alternation `|`, and escaping `\`.
- Recognize the difference between basic regex (BRE) and extended regex (ERE).
- Identify typical tools in Bash that support regex: `grep`, `egrep`, `sed`, `awk`.
- Explain the concept of greedy vs. non-greedy quantifiers.

---

### Level 2 – Applying

_Focus: use foundational knowledge in real scenarios with guidance._

- Use `grep` with simple regex patterns to search logs or text files.
- Apply character classes to match ranges (e.g., `[0-9]`) in input streams.
- Demonstrate anchors to filter lines beginning or ending with certain text.
- Implement grouping `()` and alternation `|` in `grep -E` or `egrep`.
- Perform simple substitutions with `sed` using regex patterns.
- Illustrate the difference between `grep -E` (extended) and `grep -F` (fixed).
- Execute regex searches within `awk` using the `~` operator.
- Use quantifiers (`*`, `+`, `?`) to capture repeated patterns.
- Apply escaping to handle special characters (e.g., `\.` to match a literal dot).
- Demonstrate combining multiple regex concepts in one search expression.

---

### Level 3 – Building

_Focus: deliver projects independently and solve real problems._

- Construct regex patterns to validate structured input (emails, IPs, dates).
- Develop complex search filters for log files using pipelines with `grep`, `awk`, `sed`.
- Organize regex usage into Bash scripts for reusable text processing.
- Solve data-cleaning tasks with regex substitutions in `sed`.
- Produce regexes that capture subgroups and backreferences in `sed` and `awk`.
- Modify existing regexes to adapt to new requirements without breaking functionality.
- Design regex-based extraction tasks (e.g., extracting fields, stripping tags).
- Integrate regex with `find` or `xargs` to filter and batch-process files.
- Use `grep -o` to extract matches rather than whole lines.
- Build regexes that balance readability with precision for team scripts.

---

### Level 4 – Advancing

_Focus: optimize, integrate, and analyze in complex environments._

- Analyze regex performance tradeoffs in large datasets (e.g., catastrophic backtracking).
- Evaluate regex readability vs. complexity for maintainability in Bash scripts.
- Integrate regex with advanced Bash workflows (`while read`, process substitution).
- Optimize pipelines by combining regex filters with other tools (`cut`, `awk`, `jq`).
- Compare BRE, ERE, and Perl-compatible regex (PCRE via `grep -P`) for feature tradeoffs.
- Adapt regex patterns for localization and encoding issues (UTF-8 vs ASCII).
- Lead debugging of regex-based scripts when patterns fail or overmatch.
- Critique existing team regexes for clarity, performance, and correctness.
- Extend regex-driven Bash scripts to integrate with enterprise ETL pipelines.

---

### Level 5 – Innovating

_Focus: establish best practices, create new solutions, and mentor others._

- Invent enterprise-ready regex style guidelines for Bash scripting.
- Create reusable Bash regex libraries or snippets for common validation tasks.
- Propose best practices for balancing regex vs. alternative parsing tools.
- Mentor teammates on regex debugging and optimization strategies.
- Establish team standards for testing and documenting regex in scripts.
- Lead development of regex-heavy Bash utilities for log analysis or data transformation.
- Formulate new techniques to reduce regex errors in production (test suites, linters).


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

This bundle contains everything you need to spin up and reset a self-contained lab environment for practicing skills from the **# 🧩 Skill Framework: Regular Expressions with Bash

### Level 1 – Exploring

_Focus: learn the basics and build foundational understanding._

- Identify what regular expressions are and their purpose in Bash text processing.
- Define the difference between literal characters and regex metacharacters.
- Recognize common metacharacters: `.`, `*`, `+`, `?`.
- List common shorthand character classes: `\d`, `\w`, `\s`.
- Describe explicit character classes: `[abc]`, `[a-z]`, `[^0-9]`.
- Explain the role of anchors: `^` (start of line), `$` (end of line).
- Recall the syntax for grouping `()`, alternation `|`, and escaping `\`.
- Recognize the difference between basic regex (BRE) and extended regex (ERE).
- Identify typical tools in Bash that support regex: `grep`, `egrep`, `sed`, `awk`.
- Explain the concept of greedy vs. non-greedy quantifiers.

---

### Level 2 – Applying

_Focus: use foundational knowledge in real scenarios with guidance._

- Use `grep` with simple regex patterns to search logs or text files.
- Apply character classes to match ranges (e.g., `[0-9]`) in input streams.
- Demonstrate anchors to filter lines beginning or ending with certain text.
- Implement grouping `()` and alternation `|` in `grep -E` or `egrep`.
- Perform simple substitutions with `sed` using regex patterns.
- Illustrate the difference between `grep -E` (extended) and `grep -F` (fixed).
- Execute regex searches within `awk` using the `~` operator.
- Use quantifiers (`*`, `+`, `?`) to capture repeated patterns.
- Apply escaping to handle special characters (e.g., `\.` to match a literal dot).
- Demonstrate combining multiple regex concepts in one search expression.

---

### Level 3 – Building

_Focus: deliver projects independently and solve real problems._

- Construct regex patterns to validate structured input (emails, IPs, dates).
- Develop complex search filters for log files using pipelines with `grep`, `awk`, `sed`.
- Organize regex usage into Bash scripts for reusable text processing.
- Solve data-cleaning tasks with regex substitutions in `sed`.
- Produce regexes that capture subgroups and backreferences in `sed` and `awk`.
- Modify existing regexes to adapt to new requirements without breaking functionality.
- Design regex-based extraction tasks (e.g., extracting fields, stripping tags).
- Integrate regex with `find` or `xargs` to filter and batch-process files.
- Use `grep -o` to extract matches rather than whole lines.
- Build regexes that balance readability with precision for team scripts.

---

### Level 4 – Advancing

_Focus: optimize, integrate, and analyze in complex environments._

- Analyze regex performance tradeoffs in large datasets (e.g., catastrophic backtracking).
- Evaluate regex readability vs. complexity for maintainability in Bash scripts.
- Integrate regex with advanced Bash workflows (`while read`, process substitution).
- Optimize pipelines by combining regex filters with other tools (`cut`, `awk`, `jq`).
- Compare BRE, ERE, and Perl-compatible regex (PCRE via `grep -P`) for feature tradeoffs.
- Adapt regex patterns for localization and encoding issues (UTF-8 vs ASCII).
- Lead debugging of regex-based scripts when patterns fail or overmatch.
- Critique existing team regexes for clarity, performance, and correctness.
- Extend regex-driven Bash scripts to integrate with enterprise ETL pipelines.

---

### Level 5 – Innovating

_Focus: establish best practices, create new solutions, and mentor others._

- Invent enterprise-ready regex style guidelines for Bash scripting.
- Create reusable Bash regex libraries or snippets for common validation tasks.
- Propose best practices for balancing regex vs. alternative parsing tools.
- Mentor teammates on regex debugging and optimization strategies.
- Establish team standards for testing and documenting regex in scripts.
- Lead development of regex-heavy Bash utilities for log analysis or data transformation.
- Formulate new techniques to reduce regex errors in production (test suites, linters).
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
