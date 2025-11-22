#!/bin/bash
# Purpose: Detach and delete an EBS volume from an EC2 instance

INSTANCE_ID="i-xxxxxxxxxxxx"   # Replace with your EC2 instance ID
VOLUME_ID="vol-xxxxxxxxxxxx"   # Replace with your EBS volume ID

# 1. Detach the volume
echo "Detaching volume $VOLUME_ID from instance $INSTANCE_ID..."
aws ec2 detach-volume --volume-id $VOLUME_ID --instance-id $INSTANCE_ID

# Wait until volume is detached
aws ec2 wait volume-available --volume-ids $VOLUME_ID

# 2. Delete the volume
echo "Deleting volume $VOLUME_ID..."
aws ec2 delete-volume --volume-id $VOLUME_ID

echo "Volume $VOLUME_ID deleted successfully."
