# Day23 – EC2 EBS Lifecycle Automation

## Introduction
In this exercise, we are building a reproducible workflow for managing Amazon EC2 storage volumes (EBS).  
The goal is to automate the **full lifecycle** of an EBS volume:
1. Provisioning (create and attach a new volume to an EC2 instance)
2. Configuration (formatting, mounting, and persisting the volume inside the instance)
3. Cleanup (detaching and deleting the volume when it is no longer needed)

By splitting the workflow into three modular shell scripts, we achieve clarity, reusability, and interview‑ready documentation. Each script has a specific role in the lifecycle, and together they demonstrate disciplined DevOps practices.

---

## Step‑by‑Step Workflow
1. **Create and attach the volume** using `create-ebs.sh` (runs with AWS CLI outside the instance).
2. **Format and mount the volume** using `interactive-ebs.sh` (runs inside the EC2 instance).
3. **Detach and delete the volume** using `cleanup-ebs.sh` (runs with AWS CLI outside the instance).

---

## Script 1: `create-ebs.sh`
**Purpose:**  
Automates the creation of a new EBS volume and attaches it to a running EC2 instance.  
This replaces the manual process of clicking through the AWS Console.

**Code Explanation:**
```bash
SIZE=2                # Size of the volume in GB
AZ="us-east-1a"       # Availability Zone (must match the EC2 instance)
INSTANCE_ID="i-xxxxxxxxxxxx"   # EC2 instance ID
DEVICE_NAME="/dev/sdf" # Logical device name for attachment

# Create the volume
VOLUME_ID=$(aws ec2 create-volume --size $SIZE --availability-zone $AZ --volume-type gp3 --query 'VolumeId' --output text)

# Wait until the volume is available
aws ec2 wait volume-available --volume-ids $VOLUME_ID

# Attach the volume to the instance
aws ec2 attach-volume --volume-id $VOLUME_ID --instance-id $INSTANCE_ID --device $DEVICE_NAME


Script 2: 

Purpose:
Runs inside the EC2 instance to prepare the raw volume for use.

It interactively asks for the device name and mount point, then formats, mounts, and updates  for persistence.
Code Explanation:

read -p "Enter the device name (e.g., /dev/nvme1n1): " DEVICE
read -p "Enter the mount point directory (e.g., /data): " MOUNTPOINT

# Validate device and mount point
if [ ! -b "$DEVICE" ]; then echo "Error: $DEVICE not found."; exit 1; fi
if [ ! -d "$MOUNTPOINT" ]; then sudo mkdir -p $MOUNTPOINT; fi

# Format if not ext4
FS_TYPE=$(sudo file -s $DEVICE | grep -o 'ext4')
if [ -z "$FS_TYPE" ]; then sudo mkfs.ext4 $DEVICE; fi

# Mount the device
sudo mount $DEVICE $MOUNTPOINT

# Add to /etc/fstab for persistence
FSTAB_ENTRY="$DEVICE   $MOUNTPOINT   ext4   defaults,nofail   0   2"
if ! grep -q "$DEVICE" /etc/fstab; then echo "$FSTAB_ENTRY" | sudo tee -a /etc/fstab; fi

# Verify
df -h | grep $DEVICE

 	Prompts the user for device name and mount point.
• 	Checks if the device is already formatted; if not, runs mkfs.ext4
• 	Mounts the device to the chosen directory.
• 	Updates /etc/fstab so the mount persists after reboot.
• 	Prints verification with df -h.

Script 3: 

Purpose:
Automates safe teardown of the EBS volume.
Detaches the volume from the EC2 instance and deletes it, preventing orphaned resources and unnecessary costs.

Code Explanation:

INSTANCE_ID="i-xxxxxxxxxxxx"   # EC2 instance ID
VOLUME_ID="vol-xxxxxxxxxxxx"   # EBS volume ID

# Detach the volume
aws ec2 detach-volume --volume-id $VOLUME_ID --instance-id $INSTANCE_ID

# Wait until volume is available (detached)
aws ec2 wait volume-available --volume-ids $VOLUME_ID

# Delete the volume
aws ec2 delete-volume --volume-id $VOLUME_ID

Why Three Scripts?

• 	create-ebs.sh → Infrastructure provisioning (outside EC2).
• 	interactive-ebs.sh → Instance configuration (inside EC2).
• 	cleanup-ebs.sh → Resource teardown (outside EC2).

Splitting the workflow into three scripts makes it modular, easy to understand, and reusable. Each script has a clear purpose and can be run independently depending on the stage of the lifecycle.

Conclusion

Day23 demonstrates full lifecycle automation for EC2 EBS volumes:
• 	Provision → Configure → Cleanup.
This workflow shows disciplined DevOps practices: reproducibility, modularity, and cost‑awareness. By storing these scripts in your repo, you can quickly set up and tear down storage volumes across multiple EC2 instances, while also showcasing interview‑ready automation skills.
