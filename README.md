# 📚 Skill System Stack

This repo defines a **5-part system** for teaching, practicing, and verifying skills in a consistent way.
Each document plays a distinct role but links with the others to create an end-to-end flow — from defining skills, to preparing learners, to verifying them in a reproducible lab environment.

---

## ✅ The Five-Document Ecosystem

| Document               | Inputs                                                   | Outputs                                   | Primary Audience    |
| ---------------------- | -------------------------------------------------------- | ----------------------------------------- | ------------------- |
| **Skill Framework**    | Topic                                                    | Leveled skill list                        | Authors             |
| **Skill Verifier**     | Skill Framework, MCP tools                               | Probes, pass/fail rules, fixtures needed  | Verifiers           |
| **Practice Questions** | Skill Framework                                          | Reusable pool of questions tied to skills | Instructors         |
| **Lab Environment**    | Skill Verifier fixtures                                  | Scripts, Makefile, ZIP                    | Learners, Verifiers |
| **Prep Guide**         | Framework, Verifier, Practice Questions, Lab Environment | Prep pathways distinct from verification  | Instructors         |

---

## 1. 🧩 Skill Framework

**Purpose:** Defines _what_ learners should know and do.

- Progressive levels: Exploring → Applying → Building → Advancing → Innovating
- Skills written with Bloom’s verbs, 7–13 per level
- Professional/enterprise focus

**Feeds into:**

- Skill Verifier (defines how to measure each skill)
- Practice Questions (recall checks)
- Lab Environment (fixtures for hands-on practice)
- Prep Guide (chooses prep exercises aligned to level)

---

## 2. 🔎 Skill Verifier

**Purpose:** Defines _how_ to measure skills.

- Maps skills to verification methods (auto, manual, practice question, lab)
- Lists probes (commands, file checks, dataset queries)
- Documents pass/fail criteria
- Notes reset/reproducibility conditions

**Feeds into:**

- Lab Environment (fixtures to prepare for verification)
- Prep Guide (designs practice drills, distinct from verification probes)

---

## 3. 📝 Practice Questions

**Purpose:** Provides **reusable practice questions** for warm-ups and formative checks.

- Question types: multiple choice, true/false, short answer
- Each question tied directly to a skill in the Skill Framework
- Includes correct answers, distractors, and hints
- Used primarily in prep sessions, not in the official Skill Verifier set

**Feeds into:**

- Prep Guide (for warm-up and formative questions that differ from verification items)
- Skill Verifier (can inspire verification questions, but should not be reused verbatim)

---

## 4. 🧪 Lab Environment

**Purpose:** Provides a **sandbox** for skill practice and verification.

- Defines fixtures: repos, datasets, configs
- Provides scripts (`bootstrap.sh`, `reset.sh`, `verify.sh`)
- Orchestrates with `Makefile`
- Packages into a distributable ZIP

**Feeds into:**

- Skill Verifier (fixtures for auto-verification)
- Prep Guide (practice activities inside the same environment, with variations)

---

## 5. 👩‍🏫 Prep Guide

**Purpose:** Guides learners in **preparing for verification**.

- Makes initial level assessment (background + varied Practice Questions)
- Places learner into a skill level band (Exploring → Innovating)
- Assigns **distinct prep exercises** (different from verification, but aligned)
- Uses **Lab Environment** with small variations
- Encourages reflection and self-assessment

**Feeds from:**

- Skill Framework (skills to target)
- Skill Verifier (areas to prepare, without reusing probes)
- Practice Questions (sample items, re-worded for practice)
- Lab Environment (sandbox for prep labs)

---

# 🔄 How They Fit Together

1. **Skill Framework** = the map of skills
2. **Skill Verifier** = the measuring system
3. **Practice Questions** = the quiz bank for warm-ups
4. **Lab Environment** = the sandbox
5. **Prep Guide** = the practice coach

👉 Learner flow:

- Prep Guide starts with warm-up questions (Practice Questions) + background
- Places learner on Skill Framework level
- Recommends prep exercises (distinct from verification, but in Lab Environment)
- When ready → learner takes verification using Skill Verifier in Lab Environment

---

# 📎 Cross-References in Docs

- **Skill Framework** → “See Prep Guide for how these skills are introduced and practiced before verification.”
- **Skill Verifier** → “Prep Guides may design practice activities informed by this map, but must not reuse probes.”
- **Practice Questions** → “Sample items may be adapted by instructors for warm-up assessment (see Prep Guide).”
- **Lab Environment** → “The same environment is used for practice (Prep Guide) and verification (Skill Verifier), with varied tasks.”
- **Prep Guide** → “This document draws on Skill Framework, Skill Verifier, Practice Questions, and Lab Environment.”

