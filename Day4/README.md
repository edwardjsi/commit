# 🧑‍💻 Day 4: Linux User & Group Management

## 📌 Overview

This module introduces core Linux commands for managing users, groups, and permissions. These are essential for provisioning secure environments, onboarding team members, and controlling access to shared resources.

---

## 🛠️ Script: `user_group.sh`

### 🔧 What It Does
- Creates a new user (`devops_user`)
- Sets a password (`DevOps@123`)
- Creates a group (`devops_team`)
- Adds the user to the group
- Creates a shared folder (`/opt/devops_shared`)
- Sets group ownership and permissions (`chmod 770`)

### 🚀 How to Run
```bash
chmod +x user_group.sh
sudo ./user_group.sh
