# Day41 – Terraform IAM User Project (WSL Integration)

## 📌 Overview
Day41 focuses on creating a reproducible Terraform project inside **WSL Ubuntu** and committing it to the public repo.  
We set up the environment so all future DayXX projects live inside WSL, keeping the workflow Linux‑native and interview‑ready.

---

## 🛠 Steps Completed Today

### 1. WSL Setup
- Verified Ubuntu WSL2 is running (`wsl --list --verbose`).
- Decided to use IntelliJ for editing, but keep all files inside WSL (`\\wsl$\Ubuntu\home\santosh\commit`).

### 2. Project Files Created
- `main.tf` – Terraform configuration for IAM user.
- `variables.tf` – Input variables for modularity.
- `outputs.tf` – Outputs for visibility and reuse.
- `README.md` – Documentation of today’s workflow.

### 3. Repo Hygiene
- Discovered `.terraform/` folder (~777 MB) created by `terraform init`.
- Removed `.terraform/` to keep repo lean.
- Added `.gitignore` entries:
  ```gitignore
  .terraform/
  *.tfstate
  *.tfstate.backup
  .idea/
  *.iml
