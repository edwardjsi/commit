# 🚀 Day 9: Manual EC2 Launch via AWS Console

## 🎯 Objective
Manually launch a **t2.micro EC2 instance** using the AWS Console and connect to it via SSH from WSL using a `.pem` key. This reinforces your understanding of AMI selection, key pair usage, security groups, and remote access.

---

## 🛠️ Step-by-Step: Launch EC2 via Console

### 1. Log in to AWS Console
- URL: [https://console.aws.amazon.com](https://console.aws.amazon.com)
- Region: `eu-north-1` (or your preferred region)

### 2. Launch a New Instance
- **Name**: `Day9ManualEC2`
- **AMI**: Ubuntu Server 22.04 LTS or Amazon Linux 2023
- **Instance Type**: `t2.micro`
- **Key Pair**: Select or create a new key (e.g., `day9-key.pem`)
- **Network Settings**:
  - Create or select a **Security Group**
  - Inbound Rule: Allow **SSH (port 22)** from `0.0.0.0/0` (or restrict to your IP)
- **Storage**: Default (8 GiB)
- Click **Launch Instance**

---

## 🔐 Key Pair Handling

### If Creating a New Key:
- Download the `.pem` file immediately
- Move it to your WSL home directory:
  ```bash
  mv /mnt/c/Users/<YourWindowsUsername>/Downloads/day9-key.pem ~/
  chmod 400 ~/day9-key.pem
  
  
  
Manually launch a **t2.micro EC2 instance** using the AWS Console and connect to it via SSH from WSL using a `.pem` key. This reinforces your understanding of AMI selection, key pair usage, security groups, and remote access.

---

## 🛠️ Step-by-Step: Launch EC2 via Console

### 1. Log in to AWS Console
- URL: [https://console.aws.amazon.com](https://console.aws.amazon.com)
- Region: `eu-north-1` (or your preferred region)

### 2. Launch a New Instance
- **Name**: `Day9ManualEC2`
- **AMI**: Ubuntu Server 22.04 LTS or Amazon Linux 2023
- **Instance Type**: `t2.micro`
- **Key Pair**: Select or create a new key (e.g., `day9-key.pem`)
- **Network Settings**:
  - Create or select a **Security Group**
  - Inbound Rule: Allow **SSH (port 22)** from `0.0.0.0/0` (or restrict to your IP)
- **Storage**: Default (8 GiB)
- Click **Launch Instance**

---

## 🔐 Key Pair Handling

### If Creating a New Key:
- Download the `.pem` file immediately
- Move it to your WSL home directory:
  ```bash
  mv /mnt/c/Users/<YourWindowsUsername>/Downloads/day9-key.pem ~/
  chmod 400 ~/day9-key.pem
  
  
  
