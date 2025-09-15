# 🔎 Verification Capability Map (VCM)

The Verification Capability Map is the bridge between a **skill framework** (what learners are expected to know) and a **set of MCP tools** (what can be programmatically verified).  

Its purpose is to:  
- Identify which skills are **auto-verifiable** with the given toolset, which require scaffolding (fixtures, scripts), which are best suited for **manual reflection or discussion**, and which can be tested as **knowledge checks** (multiple-choice or short-answer).  
- Define the **fixtures** (repos, datasets, files) needed to test each skill.  
- Suggest **probes** (commands, file inspections, queries) that a verifier can use to assess learner performance.  
- Establish **pass/fail criteria** and reset conditions so labs can be run repeatedly and reliably.  
- Ensure consistency in how verification results are captured, using a **structured result schema**.  

The VCM helps course/lab authors design practical training environments where learners practice skills and get immediate, automated feedback where possible.

---

## Skill Framework

# ⚡ Lite Skill Framework Template (80/20 Practitioner Focus)

**Topic:** Regular Expressions with Bash

**Goal:** Create a structured skill framework for the topic that is:

* Organized into **three progressive levels**: Beginner, Intermediate, Strong-Intermediate.
* Uses **Bloom’s Taxonomy verbs** appropriate for each level.
* Focused on the **20% of features that cover 80% of real-world usage**.
* Skips niche/rare features — optimized for **practitioner fluency in everyday contexts**.
* Written for a **professional/enterprise context**.

FORMAT ALL RESULTS AS MARKDOWN.

---

### Level 1 – Beginner

*Focus: understand the essentials and build a working foundation.*

* Use verbs like **Identify, Define, Recognize, Recall, Describe, Execute.**
* Skills should involve **core vocabulary, mental models, and execution of the most common tasks**.
* Learners at this level can perform **basic workflows** and explain **what the tool/feature is for**.

---

### Level 2 – Intermediate

*Focus: apply the core features in realistic scenarios and solve common problems independently.*

* Use verbs like **Apply, Demonstrate, Modify, Use, Implement, Combine.**
* Skills should show the learner can **connect multiple features together**, handle **typical errors**, and work **without much guidance**.
* Learners at this level can complete **80% of practical, day-to-day use cases**.

---

### Level 3 – Strong-Intermediate

*Focus: extend, adapt, and streamline workflows for reliability and efficiency.*

* Use verbs like **Adapt, Troubleshoot, Refine, Optimize, Configure, Evaluate.**
* Skills should involve **troubleshooting, cleanup, and efficiency improvements**, but not drift into rare or “expert” territory.
* Learners at this level are **fluent practitioners**: they know when to apply or avoid features, how to adapt them to team contexts, and how to keep workflows smooth.

---

## 📌 Example (Topic: SQL Joins)

**Level 1 – Beginner**

* Identify what a JOIN is and why it’s used.
* Recognize the difference between INNER JOIN and LEFT JOIN.
* Execute a simple INNER JOIN between two tables.
* Recall the concept of primary/foreign keys in JOINs.

**Level 2 – Intermediate**

* Apply LEFT JOINs to include unmatched rows.
* Demonstrate combining multiple JOINs in a single query.
* Modify queries to troubleshoot missing rows.
* Use table aliases to simplify JOIN syntax.
* Implement JOINs with basic filtering (`WHERE`).

**Level 3 – Strong-Intermediate**

* Adapt queries with different JOIN types (INNER, LEFT, RIGHT) depending on the use case.
* Troubleshoot ambiguous column names or NULL issues in JOIN results.
* Refine queries for readability and maintainability.
* Optimize common JOINs using indexes.
* Evaluate when a JOIN is the right tool vs. when to use subqueries or UNION.


---
## MCP Context

Here are some of the MCP tools you will have available for these purposes.  Consider how you would use these wne making your response:

