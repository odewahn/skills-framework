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