---

# ⚙️ CLI Usage

```bash
python main.py init regex [--force]

# Render the skill framework
python main.py render regex skill-framework --topic "Regular Expressions with Bash"

# Render the other artifacts
python main.py render regex \
   practice-questions \
   --topic "Regular Expressions with Bash" \
   --mcp-context ../work/regex/mcp-context.json

python main.py render lab-environment \
   practice-questions \
   --topic "Regular Expressions with Bash" \
   --mcp-context ../work/regex/mcp-context.json

python main.py render <slug> lab-environment --topic "<Topic Name>"
python main.py render regex skill-verifier --topic "Regular Expressions with Bash" --mcp-context=../work/regex.json
python main.py render <slug> prep-guide --topic "<Topic Name>"
```

# Document Samples

Here are examples of the templates for each artifact. These can also be found in the `artifacts/ directory` but are repeated here to make it easy to paste this entire README into chatgpt.

## Skill Framework

```
**Topic:** {{metadata.display_topic}}

**Goal:** Create a structured skill framework for the topic that is:

- Organized into **five progressive levels**: Exploring, Applying, Building, Advancing, Innovating.
- Uses **Bloom’s Taxonomy verbs** appropriate for each level.
- Includes **7–13 skills per level** (except Innovating).
- Skips overly **niche/rare skills** — focus on broadly useful, practical competencies.
- Written for a **professional/enterprise context**.


FORMAT ALL RESULTS AS MARKDOWN.

---

### Level 1 – Exploring

_Focus: learn the basics and build foundational understanding._

- Use verbs like **Identify, Define, Describe, Recognize, Recall, List, Explain.**
- Skills should involve **introductory concepts, definitions, and recognition tasks.**

### Level 2 – Applying

_Focus: use foundational knowledge in real scenarios with guidance._

- Use verbs like **Apply, Demonstrate, Execute, Use, Implement, Perform, Illustrate.**
- Skills should show the learner can **perform tasks with guidance or in familiar contexts.**

### Level 3 – Building

_Focus: deliver projects independently and solve real problems._

- Use verbs like **Develop, Construct, Organize, Design, Produce, Solve, Modify, Present.**
- Skills should represent **autonomy in task execution and integration of concepts.**

### Level 4 – Advancing

_Focus: optimize, integrate, and analyze in complex environments._

- Use verbs like **Analyze, Evaluate, Optimize, Integrate, Compare, Critique, Adapt, Lead.**
- Skills should capture **advanced efficiency, integration, and leadership.**

### Level 5 – Innovating

_Focus: establish best practices, create new solutions, and mentor others._

- Use verbs like **Invent, Create, Formulate, Innovate, Mentor, Establish, Define Standards, Propose, Lead Development.**
- Skills should reflect **thought leadership, innovation, and mentoring.**
- 5–10 skills are sufficient.

---

## 📌 Fully Fleshed-Out Example (Regex, Level 1)

**Topic:** Regular Expressions

**Level 1 – Exploring**

- Identify what regular expressions are and their role in text search and manipulation.
- Describe the difference between literal characters and metacharacters.
- Recognize common regex metacharacters: `.`, `*`, `+`, `?`.
- List character classes such as `[a-z]`, `\d`, `\w`, and `\s`.
- Explain the purpose of anchors: `^` (start of string), `$` (end of string).
- Recall the concept of grouping with parentheses `()`.
- Recognize alternation with the `|` operator.
- Describe the difference between greedy and lazy quantifiers.
- Identify typical use cases: searching logs, validating simple strings, filtering text in CLI tools like `grep`.

👉 This shows the expected **detail, granularity, and phrasing**. Other levels should match this level of depth.

---

## Verification Notes (Optional)

The current MCP toolset typically supports:

- Running **shell commands** (e.g., `git`, `sqlite3`, `jq`, `ls`).
- Reading, writing, and editing **files**.
- Inspecting **directory trees** and file metadata.

Implications:

- **Level 1–3 skills** are usually verifiable (state changes, query outputs, file contents).
- **Level 4 skills** are often verifiable, but may need setup (bisect logs, EXPLAIN plans, hook scripts).
- **Level 5 skills** are generally reflective (team standards, mentoring) and not auto-checkable.

```

## Skill Verifier

````
# 🔎 Skill Verifier

The Skill Verifier connects the **Skill Framework** (what to learn) with the **MCP toolset** (what can be programmatically checked).

---

## Purpose

- Identify which skills are auto-verifiable, which require scaffolding, which suit knowledge checks, and which require manual review
- Define the fixtures (repos, datasets, files) needed for each skill
- Suggest probes (commands, queries, inspections)
- Establish pass/fail criteria and reset conditions
- Ensure results are consistent with a standard schema

