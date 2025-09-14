# 📚 Skill System Blueprint Stack

This stack defines the **end-to-end flow** of how skills are taught, prepared, and verified. Each document has a distinct role, and they link together.

---

## 1. 🧩 Skill Framework (SF)

**Purpose:** Defines _what_ learners should know/do.

- Progressive levels: Exploring → Applying → Building → Advancing → Innovating.
- Skills written with Bloom’s verbs, 7–13 per level.
- Professional/enterprise focus.

**Feeds into:**

- VCM (defines what can be verified)
- KCB (knowledge recall checks)
- LEB (fixtures for hands-on practice)
- PIB (chooses prep exercises aligned to level)

---

## 2. 🔎 Verification Capability Map (VCM)

**Purpose:** Defines _how_ to measure skills.

- Maps skills to verification methods (auto, manual, knowledge check).
- Lists probes (commands, file checks, dataset queries).
- Documents pass/fail criteria.
- Notes reset/reproducibility conditions.

**Feeds into:**

- LEB (what fixtures to prepare for verification)
- PIB (designs similar but distinct prep drills)

---

## 3. 📝 Knowledge Check Blueprint (KCB)

**Purpose:** Provides **reusable knowledge questions**.

- Question types: multiple choice, true/false, short answer.
- Each question tied directly to a skill in SF.
- Includes correct answers, distractors, and hints.

**Feeds into:**

- VCM (for verifiable recall checks)
- PIB (for warm-up questions that differ from verification set)

---

## 4. 🧪 Lab Environment Blueprint (LEB)

**Purpose:** Provides a **sandbox** for skill practice and verification.

- Defines fixtures: repos, datasets, configs.
- Provides scripts (`bootstrap.sh`, `reset.sh`, `verify.sh`).
- Orchestrates with `Makefile`.
- Packages into a distributable ZIP.

**Feeds into:**

- VCM (fixtures for auto-verification)
- PIB (prep activities inside the same environment, with variations)

---

## 5. 👩‍🏫 Preparation Instructor Blueprint (PIB)

**Purpose:** Guides learners in **preparing for verification**.

- Makes initial level assessment (background + varied KCB questions).
- Places learner into a skill level band (Exploring → Innovating).
- Assigns **distinct prep exercises** (different from verification, but aligned).
- Uses **LEB environment** with small variations.
- Encourages reflection and self-assessment.

**Feeds from:**

- SF (skills to target)
- VCM (skill areas to prepare, without reusing probes)
- KCB (sample questions, re-worded for practice)
- LEB (sandbox for prep labs)

---

# 🔄 How They Fit Together

1. **SF** = the map of skills.
2. **VCM** = the measuring system.
3. **KCB** = the quiz bank.
4. **LEB** = the sandbox environment.
5. **PIB** = the practice coach.

👉 Learner flow:

- Instructor (PIB) starts with warm-up questions (KCB) + background.
- Places learner on SF level.
- Recommends prep exercises (distinct from verification, but in LEB).
- When ready → learner takes verification using VCM in LEB.

---

# 📎 Cross-References in Docs

When publishing these blueprints together:

- At the end of **SF**, link to PIB: _“See Preparation Instructor Blueprint for how these skills are introduced and practiced before verification.”_
- In **VCM**, note: _“Preparation instructors use this map to design practice activities, but with varied probes.”_
- In **KCB**, note: _“Sample items may be adapted by instructors for warm-up assessment (see PIB).”_
- In **LEB**, note: _“Preparation instructors use the same environment with varied tasks (see PIB).”_
- In **PIB**, cross-link back: _“This document draws on SF, VCM, KCB, and LEB.”_

---

✅ This gives you a **5-document ecosystem**:

- SF = “what to learn”
- VCM = “how to test”
- KCB = “knowledge checks”
- LEB = “sandbox”
- PIB = “prep coach”

# 📚 Blueprint Terminology Crosswalk

This matrix shows how the blueprint terms we use map to established concepts in instructional design, assessment, and training.

| **Our Term**                              | **Closest Terms of Art**                                                                  | **Notes / Differences**                                                                   |
| ----------------------------------------- | ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| 🧩 Skill Framework (SF)                   | Learning objectives, competency frameworks, exam objective domains                        | Structured across 5 progressive levels (Exploring → Innovating); enterprise skill focus.  |
| 🔎 Verification Capability Map (VCM)      | Assessment blueprint, test specifications, performance task rubrics, probes/checks        | Tailored for hands-on skills; distinguishes auto-verifiable vs. manual vs. fixture-based. |
| 📝 Knowledge Check Blueprint (KCB)        | Item bank, knowledge checks, formative quizzes                                            | Each question links directly to skills; stored in Markdown for human + machine use.       |
| 🧪 Lab Environment Blueprint (LEB)        | Performance-based testing environments, practical labs/sandboxes, simulation environments | Codifies reproducibility (bootstrap/reset/verify/packaging); CI/CD-style orchestration.   |
| 👩‍🏫 Preparation Instructor Blueprint (PIB) | Study guides, formative assessments, tutoring scripts/instructor guides                   | Uses SF+VCM+KCB+LEB inputs; creates distinct practice exercises, not reused verification. |

# Usage

python main.py git skill-framework
python main.py git knowledge-check-verifier
python main.py git skill-framework-verifier --mcp-tools-fn=example-git-skill-mcp.json
python main.py git lab-environment-blueprint
