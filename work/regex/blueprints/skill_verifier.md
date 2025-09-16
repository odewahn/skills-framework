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


---

## MCP Context

Here are some of the MCP tools available. Consider how you would use them when making your response:

[{'name': 'shell_execute', 'description': 'Execute a shell command\nAllowed commands: sed, awk, grep', 'input_schema': {'type': 'object', 'properties': {'command': {'type': 'array', 'items': {'type': 'string'}, 'description': 'Command and its arguments as array'}, 'stdin': {'type': 'string', 'description': 'Input to be passed to the command via stdin'}, 'directory': {'type': 'string', 'description': 'Working directory where the command will be executed'}, 'timeout': {'type': 'integer', 'description': 'Maximum execution time in seconds', 'minimum': 0}}, 'required': ['command', 'directory']}, 'server': 'List Files'}, {'name': 'read_file', 'description': 'Read the complete contents of a file as text. DEPRECATED: Use read_text_file instead.', 'input_schema': {'type': 'object', 'properties': {'path': {'type': 'string'}, 'tail': {'type': 'number', 'description': 'If provided, returns only the last N lines of the file'}, 'head': {'type': 'number', 'description': 'If provided, returns only the first N lines of the file'}}, 'required': ['path'], 'additionalProperties': False, '$schema': 'http://json-schema.org/draft-07/schema#'}, 'server': 'server-1757684952'}, {'name': 'read_text_file', 'description': "Read the complete contents of a file from the file system as text. Handles various text encodings and provides detailed error messages if the file cannot be read. Use this tool when you need to examine the contents of a single file. Use the 'head' parameter to read only the first N lines of a file, or the 'tail' parameter to read only the last N lines of a file. Operates on the file as text regardless of extension. Only works within allowed directories.", 'input_schema': {'type': 'object', 'properties': {'path': {'type': 'string'}, 'tail': {'type': 'number', 'description': 'If provided, returns only the last N lines of the file'}, 'head': {'type': 'number', 'description': 'If provided, returns only the first N lines of the file'}}, 'required': ['path'], 'additionalProperties': False, '$schema': 'http://json-schema.org/draft-07/schema#'}, 'server': 'server-1757684952'}, {'name': 'read_media_file', 'description': 'Read an image or audio file. Returns the base64 encoded data and MIME type. Only works within allowed directories.', 'input_schema': {'type': 'object', 'properties': {'path': {'type': 'string'}}, 'required': ['path'], 'additionalProperties': False, '$schema': 'http://json-schema.org/draft-07/schema#'}, 'server': 'server-1757684952'}, {'name': 'read_multiple_files', 'description': "Read the contents of multiple files simultaneously. This is more efficient than reading files one by one when you need to analyze or compare multiple files. Each file's content is returned with its path as a reference. Failed reads for individual files won't stop the entire operation. Only works within allowed directories.", 'input_schema': {'type': 'object', 'properties': {'paths': {'type': 'array', 'items': {'type': 'string'}}}, 'required': ['paths'], 'additionalProperties': False, '$schema': 'http://json-schema.org/draft-07/schema#'}, 'server': 'server-1757684952'}, {'name': 'write_file', 'description': 'Create a new file or completely overwrite an existing file with new content. Use with caution as it will overwrite existing files without warning. Handles text content with proper encoding. Only works within allowed directories.', 'input_schema': {'type': 'object', 'properties': {'path': {'type': 'string'}, 'content': {'type': 'string'}}, 'required': ['path', 'content'], 'additionalProperties': False, '$schema': 'http://json-schema.org/draft-07/schema#'}, 'server': 'server-1757684952'}, {'name': 'edit_file', 'description': 'Make line-based edits to a text file. Each edit replaces exact line sequences with new content. Returns a git-style diff showing the changes made. Only works within allowed directories.', 'input_schema': {'type': 'object', 'properties': {'path': {'type': 'string'}, 'edits': {'type': 'array', 'items': {'type': 'object', 'properties': {'oldText': {'type': 'string', 'description': 'Text to search for - must match exactly'}, 'newText': {'type': 'string', 'description': 'Text to replace with'}}, 'required': ['oldText', 'newText'], 'additionalProperties': False}}, 'dryRun': {'type': 'boolean', 'default': False, 'description': 'Preview changes using git-style diff format'}}, 'required': ['path', 'edits'], 'additionalProperties': False, '$schema': 'http://json-schema.org/draft-07/schema#'}, 'server': 'server-1757684952'}, {'name': 'create_directory', 'description': 'Create a new directory or ensure a directory exists. Can create multiple nested directories in one operation. If the directory already exists, this operation will succeed silently. Perfect for setting up directory structures for projects or ensuring required paths exist. Only works within allowed directories.', 'input_schema': {'type': 'object', 'properties': {'path': {'type': 'string'}}, 'required': ['path'], 'additionalProperties': False, '$schema': 'http://json-schema.org/draft-07/schema#'}, 'server': 'server-1757684952'}, {'name': 'list_directory', 'description': 'Get a detailed listing of all files and directories in a specified path. Results clearly distinguish between files and directories with [FILE] and [DIR] prefixes. This tool is essential for understanding directory structure and finding specific files within a directory. Only works within allowed directories.', 'input_schema': {'type': 'object', 'properties': {'path': {'type': 'string'}}, 'required': ['path'], 'additionalProperties': False, '$schema': 'http://json-schema.org/draft-07/schema#'}, 'server': 'server-1757684952'}, {'name': 'list_directory_with_sizes', 'description': 'Get a detailed listing of all files and directories in a specified path, including sizes. Results clearly distinguish between files and directories with [FILE] and [DIR] prefixes. This tool is useful for understanding directory structure and finding specific files within a directory. Only works within allowed directories.', 'input_schema': {'type': 'object', 'properties': {'path': {'type': 'string'}, 'sortBy': {'type': 'string', 'enum': ['name', 'size'], 'default': 'name', 'description': 'Sort entries by name or size'}}, 'required': ['path'], 'additionalProperties': False, '$schema': 'http://json-schema.org/draft-07/schema#'}, 'server': 'server-1757684952'}, {'name': 'directory_tree', 'description': "Get a recursive tree view of files and directories as a JSON structure. Each entry includes 'name', 'type' (file/directory), and 'children' for directories. Files have no children array, while directories always have a children array (which may be empty). The output is formatted with 2-space indentation for readability. Only works within allowed directories.", 'input_schema': {'type': 'object', 'properties': {'path': {'type': 'string'}}, 'required': ['path'], 'additionalProperties': False, '$schema': 'http://json-schema.org/draft-07/schema#'}, 'server': 'server-1757684952'}, {'name': 'move_file', 'description': 'Move or rename files and directories. Can move files between directories and rename them in a single operation. If the destination exists, the operation will fail. Works across different directories and can be used for simple renaming within the same directory. Both source and destination must be within allowed directories.', 'input_schema': {'type': 'object', 'properties': {'source': {'type': 'string'}, 'destination': {'type': 'string'}}, 'required': ['source', 'destination'], 'additionalProperties': False, '$schema': 'http://json-schema.org/draft-07/schema#'}, 'server': 'server-1757684952'}, {'name': 'search_files', 'description': "Recursively search for files and directories matching a pattern. Searches through all subdirectories from the starting path. The search is case-insensitive and matches partial names. Returns full paths to all matching items. Great for finding files when you don't know their exact location. Only searches within allowed directories.", 'input_schema': {'type': 'object', 'properties': {'path': {'type': 'string'}, 'pattern': {'type': 'string'}, 'excludePatterns': {'type': 'array', 'items': {'type': 'string'}, 'default': []}}, 'required': ['path', 'pattern'], 'additionalProperties': False, '$schema': 'http://json-schema.org/draft-07/schema#'}, 'server': 'server-1757684952'}, {'name': 'get_file_info', 'description': 'Retrieve detailed metadata about a file or directory. Returns comprehensive information including size, creation time, last modified time, permissions, and type. This tool is perfect for understanding file characteristics without reading the actual content. Only works within allowed directories.', 'input_schema': {'type': 'object', 'properties': {'path': {'type': 'string'}}, 'required': ['path'], 'additionalProperties': False, '$schema': 'http://json-schema.org/draft-07/schema#'}, 'server': 'server-1757684952'}, {'name': 'list_allowed_directories', 'description': 'Returns the list of directories that this server is allowed to access. Subdirectories within these allowed directories are also accessible. Use this to understand which directories and their nested paths are available before trying to access files.', 'input_schema': {'type': 'object', 'properties': {}, 'required': []}, 'server': 'server-1757684952'}]

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
```

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