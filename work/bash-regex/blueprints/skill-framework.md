**Topic:** Regular expressions with bash

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