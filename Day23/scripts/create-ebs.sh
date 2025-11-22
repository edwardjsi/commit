#!/bin/bash
# Purpose: Create and attach an EBS volume to an EC2 instance
# create-ebs.sh


SIZE=2                # Size in GB
AZ="us-east-1a"       # Availability Zone (must match your EC2 instance)
INSTANCE_ID="i-xxxxxxxxxxxx"   # Replace with your EC2 instance ID
DEVICE_NAME="/dev/sdf" # Logical device name for attachment

VOLUME_ID=$(aws ec2 create-volume \
  --size $SIZE \
  --availability-zone $AZ \
  --volume-type gp3 \
  --query 'VolumeId' \
  --output text)

echo "Created volume: $VOLUME_ID"

aws ec2 wait volume-available --volume-ids $VOLUME_ID

aws ec2 attach-volume \
  --volume-id $VOLUME_ID \
  --instance-id $INSTANCE_ID \
  --device $DEVICE_NAME

echo "Attached volume $VOLUME_ID to instance $INSTANCE_ID at $DEVICE_NAME"