[
  {
    "name": "shell_execute",
    "description": "Execute a shell command\nAllowed commands: grep, sed, awk",
    "input_schema": {
      "type": "object",
      "properties": {
        "command": {
          "type": "array",
          "items": {
            "type": "string"
          },
          "description": "Command and its arguments as array"
        },
        "stdin": {
          "type": "string",
          "description": "Input to be passed to the command via stdin"
        },
        "directory": {
          "type": "string",
          "description": "Working directory where the command will be executed"
        },
        "timeout": {
          "type": "integer",
          "description": "Maximum execution time in seconds",
          "minimum": 0
        }
      },
      "required": ["command", "directory"]
    },
    "server": "List Files"
  },
  {
    "name": "read_file",
    "description": "Read the complete contents of a file as text. DEPRECATED: Use read_text_file instead.",
    "input_schema": {
      "type": "object",
      "properties": {
        "path": {
          "type": "string"
        },
        "tail": {
          "type": "number",
          "description": "If provided, returns only the last N lines of the file"
        },
        "head": {
          "type": "number",
          "description": "If provided, returns only the first N lines of the file"
        }
      },
      "required": ["path"],
      "additionalProperties": false,
      "$schema": "http://json-schema.org/draft-07/schema#"
    },
    "server": "server-1757684952"
  },
  {
    "name": "read_text_file",
    "description": "Read the complete contents of a file from the file system as text. Handles various text encodings and provides detailed error messages if the file cannot be read. Use this tool when you need to examine the contents of a single file. Use the 'head' parameter to read only the first N lines of a file, or the 'tail' parameter to read only the last N lines of a file. Operates on the file as text regardless of extension. Only works within allowed directories.",
    "input_schema": {
      "type": "object",
      "properties": {
        "path": {
          "type": "string"
        },
        "tail": {
          "type": "number",
          "description": "If provided, returns only the last N lines of the file"
        },
        "head": {
          "type": "number",
          "description": "If provided, returns only the first N lines of the file"
        }
      },
      "required": ["path"],
      "additionalProperties": false,
      "$schema": "http://json-schema.org/draft-07/schema#"
    },
    "server": "server-1757684952"
  },
  {
    "name": "read_media_file",
    "description": "Read an image or audio file. Returns the base64 encoded data and MIME type. Only works within allowed directories.",
    "input_schema": {
      "type": "object",
      "properties": {
        "path": {
          "type": "string"
        }
      },
      "required": ["path"],
      "additionalProperties": false,
      "$schema": "http://json-schema.org/draft-07/schema#"
    },
    "server": "server-1757684952"
  },
  {
    "name": "read_multiple_files",
    "description": "Read the contents of multiple files simultaneously. This is more efficient than reading files one by one when you need to analyze or compare multiple files. Each file's content is returned with its path as a reference. Failed reads for individual files won't stop the entire operation. Only works within allowed directories.",
    "input_schema": {
      "type": "object",
      "properties": {
        "paths": {
          "type": "array",
          "items": {
            "type": "string"
          }
        }
      },
      "required": ["paths"],
      "additionalProperties": false,
      "$schema": "http://json-schema.org/draft-07/schema#"
    },
    "server": "server-1757684952"
  },
  {
    "name": "write_file",
    "description": "Create a new file or completely overwrite an existing file with new content. Use with caution as it will overwrite existing files without warning. Handles text content with proper encoding. Only works within allowed directories.",
    "input_schema": {
      "type": "object",
      "properties": {
        "path": {
          "type": "string"
        },
        "content": {
          "type": "string"
        }
      },
      "required": ["path", "content"],
      "additionalProperties": false,
      "$schema": "http://json-schema.org/draft-07/schema#"
    },
    "server": "server-1757684952"
  },
  {
    "name": "edit_file",
    "description": "Make line-based edits to a text file. Each edit replaces exact line sequences with new content. Returns a git-style diff showing the changes made. Only works within allowed directories.",
    "input_schema": {
      "type": "object",
      "properties": {
        "path": {
          "type": "string"
        },
        "edits": {
          "type": "array",
          "items": {
            "type": "object",
            "properties": {
              "oldText": {
                "type": "string",
                "description": "Text to search for - must match exactly"
              },
              "newText": {
                "type": "string",
                "description": "Text to replace with"
              }
            },
            "required": ["oldText", "newText"],
            "additionalProperties": false
          }
        },
        "dryRun": {
          "type": "boolean",
          "default": false,
          "description": "Preview changes using git-style diff format"
        }
      },
      "required": ["path", "edits"],
      "additionalProperties": false,
      "$schema": "http://json-schema.org/draft-07/schema#"
    },
    "server": "server-1757684952"
  },
  {
    "name": "create_directory",
    "description": "Create a new directory or ensure a directory exists. Can create multiple nested directories in one operation. If the directory already exists, this operation will succeed silently. Perfect for setting up directory structures for projects or ensuring required paths exist. Only works within allowed directories.",
    "input_schema": {
      "type": "object",
      "properties": {
        "path": {
          "type": "string"
        }
      },
      "required": ["path"],
      "additionalProperties": false,
      "$schema": "http://json-schema.org/draft-07/schema#"
    },
    "server": "server-1757684952"
  },
  {
    "name": "list_directory",
    "description": "Get a detailed listing of all files and directories in a specified path. Results clearly distinguish between files and directories with [FILE] and [DIR] prefixes. This tool is essential for understanding directory structure and finding specific files within a directory. Only works within allowed directories.",
    "input_schema": {
      "type": "object",
      "properties": {
        "path": {
          "type": "string"
        }
      },
      "required": ["path"],
      "additionalProperties": false,
      "$schema": "http://json-schema.org/draft-07/schema#"
    },
    "server": "server-1757684952"
  },
  {
    "name": "list_directory_with_sizes",
    "description": "Get a detailed listing of all files and directories in a specified path, including sizes. Results clearly distinguish between files and directories with [FILE] and [DIR] prefixes. This tool is useful for understanding directory structure and finding specific files within a directory. Only works within allowed directories.",
    "input_schema": {
      "type": "object",
      "properties": {
        "path": {
          "type": "string"
        },
        "sortBy": {
          "type": "string",
          "enum": ["name", "size"],
          "default": "name",
          "description": "Sort entries by name or size"
        }
      },
      "required": ["path"],
      "additionalProperties": false,
      "$schema": "http://json-schema.org/draft-07/schema#"
    },
    "server": "server-1757684952"
  },
  {
    "name": "directory_tree",
    "description": "Get a recursive tree view of files and directories as a JSON structure. Each entry includes 'name', 'type' (file/directory), and 'children' for directories. Files have no children array, while directories always have a children array (which may be empty). The output is formatted with 2-space indentation for readability. Only works within allowed directories.",
    "input_schema": {
      "type": "object",
      "properties": {
        "path": {
          "type": "string"
        }
      },
      "required": ["path"],
      "additionalProperties": false,
      "$schema": "http://json-schema.org/draft-07/schema#"
    },
    "server": "server-1757684952"
  },
  {
    "name": "move_file",
    "description": "Move or rename files and directories. Can move files between directories and rename them in a single operation. If the destination exists, the operation will fail. Works across different directories and can be used for simple renaming within the same directory. Both source and destination must be within allowed directories.",
    "input_schema": {
      "type": "object",
      "properties": {
        "source": {
          "type": "string"
        },
        "destination": {
          "type": "string"
        }
      },
      "required": ["source", "destination"],
      "additionalProperties": false,
      "$schema": "http://json-schema.org/draft-07/schema#"
    },
    "server": "server-1757684952"
  },
  {
    "name": "search_files",
    "description": "Recursively search for files and directories matching a pattern. Searches through all subdirectories from the starting path. The search is case-insensitive and matches partial names. Returns full paths to all matching items. Great for finding files when you don't know their exact location. Only searches within allowed directories.",
    "input_schema": {
      "type": "object",
      "properties": {
        "path": {
          "type": "string"
        },
        "pattern": {
          "type": "string"
        },
        "excludePatterns": {
          "type": "array",
          "items": {
            "type": "string"
          },
          "default": []
        }
      },
      "required": ["path", "pattern"],
      "additionalProperties": false,
      "$schema": "http://json-schema.org/draft-07/schema#"
    },
    "server": "server-1757684952"
  },
  {
    "name": "get_file_info",
    "description": "Retrieve detailed metadata about a file or directory. Returns comprehensive information including size, creation time, last modified time, permissions, and type. This tool is perfect for understanding file characteristics without reading the actual content. Only works within allowed directories.",
    "input_schema": {
      "type": "object",
      "properties": {
        "path": {
          "type": "string"
        }
      },
      "required": ["path"],
      "additionalProperties": false,
      "$schema": "http://json-schema.org/draft-07/schema#"
    },
    "server": "server-1757684952"
  },
  {
    "name": "list_allowed_directories",
    "description": "Returns the list of directories that this server is allowed to access. Subdirectories within these allowed directories are also accessible. Use this to understand which directories and their nested paths are available before trying to access files.",
    "input_schema": {
      "type": "object",
      "properties": {},
      "required": []
    },
    "server": "server-1757684952"
  }
]

