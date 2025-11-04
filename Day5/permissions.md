# Day 5: Linux File Permissions — Real-World Lab

## 🎯 Objective
Understand and apply Linux file and directory permissions using `chmod`, `chown`, and `ls -l`. Learn how to secure shared folders and control access for users, groups, and others.

---

## 1. 🔍 Key Concepts

| Symbol | Meaning |
|--------|---------|
| `r`    | Read    |
| `w`    | Write   |
| `x`    | Execute |
| `u`    | User (owner) |
| `g`    | Group |
| `o`    | Others |
| `a`    | All (user + group + others) |

---

## 🛠 Commands Practiced

### 1. Create a file
```bash
touch sample.txt

### 2. To view permission I used 

ls -l sample.txt

### 3. To change permissions in symbolic mode

chmod u+x sample.txt     # Add execute for user
chmod g= sample.txt      # Remove all group permissions
chmod o+r sample.txt     # Allow others to read
chmod o+w sample.txt     # Allow others to write (⚠️ risky)

### 4. Change Permissions (Octal)

chmod 640 sample.txt     # rw-r----- (secure default)
chmod 604 sample.txt     # rw----r-- (readable by others)

### 5. Change Ownership

sudo groupadd devops_team
sudo chown santosh:devops_team sample.txt

### 6. Create a securre shared folder for dwvops_team

sudo mkdir -p /opt/devops_shared
sudo chown root:devops_team /opt/devops_shared
sudo chmod 770 /opt/devops_shared
sudo chmod g+s /opt/devops_shared   # Inherit group ownership
sudo usermod -aG devops_team $USER

### 7. Here's how to test it:

touch /opt/devops_shared/test.txt
sudo chown santosh:devops_team /opt/devops_shared/test.txt
chmod 660 /opt/devops_shared/test.txt


