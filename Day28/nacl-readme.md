# NACL – Full Form and Explanation

## Full Form of NACL

**NACL** stands for:

> ## Network Access Control List

---

## What is a NACL in AWS?

A **Network Access Control List (NACL)** is a security layer in AWS that acts as a firewall for controlling **inbound and outbound traffic** at the **subnet level**.

It determines which traffic is allowed to enter or leave a subnet based on a set of defined rules.

---

## Meaning of Each Word

### Network
Refers to the VPC subnet where traffic enters and exits.

### Access
Defines which traffic is permitted or denied.

### Control
Indicates rule-based enforcement of security.

### List
A set of ordered rules that determine allow/deny behavior.

---

## Easy Way to Remember

- **N** → Network  
- **A** → Access  
- **C** → Control  
- **L** → List  

> A list of rules to control network access to a subnet.

---

## One-Line Definition

A NACL is a **subnet-level firewall** that controls traffic using allow and deny rules.

---

## Comparison with Security Group

| Feature | NACL | Security Group |
|----------|------|----------------|
| Scope | Subnet | Instance |
| Rule Type | Allow & Deny | Allow only |
| Stateful | No | Yes |
| Rule Order | Important | Not evaluated |
| Return Traffic | Must be allowed | Auto allowed |

---

## Key Takeaway

Security Groups protect **instances**  
NACLs protect **subnets**

Both must allow traffic for communication to succeed.

---

✅ **Document complete**
