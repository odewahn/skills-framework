# 🔎 Skill Verifier — Regular Expressions with Bash

## Skills & Verification Map

### Level 1 – Exploring

---

**Skill:** Identify what regular expressions are and their purpose in Bash text processing.

- Initial feasibility: **knowledge check**
- Verification mode: **knowledge check**
- Required fixtures: none
- Suggested probes: N/A
- Knowledge check example:
  Q: What is the main purpose of regular expressions in Bash?
  A: To define text-matching patterns for searching, filtering, and transforming text.
- Pass/Fail criteria: Correct conceptual answer.
- Reset required: false
- Notes: Not suited to automation; must be recall-level.

---

**Skill:** Define the difference between literal characters and regex metacharacters.

- Initial feasibility: **knowledge check**
- Verification mode: **knowledge check**
- Required fixtures: none
- Suggested probes: N/A
- Knowledge check example:
  Q: Which of these is a literal and which is a regex metacharacter: `.` , `a` ?
  A: `.` is a metacharacter (match any char); `a` is a literal.
- Pass/Fail criteria: Correct distinction.
- Reset required: false
- Notes: Conceptual recognition only.

---

**Skill:** Recognize common metacharacters: `.`, `*`, `+`, `?`.

- Initial feasibility: **knowledge check**
- Verification mode: **knowledge check**
- Required fixtures: sample question set
- Suggested probes: none
- Knowledge check example:
  Q: What does the regex `a*` match?
  A: Zero or more `a` characters.
- Pass/Fail criteria: Correct explanation.
- Reset required: false
- Notes: Pure recall/recognition.

---

**Skill:** List common shorthand character classes: `\d`, `\w`, `\s`.

- Initial feasibility: **knowledge check**
- Verification mode: **knowledge check**
- Required fixtures: none
- Suggested probes: N/A
- Knowledge check example:
  Q: What does `\s` match in regex?
  A: Whitespace (spaces, tabs, newlines).
- Pass/Fail criteria: Correct association.
- Reset required: false
- Notes: Basic vocabulary.

---

**Skill:** Describe explicit character classes: `[abc]`, `[a-z]`, `[^0-9]`.

- Initial feasibility: **knowledge check**
- Verification mode: **knowledge check**
- Required fixtures: none
- Suggested probes: N/A
- Knowledge check example:
  Q: What does `[^0-9]` match?
  A: Any character that is not a digit.
- Pass/Fail criteria: Correct description.
- Reset required: false
- Notes: Good for recognition-type quizzes.

---

**Skill:** Explain the role of anchors: `^` (start of line), `$` (end of line).

- Initial feasibility: **lab probe** (with simple fixture)
- Verification mode: **lab probe**
- Required fixtures: `sample.txt` with mixed lines (some start with “INFO”, some end with “ERROR”).
- Suggested probes:

  ```bash
  grep '^INFO' sample.txt
  grep 'ERROR$' sample.txt
  ```

- Pass/Fail criteria: Output contains only correctly anchored matches.
- Reset required: true (fixture restored between runs).
- Notes: First “hands-on” probe at this level.

---

