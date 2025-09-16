# 👩‍🏫 Prep Guide

The Prep Guide helps learners **prepare for verification** using variations of the same skills, without reusing the exact probes.

---

## Purpose

- Make an **initial assessment** of learner level
- Guide learners toward the right **skills from the Skill Framework**
- Provide **practice exercises** that differ in surface form from verification
- Build familiarity with the **Lab Environment**
- Encourage **reflection and self-assessment**

---

## Skill Framework Link

# 🧩 Skill Framework: Regular Expressions with Bash

(see detailed levels in the Skill Framework doc)

---

## 1. Assessment Phase

- **Background questions**

  - How often do you use regex in Bash?
  - What tools have you used (`grep`, `sed`, `awk`)?
  - Do you recall the difference between BRE and ERE?

- **Knowledge warm-ups** (phrasing variants of L1 skills)

  - “What’s the difference between a literal `.` and regex `.`?”
  - “What would `^` and `$` do if used in a pattern?”

- **Scenario probe**

  - “Imagine you need to find all lines in a log file that begin with a timestamp. What steps would you take?”

- **Outcome**: Learner is placed in a **tentative level band** (Exploring → Innovating)

---

## 2. Prep Strategy by Level

- **Exploring (L1)**

  - Walk through recognizing regex vs literal text in `grep`.
  - Compare metacharacter matches with plain strings (`.` vs `\.`).
  - Short guided tasks: “List all lines ending in `.sh` from a sample directory.”

- **Applying (L2)**

  - Drill variations: match numeric ranges with `[0-9]`, then with `\d`.
  - Show how `grep -E` and `grep -F` behave differently on the same input.
  - Predict the outcome before running the command.

- **Building (L3)**

  - Construct a regex to extract email-like strings from a text sample.
  - Modify a working regex to handle a new case (e.g., IPv6 vs IPv4).
  - Reflection prompt: “Was your pattern too broad or too narrow?”

- **Advancing (L4)**

  - Optimize an overly complex regex for readability and performance.
  - Compare `grep -P` vs `grep -E` on UTF-8 data.
  - Group critique: is this regex maintainable by teammates?

- **Innovating (L5)**

  - Draft a short style guideline for regex in Bash scripts.
  - Identify common failure modes in real-world regex usage (false positives/negatives).
  - Mentor peers: explain why one solution is more robust than another.

---

## 3. Design Rules

- Do **not reuse** Skill Verifier probes
- Cover the **same skills** with **different surface tasks**
- Use Lab Environment fixtures with **variations** (filenames, log snippets, input data)
- Always end with **reflection prompts**:

  - “What did you learn?”
  - “What feels uncertain?”
  - “How would you explain this to someone else?”

---

## 4. Instructor Flow

1. Run background + warm-ups
2. Place learner in a level band
3. Select prep path for that level
4. Run varied practice tasks in the Lab Environment
5. Guide reflection + confidence check
6. Assign next steps (reading, peer discussion, reset lab)
