# 👩‍🏫 Preparation Instructor Blueprint (PIB)

The **Preparation Instructor Blueprint** defines how an instructor (human or AI-assisted) helps learners **prepare for verification** without exposing the actual verification items.

It leverages the **Skill Framework (SF)**, **Verification Capability Map (VCM)**, **Knowledge Check Blueprint (KCB)**, and **Lab Environment Blueprint (LEB)** to provide **distinct but aligned preparation activities**.

---

## Purpose

- Make a quick **initial assessment** of the learner’s current level.
- Guide learners toward the **skills relevant** to their upcoming verification.
- Provide **practice activities** that are different from the real verification, but cover the same skill areas.
- Build familiarity with the **lab environment (LEB)**.
- Encourage **reflection and self-assessment**.

---

## Skill Framework Link

# 🧩 Git Skill Framework

(See full Skill Framework for details. Levels 1–5: Exploring → Innovating.)

---

## 1. Assessment Phase

**Goal:** Estimate the learner’s starting level.

### Activities

- **Background questions:**

  - “How often do you use Git?”
  - “What problems have you solved with it before?”
  - “When did you last practice these skills?”

- **KCB warm-ups:**
  _Select 3–5 sample questions (reworded, alternative scenarios)._
  Example: Instead of “What does `git status` show?” → “Imagine you modified a file but didn’t commit it yet. Which command would reveal its state?”

- **Scenario probe:**
  Ask for an **approach**, not execution.
  Example: “You need to share your changes with a teammate on GitHub. What steps would you take?”

### Outcome

Instructor places learner into a **tentative level band** (Exploring, Applying, Building, Advancing, Innovating).

---

## 2. Preparation Strategy

### Level 1–2 (Exploring / Applying)

- Emphasize **core concepts** and guided practice.
- Use simple **KCB variants** to reinforce terminology.
- Run **step-by-step LEB walkthroughs** (`init`, `clone`, `status`, `add`, `commit`).
- Encourage comparing command outputs.

### Level 3–4 (Building / Advancing)

- Emphasize **applied problem solving**.
- Create **scenario-based drills** (different repos, altered filenames).
- Use **modified VCM probes**: same skill area, different context.
- Prompt **prediction before execution** (e.g., “What do you expect `git diff` to show here?”).

### Level 5 (Innovating)

- Focus on **strategy, coaching, and enterprise practices**.
- Have learners **teach back** a workflow.
- Pose **“what if” enterprise scenarios** (audit, repo migration, CI/CD integration).
- Encourage critique and redesign of workflows.

---

## 3. Practice Exercise Design Rules

- Must be **different in surface form** from verification (no reusing probes verbatim).
- Still aligned to the **same underlying skills** in the SF.
- Encourage **reasoning explanations**, not just commands.
- Use LEB fixtures, but with **variations** (different branch names, files, repo size).
- Conclude with **reflection prompts**:

  - “What did you learn here?”
  - “How will this help during verification?”

---

## 4. Instructor Flow

1. **Check-in:** background + warm-up questions.
2. **Level placement:** assign tentative level band.
3. **Prep path:** select SF-aligned activities for that level.
4. **Practice & reflect:** run exercises in LEB (with variations).
5. **Confidence check:** ask learner what they still feel unsure about.
6. **Next steps:** recommend reading, peer support, or a `make reset` in the LEB before verification.

---

## Example Alignment

- **Skill (SF):** Execute branching operations.
- **Verification (VCM):** Check branch exists with `git branch`.
- **Prep (PIB):**

  - Task: “Create two new branches (`feature/login`, `feature/logout`), switch between them, and describe how you confirmed the active branch.”
  - Variation: Names differ from VCM probes, but the **skill is the same**.
