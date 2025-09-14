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

# 🧩 Git Skill Framework

---

### Level 1 – Exploring

_Focus: learn the basics and build foundational understanding._

- Identify what Git is and describe its role in version control compared to centralized systems.
- Define core Git concepts: repository, commit, branch, merge, remote.
- Recognize the difference between a working directory, staging area, and commit history.
- List common Git commands and their purposes (`init`, `clone`, `status`, `add`, `commit`).
- Describe the difference between local and remote repositories.
- Explain the purpose of `.gitignore` and how it affects version tracking.
- Recall how to configure user information (`git config`) at local vs. global scope.
- Recognize the structure of a commit (hash, message, author, timestamp).
- Identify typical enterprise use cases: code collaboration, change tracking, auditability.

---

### Level 2 – Applying

_Focus: use foundational knowledge in real scenarios with guidance._

- Apply Git commands to create and clone repositories.
- Demonstrate adding, staging, and committing changes.
- Execute branching operations to create and switch between branches.
- Use `git log`, `git diff`, and `git status` to inspect repository history and changes.
- Implement basic merges and recognize merge conflicts.
- Perform pushes and pulls with a remote (e.g., GitHub, GitLab, Bitbucket).
- Illustrate how to create and manage `.gitignore` for common project types.
- Demonstrate undo operations (`git checkout`, `git reset`, `git revert`) in simple cases.
- Apply tagging for marking releases or milestones.
- Use Git GUIs or IDE integrations to visualize commit history.

---

### Level 3 – Building

_Focus: deliver projects independently and solve real problems._

- Develop feature branches using Git Flow or trunk-based development conventions.
- Construct meaningful commit messages aligned with enterprise standards.
- Organize branches for parallel work and collaborative contributions.
- Solve common merge conflicts and explain conflict resolution strategies.
- Produce pull requests (or merge requests) and participate in code reviews.
- Modify history safely with interactive rebasing (`git rebase -i`).
- Present repository history clearly with visualization tools (`git log --graph`).
- Design `.gitignore` and `.gitattributes` rules to support team/project needs.
- Use stashing (`git stash`) to manage context switching in active work.
- Implement shallow clones, sparse checkouts, or submodules for large projects.
- Integrate Git hooks for local automation (e.g., linting, pre-commit checks).

---

### Level 4 – Advancing

_Focus: optimize, integrate, and analyze in complex environments._

- Analyze commit history to trace bugs or regressions (`git bisect`).
- Evaluate branching strategies (Git Flow, trunk-based, GitHub Flow) for enterprise teams.
- Optimize repository performance (pruning, garbage collection, large file handling).
- Integrate Git with CI/CD systems for automated builds and deployments.
- Adapt workflows to enterprise compliance requirements (signed commits, audit trails).
- Compare and critique different conflict-resolution approaches (merge vs. rebase).
- Lead adoption of code review workflows with pull requests and approvals.
- Integrate Git with external tools (issue trackers, project management systems).
- Adapt submodules, monorepos, or subtrees for complex project structures.
- Evaluate and optimize use of Git LFS (Large File Storage).
- Lead team-wide migration projects (e.g., SVN to Git).

---

### Level 5 – Innovating

_Focus: establish best practices, create new solutions, and mentor others._

- Define enterprise Git standards (commit message conventions, branching models).
- Create training and mentoring resources to upskill colleagues in Git.
- Innovate automation solutions with custom hooks and CI/CD pipelines.
- Establish governance for repository structure, permissions, and security.
- Propose improvements to enterprise Git usage (e.g., mono-repo vs. multi-repo).
- Lead development of internal tooling around Git (dashboards, bots, scripts).
- Formulate strategies for scaling Git in large organizations (mirroring, replication).
- Mentor peers in advanced history rewriting, repository repair, and recovery.


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