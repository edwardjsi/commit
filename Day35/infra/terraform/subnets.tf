# Day 35 – Terraform Subnets with Loops

## Goal
Create multiple public and private subnets efficiently using Terraform loops.

## What I did
- Defined public and private subnet layouts using structured Terraform locals.
- Used `for_each` to generate multiple subnets from a single resource block.
- Configured public subnets with auto public IPs and private subnets without them.
- Applied consistency through tagging for environment, type, and ownership.

## What this proves
- I can use Terraform as a modeling tool, not just a syntax tool.
- I understand why `for_each` is safer than `count` for long-term infrastructure.
- I can design network layouts that are predictable and scalable.
- I know how public and private subnets differ at a behavior level.

## How this helps a client/employer
- I can design scalable AWS network architectures using Infrastructure as Code.
- I can eliminate repetitive subnet definitions and reduce configuration errors.
- I can safely modify subnet layouts without causing unnecessary destruction.
- I can standardize environments using tagging and naming conventions.
