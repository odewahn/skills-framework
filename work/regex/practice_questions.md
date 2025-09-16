# 📝 Practice Questions – Regular Expressions with Bash

### Level 1 – Exploring

---

**Skill:** Identify what regular expressions are and their purpose in Bash text processing
**Question (Short Answer):** What are regular expressions used for in Bash?
**Correct Answer:** They are patterns used to match, search, and manipulate text.
**Explanation:** Regex defines patterns for finding or transforming text; it’s not for arithmetic or system operations.
**Hints:** Think "search patterns for text."
**Difficulty:** 1
**Target Level:** Level 1

---

**Skill:** Define the difference between literal characters and regex metacharacters
**Question (MCQ):** Which of the following is a regex metacharacter?
A) a
B) b
C) \*
D) x
**Correct Answer:** C
**Explanation:** `*` is a metacharacter meaning "zero or more." Letters like `a`, `b`, `x` are literals.
**Hints:** Metacharacters are symbols with special meaning.
**Difficulty:** 1
**Target Level:** Level 1

---

**Skill:** Recognize common metacharacters: `.`, `*`, `+`, `?`
**Question (True/False):** The `.` metacharacter matches any single character except newline.
**Correct Answer:** True
**Explanation:** In most regex engines, `.` means "any character except newline."
**Hints:** Dot = wildcard.
**Difficulty:** 1
**Target Level:** Level 1

---

**Skill:** List common shorthand character classes: `\d`, `\w`, `\s`
**Question (MCQ):** Which shorthand matches whitespace (spaces, tabs)?
A) `\d`
B) `\w`
C) `\s`
D) `\n`
**Correct Answer:** C
**Explanation:** `\s` matches whitespace. `\d` matches digits, `\w` matches word chars, `\n` is just newline.
**Hints:** Think `s = space`.
**Difficulty:** 1
**Target Level:** Level 1

---

**Skill:** Describe explicit character classes: `[abc]`, `[a-z]`, `[^0-9]`
**Question (MCQ):** What does `[a-z]` match?
A) A literal string "a-z"
B) Any lowercase letter
C) Only the letters `a` or `z`
D) Numbers between 1 and 26
**Correct Answer:** B
**Explanation:** `[a-z]` matches any lowercase character from a to z.
**Hints:** Square brackets = set of allowed characters.
**Difficulty:** 1
**Target Level:** Level 1

---

**Skill:** Explain the role of anchors: `^` (start of line), `$` (end of line)
**Question (Short Answer):** What does the regex `^Error` match?
**Correct Answer:** Any line that begins with "Error".
**Explanation:** `^` anchors the match to the start of a line.
**Hints:** `^` = start, `$` = end.
**Difficulty:** 1
**Target Level:** Level 1

---

