# 📘 Lab Starter Environment — Regular Expressions with Bash

This bundle contains everything you need to spin up and reset a self-contained lab environment for practicing skills from the **Skill Framework: Regular Expressions with Bash**.

It translates the **Verification Capability Map (VCM)** into concrete setup instructions (fixtures, datasets, scripts), ensuring a reproducible baseline for `grep`, `sed`, and `awk` exercises.

---

## 🚀 Quick Start

1. Extract the ZIP archive:

   ```bash
   unzip lab-starter.zip
   cd lab-starter
   ```

2. Bootstrap the environment:

   ```bash
   make up
   ```

3. Verify the setup:

   ```bash
   make verify
   ```

4. Reset back to a clean state at any time:
   ```bash
   make reset
   ```

---

## 📂 Contents

- `bootstrap.sh` → Seeds all fixtures (files and directories for regex practice).
- `reset.sh` → Wipes learner changes and rebuilds baseline.
- `verify.sh` → Runs sanity checks (ensures baseline files exist, sample regex probes pass).
- `Makefile` → Convenience targets (`up`, `verify`, `reset`, `clean`, `reup`, `show`, `help`).
- `seeds/fixtures/*` → Authoritative fixture copies (logs, CSV, HTML, JSON).
- `labs/workspace/*` → Working copies created by `make up`.

---

## 🛠️ Fixtures Overview

- **logs/**
  - `system.log` — syslog-style entries (auth + cron lines).
  - `app-error.log` — app events at INFO/WARN/ERROR levels.
- **data/**
  - `users.txt` — colon-delimited records: `name:email:ip`.
  - `users.csv` — CSV with `name,email,ip,role`.
- **web/**
  - `sample.html` — small HTML snippet with emails and an error class.
- **json/**
  - `events.json` — array of JSON objects for pattern extraction.

These allow practice across Level 1–3 skills (anchors, classes, grouping, quantifiers, capture, backrefs, pipelines).

---

## 🧪 What to Try (after `make up`)

```bash
# Lines starting with 'Sep' (anchor ^)
grep '^Sep' labs/workspace/logs/system.log

# Lines ending in 'ssh2' (anchor $)
grep 'ssh2$' labs/workspace/logs/system.log

# Email extraction from HTML (ERE + -o to show matches only)
grep -Eo '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}' labs/workspace/web/sample.html

# Loose IPv4 detection
grep -E '([0-9]{1,3}\.){3}[0-9]{1,3}' labs/workspace/data/users.txt

# Replace ERROR→ERR (preview)
sed -E 's/ERROR/ERR/g' labs/workspace/logs/app-error.log | head -n 5

# awk filter for ERRORs with 500
awk '/ERROR/ && /500/' labs/workspace/logs/app-error.log
```

---

## ⚙️ Requirements

- **OS**: Linux or macOS (Bash)
- **Tools**: `bash`, `make`, `grep`, `sed`, `awk`
- **Optional**: `rsync` (recommended; falls back to `cp -a` if you adapt scripts)

---

## 🧹 Reset & Orchestration

- `make reset` — wipes `labs/workspace` and restores from `seeds/fixtures`.
- `make reup` — clean + bootstrap.
- `make show` — print a tree of current workspace contents.

---

## 🔒 Safety & Reproducibility

- Everything is local and sandboxed; no network access required.
- Baseline state is reproducible via `reset.sh` and canonical seeds.

---

## ❓ Troubleshooting

- **Missing tools**: ensure `grep`, `sed`, and `awk` are installed and in `PATH`.
- **Permission issues**: if scripts aren't executable, run:
  ```bash
  chmod +x bootstrap.sh reset.sh verify.sh
  ```
- **Different grep behavior**: some systems may not support `grep -P`. This lab uses BRE/ERE only (`grep`/`grep -E`).

---

Happy grepping! 🧪
