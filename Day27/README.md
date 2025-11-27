##Objective

Explain *why* you’re creating a role.

> Example:
> This document explains how to create an IAM Role for an EC2 instance to access an S3 bucket securely.

---

## 2️⃣ Why IAM Roles (No Access Keys)

Explain security reasoning.

You show you understand:

* No hardcoded credentials
* Better security than access keys
* AWS provides credentials automatically

---

## 3️⃣ Architecture Diagram (Text form)

This shows system thinking:

```
EC2 → IAM Role → IAM Policy → S3 Bucket
```

---

## 4️⃣ IAM Policy Creation

Show:

* Policy name
* JSON policy
* Least privilege principle

Example:

* `s3:GetObject`
* `s3:PutObject`
* Only one bucket, not *

---

## 5️⃣ IAM Role Creation

Explain:

* Role name
* Trusted entity = EC2
* Trust policy

You prove you understand **sts:AssumeRole**.

---

## 6️⃣ Attach Role to EC2

Explain how to assign role to instance.

---

## 7️⃣ Validation Steps

SSH + test command

```bash
aws s3 ls s3://bucket-name
```

Shows you can confirm access.

---

## 8️⃣ Security Best Practices

Must include:

* Least privilege
* No access keys
* Logging
* Policy scope

---

## 9️⃣ Summary Table

High-level recap:

| Component | Purpose     |
| --------- | ----------- |
| IAM Role  | Identity    |
| Policy    | Permissions |
| EC2       | Uses role   |
| S3        | Resource    |

---

## 🔟 Completion checklist

Signals discipline:

✅ Policy created
✅ Role attached
✅ Access tested
✅ Doc committed

---

# ✅ Final File Path (important)

Create:

```
/docs/aws-core/iam-roles.md
```

Inside?
➡️ Everything I already wrote for you in the previous message.

---

# ✅ Git Commit Message

```
Day 27: Documented IAM Role creation for EC2 to access S3
```

---
