\
    # 📘 Lab Starter Environment

    This bundle contains everything you need to spin up and reset a self-contained lab environment for practicing skills from the **Git Skill Framework**.

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

    ## 🛠️ Makefile Commands
    | Command       | Description                                          |
    | ------------- | ---------------------------------------------------- |
    | `make up`     | Bootstrap labs (create fixtures)                     |
    | `make verify` | Run sanity checks over fixtures                      |
    | `make reset`  | Wipe and rebuild baseline                            |
    | `make clean`  | Remove labs only                                     |
    | `make reup`   | Clean + bootstrap fresh                              |
    | `make show`   | List workspace contents                              |
    | `make help`   | Show command help                                    |
    | `make package`| Build the ZIP archive                                |

    ## ⚙️ Environment Notes
    - **OS base image:** Ubuntu 22.04 (recommended)
    - **Tools required:** `git` (≥2.34), `make`, `bash`
    - **Optional tools:** `jq`, `sqlite3`
    - **Default workspace:** `./labs` (override with `LAB_ROOT=/path make up`)
    - **Safety:** All repos/files are local and sandboxed; remotes are simulated with a local bare repo.