---

> **Guidance:**  
> - Favor auto-verifiable skills (Levels 1–4).  
> - Level 5 skills usually involve reflection, mentoring, or design and are best marked “manual review.”  
> - Level 1 skills may also be verified via **knowledge checks** (MCQ/short answer).

---

## Result Record Schema (for verifiers to emit)

```json
{
  "status": "PASS|FAIL",
  "skill": "<skill text>",
  "observations": "<string or list>",
  "evidence": { "stdout": "<captured output>", "stderr": "", "files": [] },
  "hints": ["<next-step or remediation>"]
}
```

This schema ensures results are consistent and machine-readable.  
- **status** indicates whether the learner’s attempt met the criteria.  
- **observations** capture human-readable notes or patterns detected.  
- **evidence** provides supporting data for transparency and debugging.  
- **hints** give learners targeted next steps to improve.

---

# Skills & Verification Map

## Level 1 — Exploring

### Skill: [Paste skill here]

- **Feasibility (initial):** [auto-verifiable | verifiable with scaffolding | knowledge check | manual review]  
- **Verification mode:** [lab probe | knowledge check | manual review]  
- **Required fixtures (if lab):** [repo/db/json file/etc.]  
- **Suggested probes (if lab):** [shell commands, file reads, etc.]  
- **Knowledge check example (if applicable):**  
  Q: [Insert multiple-choice or short-answer question]  
  Options: [A) ..., B) ..., C) ...]  
  **Correct answer:** [Insert correct option]  
- **Pass/Fail criteria (initial):** [expected output/state vs fail signals OR correct answer]  
- **Reset needed between attempts (if lab):** [true/false]  
- **Notes (author to refine):** [...]

---

## Level 2 — Applying

### Skill: [Paste skill here]

- **Feasibility (initial):** [...]  
- **Verification mode:** [lab probe | knowledge check | manual review]  
- **Required fixtures (initial):** [...]  
- **Suggested probes (initial):** [...]  
- **Pass/Fail criteria (initial):** [...]  
- **Reset needed between attempts:** [...]  
- **Notes:** [...]

---

## Level 3 — Building

[Repeat structure above for each skill]

---

## Level 4 — Advancing

[Repeat structure above for each skill]

---

## Level 5 — Innovating

[Repeat structure above for each skill; most will be manual review/reflection]