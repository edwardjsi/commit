
# Day ****38 – Terraform Lifecycle Management, AMI Pipeline & EBS Volumes

## Goal
Successfully deploy a modular EC2 instance pipeline using Terraform, implementing a custom AMI creation, dynamic naming, and attaching a new Elastic Block Store (EBS) data volume.

## What I did
* **Troubleshooting and Fixes:** Diagnosed and corrected state synchronization issues after a failed deployment, culminating in a successful `terraform apply`.
* **AMI Pipeline Execution:** Successfully ran the 4-resource pipeline: created the security group, launched the base instance (`aws_instance.example`), waited for the custom AMI creation, and launched the final web server (`aws_instance.webserver`) using the custom image.
* **Dynamic Resource Naming:** Provided the final instance name (`var.webserver_name`) via prompt, proving ability to use dynamic inputs for resource tagging.
* **Cost Optimization:** Modified the configuration to comment out the base image builder instance (`aws_instance.example`) and ran `terraform apply` to ensure its automatic termination and cost saving.
* **Feature Expansion (EBS):** Defined and attached a new 20 GB General Purpose (GP2) EBS volume using the `aws_ebs_volume` and `aws_volume_attachment` resources, ensuring the volume was placed in the same Availability Zone (AZ) as the instance using interpolation.

## What this proves
* I can **manage resource dependencies** (e.g., ensuring the final instance waits for the AMI, and the volume waits for the instance's AZ).
* I understand the **difference between state and console** and know how to use tools like `terraform state list` and perform manual termination when state is lost or corrupted.
* I can implement **infrastructure-as-code best practices** by using modules (`.tfvars`), dynamic variables, and resource tags.
* I understand the full lifecycle: **Create $\rightarrow$ Modify $\rightarrow$ Destroy/Optimize**.

## How this helps a client/employer
* I can help you set up **robust, reproducible infrastructure pipelines** for application servers, ensuring every server starts from a verified "golden" image.
* I can troubleshoot **deployment failures and drift** by examining state files and AWS console logs to ensure infrastructure is running as code-defined.
* I can help **design scalable and cost-effective solutions** by separating application data onto persistent EBS volumes and ensuring temporary build resources are terminated quickly.