**Skill:** Recall the syntax for grouping `()`, alternation `|`, and escaping `\`
**Question (MCQ):** Which regex matches either "cat" or "dog"?
A) `(cat dog)`
B) `cat|dog`
C) `(cat|dog)`
D) `cat/dog`
**Correct Answer:** C
**Explanation:** `(cat|dog)` groups the alternation so either "cat" or "dog" is matched.
**Hints:** Parentheses + `|` = alternation.
**Difficulty:** 2
**Target Level:** Level 1

---

**Skill:** Recognize the difference between basic regex (BRE) and extended regex (ERE)
**Question (True/False):** In Bash, `grep` uses BRE by default, and `grep -E` enables ERE.
**Correct Answer:** True
**Explanation:** By default, `grep` uses BRE; `grep -E` (or `egrep`) enables extended regex.
**Hints:** Think "E = Extended".
**Difficulty:** 2
**Target Level:** Level 1

---

**Skill:** Identify typical tools in Bash that support regex: `grep`, `egrep`, `sed`, `awk`
**Question (MCQ):** Which tool is primarily used for stream editing with regex in Bash?
A) `grep`
B) `sed`
C) `awk`
D) `ls`
**Correct Answer:** B
**Explanation:** `sed` is the stream editor that applies regex substitutions; `grep` searches, `awk` processes fields, `ls` lists files.
**Hints:** Stream editor = sed.
**Difficulty:** 1
**Target Level:** Level 1

---

**Skill:** Explain the concept of greedy vs. non-greedy quantifiers
**Question (Short Answer):** What does it mean when a quantifier is greedy?
**Correct Answer:** It matches as much text as possible while still allowing the overall regex to succeed.
**Explanation:** Greedy quantifiers expand their match to the maximum; non-greedy (lazy) quantifiers match as little as possible.
**Hints:** Greedy = "grab more".
**Difficulty:** 2
**Target Level:** Level 1

# 📝 Practice Questions – Regular Expressions with Bash

## Level 2 – Applying

---

**Skill:** Use `grep` with simple regex patterns to search logs or text files
**Question (MCQ):** Which command shows all lines containing the word “ERROR” in `app.log`?
A) `grep ERROR app.log`
B) `sed 's/ERROR//' app.log`
C) `awk '/ERROR/' app.log`
D) `grep -F app.log ERROR`
**Correct Answer:** A
**Explanation:** `grep ERROR app.log` searches for "ERROR" in the file. `awk '/ERROR/' app.log` also works, but the canonical `grep` answer is A.
**Hints:** Default tool for searching = `grep`.
**Difficulty:** 1
**Target Level:** Level 2

---

**Skill:** Apply character classes to match ranges (e.g., `[0-9]`) in input streams
**Question (Short Answer):** What does `[0-9]` match?
**Correct Answer:** Any single digit between 0 and 9.
**Explanation:** `[0-9]` defines a numeric range in regex.
**Hints:** Think “0 through 9”.
**Difficulty:** 1
**Target Level:** Level 2

---

**Skill:** Demonstrate anchors to filter lines beginning or ending with certain text
**Question (MCQ):** Which command matches lines ending with `.log` in `files.txt`?
A) `grep '\.log' files.txt`
B) `grep '\.log$' files.txt`
C) `grep '^\.log' files.txt`
D) `grep 'log$' files.txt`
**Correct Answer:** B
**Explanation:** `$` anchors the regex to the end of the line.
**Hints:** `$` = end of line.
**Difficulty:** 2
**Target Level:** Level 2

---

**Skill:** Implement grouping `()` and alternation `|` in `grep -E` or `egrep`
**Question (MCQ):** Which command matches either "jpg" or "png" files in `list.txt`?
A) `grep -E '(jpg|png)' list.txt`
B) `grep 'jpg|png' list.txt`
C) `grep -F '(jpg|png)' list.txt`
D) `grep -E 'jpg/png' list.txt`
**Correct Answer:** A
**Explanation:** Extended regex requires `-E`; grouping + `|` handles alternation.
**Hints:** Use `-E` for alternation.
**Difficulty:** 2
**Target Level:** Level 2

---

**Skill:** Perform simple substitutions with `sed` using regex patterns
**Question (Short Answer):** What does `sed 's/foo/bar/' file.txt` do?
**Correct Answer:** Replaces the first occurrence of "foo" with "bar" on each line.
**Explanation:** `s/old/new/` is the substitution command.
**Hints:** `s = substitute`.
**Difficulty:** 1
**Target Level:** Level 2

---

**Skill:** Illustrate the difference between `grep -E` (extended) and `grep -F` (fixed)
**Question (True/False):** `grep -F` interprets regex metacharacters as normal characters.
**Correct Answer:** True
**Explanation:** `-F` means "fixed strings" (no regex interpretation).
**Hints:** F = Fixed.
**Difficulty:** 1
**Target Level:** Level 2

---

**Skill:** Execute regex searches within `awk` using the `~` operator
**Question (MCQ):** Which `awk` command prints lines where column 2 contains digits?
A) `awk '$2 ~ /[0-9]/ {print $0}' file`
B) `awk '$2 /[0-9]/ {print $0}' file`
C) `awk '$2 == [0-9] {print $0}' file`
D) `awk '/[0-9]/ {print $2}' file`
**Correct Answer:** A
**Explanation:** The `~` operator in `awk` checks if a field matches a regex.
**Hints:** `~` = matches regex.
**Difficulty:** 2
**Target Level:** Level 2

---

**Skill:** Use quantifiers (`*`, `+`, `?`) to capture repeated patterns
**Question (Short Answer):** What does `a+` match?
**Correct Answer:** One or more consecutive "a" characters.
**Explanation:** `+` requires at least one occurrence.
**Hints:** `* = 0+`, `+ = 1+`, `? = 0 or 1`.
**Difficulty:** 1
**Target Level:** Level 2

---

**Skill:** Apply escaping to handle special characters (e.g., `\.` to match a literal dot)
**Question (True/False):** To match a literal dot in regex, you must escape it with `\.`.
**Correct Answer:** True
**Explanation:** `.` normally means "any char," so `\.` is needed for a real dot.
**Hints:** Escape = backslash.
**Difficulty:** 1
**Target Level:** Level 2

---

**Skill:** Demonstrate combining multiple regex concepts in one search expression
**Question (MCQ):** Which regex matches lines starting with "User" followed by digits?
A) `^User\d+`
B) `User^\d+`
C) `User[0-9]*^`
D) `^\d+User`
**Correct Answer:** A
**Explanation:** `^` anchors start, `User` literal, `\d+` = one or more digits.
**Hints:** Start anchor goes first.
**Difficulty:** 2
**Target Level:** Level 2

---

## Level 3 – Building

---

**Skill:** Construct regex patterns to validate structured input (emails, IPs, dates)
**Question (MCQ):** Which regex roughly validates an email?
A) `[a-z]+@[a-z]+\.[a-z]+`
B) `.*@.*`
C) `.+@.+`
D) `[0-9]+@[0-9]+`
**Correct Answer:** A
**Explanation:** It requires letters before/after `@` and a `.` with letters after.
**Hints:** Look for `@` and `.` pattern.
**Difficulty:** 3
**Target Level:** Level 3

---

**Skill:** Develop complex search filters for log files using pipelines with `grep`, `awk`, `sed`
**Question (Short Answer):** Which pipeline shows all “ERROR” lines that also contain “timeout”?
**Correct Answer:** `grep ERROR logfile | grep timeout`
**Explanation:** Pipe results of one `grep` into another.
**Hints:** Combine multiple `grep`.
**Difficulty:** 2
**Target Level:** Level 3

---

**Skill:** Organize regex usage into Bash scripts for reusable text processing
**Question (True/False):** Bash scripts can include regex-based `grep` or `sed` commands for automation.
**Correct Answer:** True
**Explanation:** Scripts wrap regex commands for repeatable workflows.
**Hints:** Think reusability.
**Difficulty:** 1
**Target Level:** Level 3

---

**Skill:** Solve data-cleaning tasks with regex substitutions in `sed`
**Question (MCQ):** Which command removes all digits from `data.txt`?
A) `sed 's/[0-9]//g' data.txt`
B) `sed 's/\d//g' data.txt`
C) `sed 's/[a-z]//g' data.txt`
D) `grep -v '[0-9]' data.txt`
**Correct Answer:** A
**Explanation:** `[0-9]` matches digits, `g` = global replace.
**Hints:** Remove digits = match `[0-9]`.
**Difficulty:** 2
**Target Level:** Level 3

---

**Skill:** Produce regexes that capture subgroups and backreferences in `sed` and `awk`
**Question (Short Answer):** In `sed 's/\([0-9]\{3\}\)-\([0-9]\{4\}\)/\2-\1/'`, what does `\1` and `\2` refer to?
**Correct Answer:** `\1` is the first captured group (3 digits), `\2` is the second (4 digits).
**Explanation:** Parentheses group subpatterns; backreferences reuse them.
**Hints:** `\1` = first match.
**Difficulty:** 3
**Target Level:** Level 3

---

**Skill:** Modify existing regexes to adapt to new requirements without breaking functionality
**Question (True/False):** Changing `[0-9]` to `[0-9]+` makes the regex match multiple digits instead of just one.
**Correct Answer:** True
**Explanation:** `+` quantifier requires one or more digits.
**Hints:** Think quantity.
**Difficulty:** 2
**Target Level:** Level 3

---

**Skill:** Design regex-based extraction tasks (e.g., extracting fields, stripping tags)
**Question (MCQ):** Which command removes HTML tags from input?
A) `sed 's/<[^>]*>//g'`
B) `grep '<.*>'`
C) `awk '/<.*>/'`
D) `sed 's/>.*</g'`
**Correct Answer:** A
**Explanation:** `<[^>]*>` matches tags; substitution deletes them.
**Hints:** Look for `<>`.
**Difficulty:** 3
**Target Level:** Level 3

---

**Skill:** Integrate regex with `find` or `xargs` to filter and batch-process files
**Question (MCQ):** Which command finds `.txt` files and replaces “foo” with “bar” inside them?
A) `find . -name '*.txt' | xargs sed -i 's/foo/bar/g'`
B) `grep -R 'foo' *.txt`
C) `sed 's/foo/bar/' *.txt`
D) `awk '{gsub(/foo/,"bar")}' *.txt`
**Correct Answer:** A
**Explanation:** `find` locates files, `xargs` runs `sed` on them.
**Hints:** Think `find` + `xargs` for batch.
**Difficulty:** 3
**Target Level:** Level 3

---

**Skill:** Use `grep -o` to extract matches rather than whole lines
**Question (Short Answer):** What does `grep -o '[0-9]\+' file.txt` output?
**Correct Answer:** Only the digit sequences matched, not the full line.
**Explanation:** `-o` prints only the matching part.
**Hints:** `o = only match`.
**Difficulty:** 2
**Target Level:** Level 3

---

**Skill:** Build regexes that balance readability with precision for team scripts
**Question (True/False):** Readable regexes are generally better for team scripts, even if slightly longer.
**Correct Answer:** True
**Explanation:** Maintainability is key in collaborative work.
**Hints:** Think teamwork.
**Difficulty:** 1
**Target Level:** Level 3