---

## Skill Framework Link

{{skill_framework}}

---

## MCP Context

Here are some of the MCP tools available. Consider how you would use them when making your response:

{{mcp_context}}

---

## Result Record Schema

```json
{
  "status": "PASS|FAIL",
  "skill": "<skill text>",
  "observations": "<string or list>",
  "evidence": { "stdout": "<captured output>", "stderr": "", "files": [] },
  "hints": ["<remediation suggestions>"]
}
````

---

## Skills & Verification Map

### Level 1 – Exploring

**Skill:** [paste skill]

- Initial feasibility: [auto-verifiable | scaffolding | knowledge check | manual review]
- Verification mode: [lab probe | knowledge check | manual review]
- Required fixtures: [repo/db/file]
- Suggested probes: [shell commands, file reads]
- Knowledge check example (if relevant):  
  Q: …  
  A: …
- Pass/Fail criteria: …
- Reset required: [true/false]
- Notes: …

---

Repeat for all skills, across all levels.

```

## Practice Questions

```

# 📝 Practice Questions

The Practice Questions are a structured set of **knowledge checks** linked to the **Skill Framework**.  
It supports multiple question types and can be reused across labs, quizzes, or courses.

---

## Purpose

- Provide a question bank aligned directly to skills
- Support multiple formats: MCQ, True/False, Short Answer
- Document correct answers, distractors, and hints for remediation
- Ensure consistency and reusability

---

## Skill Framework Link

{{skill_framework}}

---

## MCP Context

Here are some of the MCP tools available. Consider how you would use them when making your response:

{{mcp_context}}

---

## Question Record Schema (Markdown)

- **Skill:** Exact text from Skill Framework
- **Question:** The learner-facing prompt
- **Type:** MCQ | True/False | Short Answer
- **Options (if MCQ):** A, B, C, …
- **Correct Answer:** …
- **Explanation:** Why correct is correct, why others are not
- **Hints:** Tips, recall aids, or lab references
- **Difficulty:** 1–3
- **Target Level:** Defaults to Level 1

---

## Example

**Skill:** Identify the role of a primary key in a database

**Question (MCQ):** What does a primary key do?  
A) Enforces uniqueness of rows  
B) Stores row creation date  
C) Links the table to a foreign schema  
D) Defines row order

**Correct Answer:** A  
**Explanation:** A primary key uniquely identifies each row.  
**Hints:** Keys = uniqueness.

```

## Lab Environment

