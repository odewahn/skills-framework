# 📝 Knowledge Check Bank — Regular Expressions with Bash

---

## Level 1 – Beginner

**Skill:** Identify what regular expressions (regex) are and their purpose in Bash
**Question 1 (MCQ)**

- **Question:** What is the primary purpose of a regular expression in Bash?
- **Type:** MCQ
- **Options:**
  A) To store shell variables
  B) To define patterns for matching text
  C) To execute Bash scripts automatically
  D) To control file permissions
- **Correct Answer:** B
- **Explanation:** Regex defines patterns for matching text.
- **Hints:** Regex = "pattern language."

---

**Skill:** Recognize the difference between literal strings and regex patterns
**Question 2 (True/False)**

- **Question:** The string `grep "cat"` will only match the literal word `cat`, never `catalog`.
- **Type:** True/False
- **Correct Answer:** False
- **Explanation:** Regex matches substrings by default.
- **Hints:** Use `\bcat\b` to match whole words.

---

**Skill:** Recall the role of `grep` in regex usage
**Question 3 (MCQ)**

- **Question:** Which command finds lines containing digits in `data.txt`?
- **Type:** MCQ
- **Options:**
  A) `grep "[0-9]" data.txt`
  B) `grep "\d" data.txt`
  C) `grep number data.txt`
  D) `grep -num data.txt`
- **Correct Answer:** A
- **Explanation:** `[0-9]` is POSIX-compliant. `\d` works only in Perl regex mode.
- **Hints:** Think `[0-9]` for digits.

---

**Skill:** Describe the difference between basic and extended regex in Bash tools
**Question 4 (MCQ)**

- **Question:** Which option enables extended regex in `grep`?
- **Type:** MCQ
- **Options:**
  A) `-E`
  B) `-r`
  C) `-x`
  D) `-n`
- **Correct Answer:** A
- **Explanation:** `grep -E` (or `egrep`) enables extended regex.
- **Hints:** Extended = “E”.

---

**Skill:** Execute a simple regex with `grep`
**Question 5 (Short Answer)**

- **Question:** Write a command to find lines starting with `ERROR` in `logs.txt`.
- **Type:** Short Answer
- **Correct Answer:** `grep "^ERROR" logs.txt`
- **Explanation:** `^` anchors to the start of the line.
- **Hints:** Anchors: `^` (start), `$` (end).

---

## Level 2 – Intermediate

**Skill:** Apply character classes in regex
**Question 6 (MCQ)**

- **Question:** Which regex matches any lowercase vowel?
- **Type:** MCQ
- **Options:**
  A) `[aeiou]`
  B) `(aeiou)`
  C) `\v`
  D) `{aeiou}`
- **Correct Answer:** A
- **Explanation:** `[ ]` defines a character class.
- **Hints:** Square brackets = one character from the set.

---

**Skill:** Demonstrate use of anchors and wildcards
**Question 7 (MCQ)**

- **Question:** Which command matches lines that end with `.log`?
- **Type:** MCQ
- **Options:**
  A) `grep "\.log$" files.txt`
  B) `grep "^.log" files.txt`
  C) `grep "log." files.txt`
  D) `grep "[.]log" files.txt`
- **Correct Answer:** A
- **Explanation:** `\.log$` means literal `.log` at end of line.
- **Hints:** `$` = end, `\.` escapes dot.

---

**Skill:** Modify regex to troubleshoot missing matches
**Question 8 (True/False)**

- **Question:** The regex `grep ".*error.*"` will only match lowercase `error`.
- **Type:** True/False
- **Correct Answer:** True
- **Explanation:** Regex is case-sensitive unless you add `-i`.
- **Hints:** Add `-i` for case-insensitive search.

---

**Skill:** Use quantifiers for flexible matching
**Question 9 (MCQ)**

- **Question:** Which regex matches “go”, “goo”, and “gooo”?
- **Type:** MCQ
- **Options:**
  A) `go*`
  B) `go+`
  C) `g?o`
  D) `g{2}o`
- **Correct Answer:** B
- **Explanation:** `+` means one or more repetitions.
- **Hints:** `*` = 0+, `+` = 1+, `?` = 0 or 1.

---

**Skill:** Implement grouping with parentheses
**Question 10 (Short Answer)**

- **Question:** Write a regex to match either “cat” or “dog”.
- **Type:** Short Answer
- **Correct Answer:** `(cat|dog)`
- **Explanation:** `|` means OR inside parentheses.
- **Hints:** Think of regex as mini-logic statements.

---

## Level 3 – Strong-Intermediate

**Skill:** Adapt regex to different grep modes (basic, extended, Perl)
**Question 11 (MCQ)**

- **Question:** Which command enables Perl-compatible regex in `grep`?
- **Type:** MCQ
- **Options:**
  A) `grep -P`
  B) `grep -E`
  C) `grep -P -E`
  D) `grep -p`
- **Correct Answer:** A
- **Explanation:** `-P` enables PCRE, supporting `\d`, `\w`, etc.
- **Hints:** Perl = `P`.

---

**Skill:** Troubleshoot greedy vs. non-greedy matches
**Question 12 (MCQ)**

- **Question:** In regex, what does `.*?` mean?
- **Type:** MCQ
- **Options:**
  A) Match zero or more, as much as possible
  B) Match zero or more, as little as possible
  C) Match exactly one character
  D) Match until end of line
- **Correct Answer:** B
- **Explanation:** `.*?` is non-greedy; it matches minimally.
- **Hints:** `?` after quantifier = non-greedy.

---

**Skill:** Refine regex for readability and maintainability
**Question 13 (True/False)**

- **Question:** Using `[[:digit:]]` is more portable than `[0-9]`.
- **Type:** True/False
- **Correct Answer:** True
- **Explanation:** POSIX classes are more portable across locales.
- **Hints:** `[[:digit:]]`, `[[:alpha:]]`, `[[:space:]]`.

---

**Skill:** Optimize regex searches for large files
**Question 14 (MCQ)**

- **Question:** Which option makes `grep` stop after the first match per file?
- **Type:** MCQ
- **Options:**
  A) `-q`
  B) `-m1`
  C) `-n`
  D) `-l`
- **Correct Answer:** B
- **Explanation:** `-m1` stops after one match. `-q` silences output but still scans all.
- **Hints:** Use `-m` for max matches.

---

**Skill:** Evaluate when to use `sed` or `awk` instead of `grep`
**Question 15 (Short Answer)**

- **Question:** If you want to both match a pattern and replace it inline, which tool is more appropriate: `grep`, `sed`, or `awk`?
- **Type:** Short Answer
- **Correct Answer:** `sed`
- **Explanation:** `grep` only finds text; `sed` can search and replace. `awk` is for structured processing.
- **Hints:** Think: `grep = find`, `sed = replace`, `awk = process`.