**Skill:** Recall the syntax for grouping `()`, alternation `|`, and escaping `\`.

- Initial feasibility: **knowledge check**
- Verification mode: **knowledge check**
- Required fixtures: none
- Suggested probes: N/A
- Knowledge check example:
  Q: Which regex matches either “cat” or “dog”?
  A: `(cat|dog)`
- Pass/Fail criteria: Correct example given.
- Reset required: false

---

**Skill:** Recognize the difference between basic regex (BRE) and extended regex (ERE).

- Initial feasibility: **knowledge check**
- Verification mode: **knowledge check**
- Required fixtures: none
- Suggested probes: N/A
- Knowledge check example:
  Q: Which command uses ERE syntax?
  A: `grep -E` or `egrep`.
- Pass/Fail criteria: Correct distinction.
- Reset required: false

---

**Skill:** Identify typical tools in Bash that support regex: `grep`, `egrep`, `sed`, `awk`.

- Initial feasibility: **knowledge check**
- Verification mode: **knowledge check**
- Required fixtures: none
- Suggested probes: N/A
- Knowledge check example:
  Q: Which of the following Bash tools natively supports regex: `cut`, `sed`, `ls`, `awk`?
  A: `sed`, `awk`.
- Pass/Fail criteria: Correct identification.
- Reset required: false

---

**Skill:** Explain the concept of greedy vs. non-greedy quantifiers.

- Initial feasibility: **knowledge check**
- Verification mode: **knowledge check**
- Required fixtures: none
- Suggested probes: N/A
- Knowledge check example:
  Q: In the regex `".*"` what does the `*` do by default?
  A: It matches greedily — as much as possible until the last quote.
- Pass/Fail criteria: Correct explanation.
- Reset required: false
- Notes: Conceptual only (PCRE has explicit `?` non-greedy, but not standard BRE/ERE).

Awesome — here’s the **complete Skill Verifier** for _Regular Expressions with Bash_, covering **all levels (1–5)**. I’ve kept each entry compact but complete so you can plug this straight into your system.

---

# 🔎 Skill Verifier — Regular Expressions with Bash

Connects the **Skill Framework** (“what to learn”) with the **MCP toolset** (“what can be checked”).

**MCP tools assumed (from your list):**

- `shell_execute` (allowed commands: `grep`, `sed`, `awk`)
- `read_text_file`, `read_multiple_files`, `list_directory`, `create_directory`, `write_file`, `edit_file`, `move_file`, `search_files`, `get_file_info`, `directory_tree`

**Result Record Schema (unchanged):**

```json
{
  "status": "PASS|FAIL",
  "skill": "<skill text>",
  "observations": "<string or list>",
  "evidence": { "stdout": "<captured output>", "stderr": "", "files": [] },
  "hints": ["<remediation suggestions>"]
}
```

---

## Shared Fixtures (used across entries to avoid repetition)

- `fixtures/sample.txt` — mixed lines: “INFO …”, “… ERROR”, emails, IPs, dates, tags, etc.
- `fixtures/logs/app.log` — multi-level logs (INFO/WARN/ERROR), timestamps, request IDs.
- `fixtures/data.csv` — CSV with headers, mixed numeric/text fields, some malformed rows.
- `fixtures/html/snippets.html` — tiny HTML fragments to test tag extraction.
- `fixtures/utf8/multilang.txt` — UTF-8 text with accents and non-ASCII.
- `workspace/` — scratch folder; verifiers should never edit `fixtures/` directly.

**Reset condition:** Re-copy pristine `fixtures/` into a temp working dir or ensure probes are read-only. Any probe that writes to `workspace/` sets `Reset required: true`.

---

## Level 1 – Exploring (Complete)

> You already approved this structure. Repeating here in compressed form so the file is self-contained.

1. **Identify what regular expressions are and their purpose in Bash**

- Feasibility: knowledge check | Mode: knowledge check | Fixtures: none
- Example Q/A: Purpose: text pattern matching for search/filter/transform.
- Pass/Fail: correct concept | Reset: false

2. **Literal vs metacharacters** — KC | KC | none

- Q: Which is a metachar: `.` vs `a`? A: `.` | Reset: false

3. **Recognize `. * + ?`** — KC | KC | none

- Q: `a*` matches? A: zero or more `a` | Reset: false

4. **Shorthand classes `\d \w \s`** — KC | KC | none

- Q: `\s`? A: whitespace | Reset: false

5. **Explicit classes `[abc] [a-z] [^0-9]`** — KC | KC | none

- Q: `[^0-9]`? A: non-digit | Reset: false

6. **Anchors `^` `$`** — Feasibility: auto-verifiable | Mode: lab probe

- Fixtures: `fixtures/sample.txt`
- Probes:

  - `grep '^INFO' fixtures/sample.txt`
  - `grep 'ERROR$' fixtures/sample.txt`

- Pass/Fail: only properly anchored lines returned | Reset: true

7. **Grouping `()` alternation `|` escaping `\`** — KC | KC | none

- Q: Match cat or dog? A: `(cat|dog)` | Reset: false

8. **BRE vs ERE** — KC | KC | none

- Q: Which uses ERE? A: `grep -E`/`egrep` | Reset: false

9. **Regex-capable tools** — KC | KC | none

- Q: Which support regex: `cut`, `sed`, `ls`, `awk`? A: `sed`, `awk` | Reset: false

10. **Greedy vs non-greedy** — KC | KC | none

- Q: In `".*"`, `*` is? A: greedy | Reset: false
- Note: non-greedy `*?` requires PCRE (`grep -P`) and is not standard BRE/ERE.

---

## Level 2 – Applying

1. **Use `grep` with simple patterns to search logs**

- Feasibility: auto-verifiable | Mode: lab probe
- Fixtures: `fixtures/logs/app.log`
- Probe: `grep -n 'ERROR' fixtures/logs/app.log`
- Pass/Fail: non-empty matches with correct line numbers; `stderr` empty
- Reset: false | Notes: Accept `grep -E` equally.

2. **Apply character classes `[0-9]` on streams**

- Auto-verifiable | lab probe
- Fixtures: `fixtures/sample.txt`
- Probe: `grep -E 'ID:[[:space:]]*[0-9]{3,}' fixtures/sample.txt`
- Pass/Fail: lines containing `ID: <3+ digits>` only | Reset: false

3. **Demonstrate anchors to filter start/end**

- Auto-verifiable | lab probe
- Fixtures: `fixtures/logs/app.log`
- Probe:

  - `grep -E '^[A-Z]{4,}\>' fixtures/logs/app.log` (level at start)
  - `grep -E 'timeout$' fixtures/logs/app.log`

- Pass/Fail: outputs adhere to anchor semantics | Reset: false

4. **Implement grouping/alternation in `grep -E`**

- Auto-verifiable | lab probe
- Fixtures: `fixtures/logs/app.log`
- Probe: `grep -E 'INFO|WARN' fixtures/logs/app.log | wc -l` and compare vs known count
- Pass/Fail: count equals expected (provide `expected.txt`) | Reset: false

5. **Simple substitutions with `sed`**

- Auto-verifiable | lab probe
- Fixtures: `fixtures/sample.txt` → output to `workspace/out.txt`
- Probe: `sed 's/foo/bar/g' fixtures/sample.txt > workspace/out.txt`
- Pass/Fail: `grep -q 'foo' workspace/out.txt` returns no matches; `grep -q 'bar'` returns some
- Reset: true

6. **Differentiate `grep -E` vs `grep -F`**

- Knowledge+probe | mixed
- Probe A (KC): Q: Which treats pattern literally? A: `grep -F`
- Probe B (lab):

  - `echo 'a.b' | grep -E 'a.b'` → matches multiple chars
  - `echo 'a.b' | grep -F 'a.b'` → matches literal dot

- Pass/Fail: learner explains/ demonstrates difference in outputs | Reset: false

7. **Regex in `awk` with `~`**

- Auto-verifiable | lab probe
- Fixtures: `fixtures/data.csv`
- Probe: `awk '$0 ~ /,ERROR,/' fixtures/data.csv`
- Pass/Fail: only rows with `,ERROR,` printed | Reset: false

8. **Use quantifiers `* + ?` to capture repeats**

- Auto-verifiable | lab probe
- Fixtures: `fixtures/logs/app.log`
- Probe: `grep -E 'E+RR+OR+' fixtures/logs/app.log` (intentionally permissive)
- Pass/Fail: still returns only ERROR lines (no false positives) | Reset: false
- Notes: Discuss over-permissive patterns in hints.

9. **Apply escaping for special chars**

- Auto-verifiable | lab probe
- Fixtures: `fixtures/sample.txt` with dotted domains
- Probe: `grep -E '\.' fixtures/sample.txt` AND `grep -F '.' fixtures/sample.txt` (contrast)
- Pass/Fail: escaped dot matches literal dots; explain difference vs `.` | Reset: false

10. **Combine multiple concepts in one expression**

- Auto-verifiable | lab probe
- Fixtures: `fixtures/logs/app.log`
- Probe: `grep -E '^(INFO|WARN).*(user|acct)[0-9]{2}$' fixtures/logs/app.log`
- Pass/Fail: Only lines with level at start, a user/acct token, and two trailing digits at end | Reset: false

---

## Level 3 – Building

1. **Construct regex to validate structured input (emails, IPs, dates)**

- Auto-verifiable | lab probe
- Fixtures: `fixtures/sample.txt` (contains valid/invalid samples), `fixtures/expected/emails.valid`, `.invalid`
- Probe (email example):

  - `grep -E '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' fixtures/sample.txt > workspace/emails.txt`

- Pass/Fail: `diff -u fixtures/expected/emails.valid workspace/emails.txt` is empty
- Reset: true | Notes: ERE limitations acknowledged (no full RFC).

2. **Develop complex log filters using `grep|awk|sed` pipelines**

- Auto-verifiable | lab probe
- Fixtures: `fixtures/logs/app.log`, `fixtures/expected/filtered.log`
- Probe:

  ```bash
  grep -E '^(ERROR|WARN)' fixtures/logs/app.log \
  | awk '$0 ~ /timeout|retry/' \
  | sed -E 's/[[:space:]]+/ /g' > workspace/filtered.log
  ```

- Pass/Fail: `diff -u fixtures/expected/filtered.log workspace/filtered.log` empty
- Reset: true

3. **Organize regex usage into reusable Bash scripts**

- Scaffolding (file authoring) + auto-verifiable run
- Fixtures: template script `fixtures/scripts/filter.sh` (TODO markers)
- Probe: Run `bash fixtures/scripts/filter.sh fixtures/logs/app.log > workspace/out.log`
- Pass/Fail: Output matches `fixtures/expected/filter.out` | Reset: true
- Notes: Verify only behavior, not style.

4. **Data cleaning with `sed` substitutions**

- Auto-verifiable | lab probe
- Fixtures: `fixtures/data.csv`, `fixtures/expected/clean.csv`
- Probe: normalizing delimiters, trimming spaces:
  `sed -E 's/[[:space:]]*,[[:space:]]*/,/g; s/^[[:space:]]+|[[:space:]]+$//g' fixtures/data.csv > workspace/clean.csv`
- Pass/Fail: `diff -u fixtures/expected/clean.csv workspace/clean.csv` empty
- Reset: true

5. **Capture subgroups and backreferences in `sed`/`awk`**

- Auto-verifiable | lab probe
- Fixtures: `fixtures/sample.txt`, `fixtures/expected/swap.out`
- Probe (swap `Last, First` → `First Last`):
  `sed -E 's/^([A-Za-z]+),[[:space:]]*([A-Za-z]+)/\2 \1/' fixtures/sample.txt > workspace/swap.out`
- Pass/Fail: exact match to expected | Reset: true

6. **Modify regex to adapt to new requirements**

- Auto-verifiable | lab probe
- Fixtures: `fixtures/sample.txt`, `fixtures/expected/update.v1`, `.v2`
- Probe: run v1 then adjust to accept hyphenated names; compare to `.v2`
- Pass/Fail: final output equals `.v2`; include observations about change scope | Reset: true

7. **Regex-based extraction tasks (fields, stripping tags)**

- Auto-verifiable | lab probe
- Fixtures: `fixtures/html/snippets.html`, `fixtures/expected/links.txt`
- Probe (extract hrefs naïvely):
  `grep -Eo 'href="[^"]+"' fixtures/html/snippets.html | sed -E 's/^href="(.*)"/\1/' > workspace/links.txt`
- Pass/Fail: equals expected | Reset: true
- Note: teach limitations of regex for HTML.

8. **Integrate regex with `find`/`xargs` to batch-process files**

- Auto-verifiable | lab probe (no `find` allowed in `shell_execute`, so emulate via `search_files` + loop)
- Flow: `search_files` for `*.log` under `fixtures/logs/`, then `shell_execute` `grep -E` on each; concat outputs
- Pass/Fail: union equals `fixtures/expected/all_errors.txt` | Reset: true
- Notes: Uses MCP `search_files` to enumerate.

9. **Use `grep -o` to extract matches**

- Auto-verifiable | lab probe
- Fixtures: `fixtures/logs/app.log`, `fixtures/expected/request_ids.txt`
- Probe: `grep -Eo 'req-[A-Za-z0-9]{8}' fixtures/logs/app.log > workspace/request_ids.txt`
- Pass/Fail: exact match | Reset: true

10. **Build readable yet precise regexes for team scripts**

- Scaffolding + manual review (style) + probe (behavior)
- Fixtures: `fixtures/scripts/readable.sh`, `fixtures/expected/out.txt`
- Probe: execute script → compare output
- Pass/Fail: behavior must match expected; manual notes on clarity (naming via comments), give hints | Reset: true

---

## Level 4 – Advancing

1. **Analyze performance tradeoffs (avoid catastrophic backtracking)**

- Feasibility: manual review + experiment probe
- Fixtures: `fixtures/logs/big.log` (synthesized), `fixtures/patterns/slow.txt`, `fixtures/patterns/fast.txt`
- Probe: time both with `grep -E -n -e "$(cat slow.txt)"` vs `fast.txt` (use `/usr/bin/time -f '%U'` if allowed; else measure via multiple runs and line counts)
- Pass/Fail: identifies slower pattern; proposes equivalent faster ERE; shows reduced runtime/line counts
- Reset: false

2. **Evaluate readability vs complexity**

- Manual review + behavior probe
- Fixtures: two scripts with same output (`complex.sh`, `readable.sh`)
- Probe: run both; ensure identical outputs
- Pass/Fail: explains tradeoffs; recommends readable version with justification | Reset: false

3. **Integrate regex with advanced Bash workflows (`while read`, process substitution)**

- Auto-verifiable (behavior) | lab probe
- Fixtures: pipeline scripts; `fixtures/expected/stream.out`
- Probe: `bash fixtures/scripts/stream.sh fixtures/logs/app.log > workspace/stream.out`
- Pass/Fail: equals expected | Reset: true

4. **Optimize pipelines by combining regex with `cut`, `awk`, `jq`**

- Note: only `awk` allowed; emulate `cut/jq` logic in `awk`
- Auto-verifiable | lab probe
- Fixtures: `fixtures/logs/app.log`, `fixtures/expected/opt.out`
- Probe: `awk -F' ' '$1 ~ /^(INFO|ERROR)$/ {print $3}' fixtures/logs/app.log > workspace/opt.out`
- Pass/Fail: equals expected | Reset: true

5. **Compare BRE, ERE, PCRE features**

- Knowledge check + demonstrative probe (PCRE note only)
- Probe:

  - KC: Which flag enables ERE? A: `-E`
  - Demo: show that non-greedy `.*?` **does not** work in `grep -E`, and would require `grep -P` (not available here)

- Pass/Fail: correct distinctions articulated | Reset: false

6. **Adapt patterns for localization/encoding (UTF-8)**

- Auto-verifiable | lab probe
- Fixtures: `fixtures/utf8/multilang.txt`, `fixtures/expected/utf8.out`
- Probe: `grep -E 'Café|mañana|über' fixtures/utf8/multilang.txt > workspace/utf8.out`
- Pass/Fail: equals expected; no mojibake | Reset: true

7. **Lead debugging when patterns fail or overmatch**

- Manual review with guided probe
- Fixtures: `fixtures/bugs/overmatch.txt`, `fixtures/expected/fixed.out`
- Probe: learner proposes fix; run `grep -E '<their-pattern>'` to validate
- Pass/Fail: reduces false positives to match expected | Reset: true

8. **Critique team regexes for clarity/performance/correctness**

- Manual review
- Fixtures: `fixtures/review/cases.md` with snippets and data
- Pass/Fail: provides concrete, testable suggestions; at least one improved pattern validated by probe | Reset: false

9. **Extend regex scripts into ETL pipelines**

- Scaffolding + behavior probe
- Fixtures: `fixtures/etl/input/*.log`, expected aggregated CSV
- Probe: run provided `etl.sh` to transform into `workspace/etl.csv`; compare to expected
- Pass/Fail: exact match | Reset: true

---

## Level 5 – Innovating

1. **Invent enterprise-ready regex style guidelines for Bash**

- Feasibility: manual review
- Deliverable: `workspace/regex-style.md` with rules (naming, comments, tests, limits, perf guidance)
- Pass/Fail: covers readability, safety (no catastrophic patterns), testability; includes examples and anti-examples

2. **Create reusable Bash regex libraries/snippets**

- Scaffolding + behavior probe
- Deliverable: `workspace/lib/regex.sh` functions (`is_email`, `is_ipv4`, `extract_reqid`, etc.), `workspace/tests.sh`
- Probe: run `bash workspace/tests.sh` to print PASS/FAIL per case
- Pass/Fail: all tests PASS; clear function names/docs

3. **Propose best practices regex vs alternative parsing**

- Manual review (design doc) + micro-bench probe
- Deliverable: `workspace/regex-vs-tools.md`
- Probe: compare `awk` field extraction vs regex over same input; report lines/sec or runtime deltas
- Pass/Fail: balanced recommendations with evidence

4. **Mentor teammates on debugging/optimization**

- Manual review of a short “playbook” + demonstration
- Deliverable: `workspace/debug-playbook.md` + one improved pattern validated against fixture
- Pass/Fail: playbook is actionable; improved pattern passes probe

5. **Establish standards for testing & documenting regex**

- Manual review + behavior probe
- Deliverable: `workspace/regex-testing-standards.md` + `workspace/tests.sh` template
- Pass/Fail: includes test matrix (valid/invalid/edge), CI suggestions; sample tests pass

6. **Lead development of regex-heavy Bash utilities**

- Scaffolding + behavior probe
- Deliverable: `workspace/bin/logscan` (script), `workspace/README.md`, `workspace/examples/*`
- Probe: run `logscan fixtures/logs/app.log --errors-only > workspace/out.txt`; compare to expected
- Pass/Fail: feature parity with spec; outputs match; argument help present

7. **Formulate techniques to reduce production regex errors (suites/linters)**

- Manual review + demo
- Deliverable: `workspace/regex-quality.md` including: pre-commit checks (quick `grep -E -q` sanity), smoke datasets, timeout guidance
- Probe: run smoke test script on provided patterns; confirm results
- Pass/Fail: checks catch seeded bad pattern; doc explains remediation

---

## Notes on Implementation

- **Consistency:** For any “exact match” checks, include `fixtures/expected/*.txt` and verify with `diff -u`.
- **Non-destructive reads:** Prefer read-only probes; when writing, target `workspace/`.
- **Observations & Hints:**

  - Observations hold mismatched counts, sample false positives/negatives.
  - Hints point to narrowing classes, adding anchors, or using backreferences.

- **ERE vs PCRE:** Since your `shell_execute` allows only `grep/sed/awk` (no `-P` guarantee), non-greedy quantifiers are discussed but not required in probes.
