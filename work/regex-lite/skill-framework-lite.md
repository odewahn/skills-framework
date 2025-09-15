# ⚡ Lite Skill Framework (80/20 Practitioner Focus)

**Topic:** Regular Expressions with Bash

**Goal:** Build practitioner fluency in the 20% of regex features that cover 80% of real-world usage, optimized for professional/enterprise contexts.

---

### Level 1 – Beginner

_Focus: understand the essentials and build a working foundation._

- Identify what a regular expression is and describe its purpose in text processing.
- Recognize the difference between **basic string matching** (globs, `*`, `?`) and regex.
- Define common regex operators: `.`, `*`, `+`, `?`, `^`, `$`.
- Execute simple matches using `grep` with a literal string.
- Recall the difference between **BRE** (basic) and **ERE** (extended) regex in Bash tools (`grep` vs `egrep`).
- Recognize character classes (`[abc]`, `[^abc]`, `[0-9]`).
- Execute searches using common shorthand classes (`\d`, `\w`, `\s`) where supported.
- Identify anchors (`^start`, `end$`) and apply them to simple matches.
- Describe the role of escape characters (`\.` vs `.`).

---

### Level 2 – Intermediate

_Focus: apply the core features in realistic scenarios and solve common problems independently._

- Apply grouping with parentheses `(...)` and use alternation `|`.
- Demonstrate extracting text using `grep -o`, `sed -E 's/...//'`, or `awk` with regex.
- Modify matches with quantifiers `{m,n}` to capture repeated patterns.
- Use shorthand and predefined classes in combination (`[A-Za-z0-9_]`, `\s+`).
- Implement regex in pipelines (`cat file | grep -E 'pattern' | cut ...`).
- Combine multiple regex features to match structured text (emails, dates, log entries).
- Troubleshoot why a regex fails (escaping issues, greediness, tool differences).
- Apply regex in `sed` substitutions (`s/old/new/`) with capture groups (`\1`, `\2`).
- Use `grep -v` or `sed` to exclude patterns.
- Recognize the limits of Bash’s regex vs. PCRE (e.g., `grep -P`).

---

### Level 3 – Strong-Intermediate

_Focus: extend, adapt, and streamline workflows for reliability and efficiency._

- Adapt regex for different Bash tools (`grep`, `egrep`, `sed`, `awk`, `[[ string =~ regex ]]`).
- Troubleshoot common pitfalls (greedy vs lazy matching, unintended escapes, locale/encoding issues).
- Refine regex for maintainability (use of comments with `grep -P -x` or verbose regex in scripts).
- Optimize pipelines by reducing unnecessary regex passes.
- Configure scripts to safely handle regex variables (quoting, escaping metacharacters).
- Evaluate when to apply regex vs. simpler string operators (`case`, `==`, globs).
- Adapt regex to enterprise contexts (log parsing, config cleanup, validation scripts).
- Troubleshoot multi-line or complex patterns using `grep -Pz` or `awk`.
- Refine substitutions for safety (avoid over-matching, test with representative data).
- Document regex clearly for team readability and future maintainers.