```

# 🧪 Lab Environment Blueprint (LEB)

The Lab Environment Blueprint defines the **practical environment** that learners interact with when working on skills in the framework.
It translates requirements from the **Verification Capability Map (VCM)** into concrete setup instructions (fixtures, datasets, repos, scripts).

Its purpose is to:

- Document the **fixtures** required (repositories, datasets, configuration files).
- Specify the **bootstrap process** for creating the lab environment.
- Define how the environment can be **reset/cleaned** between attempts.
- Keep labs **lightweight and reproducible** (size and runtime constraints).
- Ensure verifiers have a known starting point to run probes consistently.
- **Generate runnable scripts (`bootstrap.sh`, `reset.sh`, `verify.sh`) and a `Makefile`.**
- **Bundle everything into a downloadable ZIP with a README.md.**

---

## Skill Framework Link

{{skill_framework}}

---

## Environment Context

- **OS base image:** \[e.g., Linux, Ubuntu 22.04]
- **Available commands/tools:** \[git, sqlite3, jq, ls, etc.]
- **Network access:** \[true/false; describe if limited]
- **Timeouts:** \[default execution time, e.g., 30s]
- **Size/runtime guidelines:** \[e.g., repos ≤ 5 MB, DB ≤ 5000 rows, setup ≤ 20s]
- **Reset strategy:** \[docker reset, script cleanup, fixture re-seed]

---

## Fixtures

List all required inputs the learner needs:

- **Repositories:**

  - Name: \[repo name]
  - Structure: \[branches, commits, tags seeded]
  - Size: \[small/medium/large]
  - Notes: \[special setup, e.g., merge conflicts pre-seeded]

- **Datasets/Files:**

  - Path: \[file path]
  - Format: \[JSON, CSV, SQL]
  - Size: \[rows, KB]
  - Notes: \[intended use, e.g., “used for SELECT queries”]

- **Configuration files:**

  - Path: \[e.g., .gitignore, .gitattributes]
  - Seed contents: \[summary or link to snippet]

---

## Bootstrap Process

- **Setup script path:** `bootstrap.sh`

- **Steps performed:**

  1. Create directory structure
  2. Initialize repo / seed DB / copy files
  3. Install dependencies (if needed)
  4. Verify setup integrity (sanity checks)

- **Expected runtime:** \[in seconds]

- **Verification of success:** \[command(s) or checks to confirm ready state]

---

## Reset / Cleanup Strategy

- **Reset script path:** `reset.sh`

- **Steps performed:**

  1. Clear learner changes
  2. Restore fixtures to baseline
  3. Verify integrity of reset state

- **Expected runtime:** \[in seconds]

---

## Verification Strategy

- **Verification script path:** `verify.sh`
- **Checks performed:**

  - Ensure seeded branches, tags, commits exist.
  - Run tests if fixtures include code.
  - Confirm repo/file integrity after bootstrap/reset.

---

## Orchestration

- **Makefile** included with the following targets:

  - `make up` → bootstrap labs
  - `make verify` → run verification
  - `make reset` → wipe + rebuild baseline
  - `make clean` → remove lab directory only
  - `make reup` → clean + bootstrap
  - `make show` → list workspace contents
  - `make help` → show help text

---

## Packaging

- **README.md** auto-generated with usage guide:

  - Setup instructions
  - Quick-start commands (`make up`, `make verify`, `make reset`)
  - Makefile command reference
  - Troubleshooting notes

- **ZIP archive** (`lab-starter.zip`) includes:

  - `bootstrap.sh`
  - `reset.sh`
  - `verify.sh`
  - `Makefile`
  - `README.md`

Learners can download the zip, extract, and immediately run:

```bash
make up
make verify
```

---

## Default README.md (auto-included in ZIP)

````markdown
# 📘 Lab Starter Environment

This bundle contains everything you need to spin up and reset a self-contained lab environment for practicing skills from the **{{skill_framework}}**.

---

## 🚀 Quick Start

1. Extract the ZIP archive:
   ```bash
   unzip lab-starter.zip
   cd lab-starter
   ```
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

- `bootstrap.sh` → Seeds all fixtures (repos, files, configs).
- `reset.sh` → Wipes learner changes and rebuilds baseline.
- `verify.sh` → Runs sanity checks (branches, commits, tags, tests).
- `Makefile` → Convenience targets (`up`, `verify`, `reset`, `clean`, `reup`, `show`).
- `README.md` → This usage guide.

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

- **OS base image:** Ubuntu 22.04 (recommended)
- **Tools required:** `git` (≥2.34), `make`, `bash`
- **Optional tools:** `jq`, `sqlite3` (depending on fixtures)
- **Default workspace:** `./labs` (overridable with `LAB_ROOT=/path make up`)

---

## 🧹 Resetting & Cleaning

- `make reset` → Full reset (wipes and re-runs bootstrap).
- `make clean` → Deletes the labs directory only.
- `make reup` → Equivalent to `make clean` + `make up`.

---

## 🧪 Verification

The verification script checks:

- Correct branches, commits, and tags exist.
- Repo state matches baseline (no missing fixtures).
- Optional tests run successfully (e.g., `git bisect` finds seeded bug).

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


```

## Prep Guide

```
# 👩‍🏫 Prep Guide

The Prep Guide helps learners **prepare for verification** using variations of the same skills, without reusing the exact probes.

---

## Purpose

- Make an initial assessment of learner level
- Guide toward the right skills from the Skill Framework
- Provide practice exercises that differ in surface form from verification
- Build familiarity with the Lab Environment
- Encourage reflection and self-assessment

---

## Skill Framework Link

{{skill_framework}}

---

## MCP Context

Here are some of the MCP tools available. Consider how you would use them when making your response:

{{mcp_context}}

---

## 1. Assessment Phase

- Background questions: learner’s experience, frequency of use, recency
- Knowledge Bank warm-ups: varied phrasings
- Scenario probe: “Imagine you needed to … what steps would you take?”
- Outcome: learner placed in a tentative level band

---

## 2. Prep Strategy by Level

- **Exploring / Applying:** core concepts, guided walkthroughs, compare outputs
- **Building / Advancing:** scenario drills, modified probes, predict outcomes before running
- **Innovating:** mentor others, propose workflows, critique processes

---

## 3. Design Rules

- Do **not** reuse Skill Verifier probes
- Cover the same skills, but with different surface tasks
- Use Lab Environment fixtures with variations (filenames, branch names, data)
- End with reflection prompts: “What did you learn? What feels uncertain?”

---

## 4. Instructor Flow

1. Background + warm-ups
2. Place learner at a level
3. Select prep path
4. Run varied practice in Lab Environment
5. Reflection + confidence check
6. Next steps (reading, peer discussion, reset lab)

```
