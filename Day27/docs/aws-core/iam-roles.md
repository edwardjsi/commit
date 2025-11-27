---

# AWS IAM Roles and Policies – EC2 Access to S3

## Objective

Demonstrate how to create an IAM Role that allows an EC2 instance to securely access an S3 bucket using an IAM Policy.

---

## Why IAM Roles Instead of Access Keys

IAM Roles eliminate:

* Hardcoded credentials
* Manual key rotation
* Security leaks

AWS assigns temporary credentials automatically to the EC2 instance via the role.

---

## Architecture Overview

```
EC2 Instance  →  IAM Role  →  IAM Policy  →  S3 Bucket
```

---

## Step 1: Create IAM Policy

### Policy Name

```
EC2-S3-Access-Policy
```

### Example Policy (Read/Write Access to a Single Bucket)

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket"
      ],
      "Resource": "arn:aws:s3:::my-demo-bucket"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject"
      ],
      "Resource": "arn:aws:s3:::my-demo-bucket/*"
    }
  ]
}
```

✅ **Principle of Least Privilege Applied**
Only this bucket is accessible, nothing else.

---

## Step 2: Create IAM Role

### Role Name

```
EC2-S3-Access-Role
```

### Trusted Entity

Select:

```
AWS Service → EC2
```

### Trust Policy (Automatically created by AWS)

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
```

---

## Step 3: Attach Policy to Role

Attach:

```
EC2-S3-Access-Policy
```

---

## Step 4: Assign Role to EC2 Instance

While launching OR after launch:

```
EC2 → Instance → Actions → Security → Modify IAM Role
```

Select:

```
EC2-S3-Access-Role
```

---

## Step 5: Validate From EC2 Instance

SSH into EC2 and run:

```bash
aws s3 ls s3://my-demo-bucket
```

Upload file:

```bash
echo "IAM Works" > test.txt
aws s3 cp test.txt s3://my-demo-bucket/
```

✅ If command succeeds → IAM Role works
❌ If denied → Check policy and trust relationship

---

## Security Best Practices

* Never use Access Keys inside EC2
* Scope policies per bucket
* Use managed policies where possible
* Rotate policies via versioning
* Log via CloudTrail

---

## Interview-Level Explanation

**Q: Why use IAM roles instead of access keys?**
A: Roles provide temporary credentials, reduce attack surface, and enforce zero-trust access.

**Q: How does EC2 access AWS without keys?**
A: The Instance Metadata Service injects credentials from the role.

---

## Summary

| Component    | Purpose          |
| ------------ | ---------------- |
| IAM Role     | Identity for EC2 |
| IAM Policy   | Permissions      |
| Trust Policy | Who can assume   |
| EC2          | Uses the role    |
| S3           | Resource         |

---

## Completion Status

✅ IAM Policy Created
✅ IAM Role Attached
✅ EC2 Access Verified
✅ README Committed

---

## ✅ Git Commit Message (Use This Exactly)

```
Day 27: Documented IAM Role creation for EC2 to access S3
```

---
