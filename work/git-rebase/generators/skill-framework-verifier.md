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

# 🧩 Git Rebase Skill Framework

---

### Level 1 – Exploring

_Focus: learn the basics and build foundational understanding._

- Identify what `git rebase` is and describe its role compared to `git merge`.
- Define the difference between **interactive** (`git rebase -i`) and **non-interactive** rebases.
- Recognize the typical use cases for rebasing: linearizing history, updating feature branches.
- Recall the risks of rebasing shared/public branches.
- List the basic steps in a simple rebase: checkout, rebase, resolve conflicts, continue.
- Explain how rebasing differs from fast-forward merges.
- Identify commands associated with rebase workflows: `git rebase`, `--continue`, `--abort`, `--skip`.
- Describe what happens to commit hashes after a rebase.
- Recognize the meaning of “upstream branch” in the context of rebase.

---

### Level 2 – Applying

_Focus: use foundational knowledge in real scenarios with guidance._

- Demonstrate a **basic rebase** of a feature branch onto the latest `main`.
- Apply `git pull --rebase` to keep local branches in sync with remote without merge commits.
- Use `git rebase --onto` to change the base of a branch.
- Execute `git rebase -i` to reorder, squash, and edit commits.
- Perform conflict resolution during a rebase and complete the process with `--continue`.
- Implement `git rebase --abort` and `--skip` when appropriate.
- Illustrate the difference between squashing and fixup commits in an interactive rebase.
- Use `git log --oneline --graph` to verify branch history before and after rebase.
- Apply best practices for commit messages when rebasing.

---

### Level 3 – Building

_Focus: deliver projects independently and solve real problems._

- Construct clean commit histories by squashing, splitting, or editing commits strategically.
- Develop workflows that integrate rebasing with **code review** processes (e.g., squash before PR).
- Solve complex conflict scenarios during multi-commit rebases.
- Modify commit sequences to remove sensitive or mistaken commits.
- Organize long-lived branches by periodically rebasing them onto `main`.
- Present before-and-after comparisons of history to teammates to explain rebase results.
- Design scripts or aliases that simplify common rebase tasks.
- Integrate `git rerere` to optimize repeated conflict resolutions during rebases.
- Produce consistent branch histories that facilitate bisecting and debugging.

---

### Level 4 – Advancing

_Focus: optimize, integrate, and analyze in complex environments._

- Analyze when to prefer `rebase` vs. `merge` in enterprise branching strategies.
- Evaluate the impact of rebasing on **CI/CD pipelines** and automated builds.
- Optimize team workflows by standardizing use of `git pull --rebase` and pre-push hooks.
- Critique existing commit histories and propose rebase strategies to simplify them.
- Integrate rebasing practices with **GitHub/GitLab PR policies** (e.g., squash merges).
- Adapt rebase strategies to monorepos or polyrepo setups.
- Lead teams in handling rebase conflicts collaboratively during large-scale integrations.
- Compare rebasing with cherry-picking and merging to articulate trade-offs.
- Establish reset and recovery strategies (e.g., `git reflog`) after failed rebases.

---

### Level 5 – Innovating

_Focus: establish best practices, create new solutions, and mentor others._

- Define organizational standards for rebase use across teams/projects.
- Mentor developers in safe and effective rebasing, with emphasis on collaboration risks.
- Innovate tooling (aliases, Git hooks, custom scripts) to automate safe rebasing.
- Propose branching strategies (trunk-based, GitHub Flow, GitLab Flow) with rebasing built-in.
- Lead development of training materials and documentation on rebasing best practices.
- Establish policies for rebasing in regulated or high-compliance environments.
- Create decision frameworks for rebase vs. merge vs. cherry-pick in enterprise contexts.


---

## MCP Context

[
  {
    "name": "shell_execute",
    "description": "Execute a shell command\nAllowed commands: git",
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