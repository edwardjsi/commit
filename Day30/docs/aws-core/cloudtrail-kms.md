# AWS CloudTrail & KMS – Auditing and Encryption

## Overview
AWS CloudTrail and AWS KMS form the backbone of security and compliance in AWS environments.

- CloudTrail = Visibility and audit trail
- KMS = Encryption and access control for data

Together, they answer:
- Who did what?
- When did it happen?
- Was the data protected?

---

# AWS CloudTrail

## What is CloudTrail?
AWS CloudTrail is a service that records all API activity across your AWS account.

Every action taken via:
- AWS Console
- CLI
- SDK
- Services

is logged as an **event**.

---

## Why CloudTrail is important

CloudTrail helps you:

✅ Detect unauthorized access  
✅ Perform root-cause analysis  
✅ Investigate incidents  
✅ Meet compliance requirements  
✅ Track configuration changes  

---

## Example CloudTrail Events Include:
- EC2 instance deleted
- IAM role modified
- S3 bucket made public
- Security group changed
- KMS key disabled

---

## Key Concepts

### Trail
A configuration that defines:
- Which regions are logged
- Where logs are stored (S3)
- Encryption (KMS key)
- Log file validation

### Event Types
| Type | Description |
|------|-------------|
| Management Events | IAM, EC2, VPC, KMS |
| Data Events | S3, Lambda |
| Insights Events | Detect unusual behavior |

---

## Best Practices for CloudTrail

✅ Enable CloudTrail in **ALL regions**  
✅ Store logs in a **separate security account**  
✅ Enable **log file validation**  
✅ Encrypt logs using KMS  
✅ Integrate with CloudWatch for alerts  
✅ Monitor root account activity  

---

# AWS KMS (Key Management Service)

---

## What is AWS KMS?
AWS KMS is a managed service for creating and controlling encryption keys.

It allows you to:
- Encrypt data
- Rotate keys
- Control access via IAM policies
- Audit encryption usage via CloudTrail

---

## Key Terms

### CMK / KMS Key
A customer-managed encryption key used to encrypt:

- EBS volumes
- S3 objects
- RDS databases
- Secrets Manager secrets
- CloudTrail logs

---

## Types of Keys

| Key Type | Usage |
|----------|------|
| AWS Managed | Default encryption |
| Customer Managed | Custom permission control |
| Imported | Bring your own key |
| Multi-region | Cross-region availability |

---

## Envelope Encryption (Important Concept)

Data is NOT directly encrypted by the KMS master key.

Instead:

1. KMS encrypts a data key
2. The data key encrypts the file
3. Encrypted data key stored with file

This allows:
- Speed
- Scalability
- Security

---

## Best Practices for KMS

✅ Least privilege IAM access  
✅ Enable rotation yearly  
✅ Use aliases for keys  
✅ Restrict delete permissions  
✅ Log usage using CloudTrail  
✅ Separate keys by environment (Dev / Prod)

---

# CloudTrail & KMS Together

CloudTrail uses KMS to:

- Encrypt audit logs stored in S3
- Protect sensitive activity records

This ensures:
✅ Tamper-proof logs  
✅ Compliance readiness  
✅ Secure forensics

---

## Real World Example

If an EC2 instance is terminated:

CloudTrail answers:
- Who did it?
- What IP?
- When?
- From which service?

KMS ensures:
- Logs are encrypted
- Logs cannot be modified
- Logs cannot be deleted without permission

---

## Summary

| Feature | CloudTrail | KMS |
|---------|------------|-----|
| Auditing | 	✅     | x
| Encryption | ❌ 	| ✅ |
| Compliance | ✅ 	| ✅ |
| Incident Investigation| ✅ | ❌ |
| Key Control | ❌ 	| ✅ |

---

## Final Thought

Cloud without audit is dangerous.  
Encryption without access control is illusion.


