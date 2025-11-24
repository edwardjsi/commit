#!/bin/bash
# Day26 IAM Setup Script
# Creates IAM users, groups, and attaches policies

# Exit immediately if a command fails
set -e

# --- Groups ---
aws iam create-group --group-name ReadOnlyOps
aws iam create-group --group-name DevAppScoped

# --- Attach AWS Managed Policy to ReadOnlyOps ---
aws iam attach-group-policy \
  --group-name ReadOnlyOps \
  --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess

# --- Users ---
aws iam create-user --user-name analyst.readonly
aws iam create-user --user-name immanuel.dev

# --- Add users to groups ---
aws iam add-user-to-group --user-name analyst.readonly --group-name ReadOnlyOps
aws iam add-user-to-group --user-name immanuel.dev --group-name DevAppScoped

# --- Customer Managed Policy (Dev S3 Scoped) ---
aws iam create-policy \
  --policy-name DevS3AppScoped \
  --policy-document file://Day26/policies/dev-s3-app-scoped.json

# Attach custom policy to DevAppScoped group
aws iam attach-group-policy \
  --group-name DevAppScoped \
  --policy-arn arn:aws:123456789012:policy/DevS3AppScoped

# --- MFA Enforcement Policy (Optional) ---
aws iam create-policy \
  --policy-name EnforceMFA \
  --policy-document file://Day26/policies/enforce-mfa.json

aws iam attach-group-policy \
  --group-name DevAppScoped \
  --policy-arn arn:aws:123456789012:policy/EnforceMFA

echo "✅ Day26 IAM setup complete."
