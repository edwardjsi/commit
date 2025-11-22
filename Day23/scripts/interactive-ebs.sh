#!/bin/bash
# Purpose: Interactively format, mount, and persist an EBS volume on EC2

read -p "Enter the device name (e.g., /dev/nvme1n1): " DEVICE

if [ ! -b "$DEVICE" ]; then
  echo "Error: $DEVICE not found."
  exit 1
fi

read -p "Enter the mount point directory (e.g., /data): " MOUNTPOINT

if [ ! -d "$MOUNTPOINT" ]; then
  echo "Creating mount point $MOUNTPOINT..."
  sudo mkdir -p $MOUNTPOINT
fi

FS_TYPE=$(sudo file -s $DEVICE | grep -o 'ext4')
if [ -z "$FS_TYPE" ]; then
  echo "Formatting $DEVICE as ext4..."
  sudo mkfs.ext4 $DEVICE
else
  echo "$DEVICE already formatted as ext4."
fi

echo "Mounting $DEVICE at $MOUNTPOINT..."
sudo mount $DEVICE $MOUNTPOINT

FSTAB_ENTRY="$DEVICE   $MOUNTPOINT   ext4   defaults,nofail   0   2"
if ! grep -q "$DEVICE" /etc/fstab; then
  echo "Adding entry to /etc/fstab..."
  echo "$FSTAB_ENTRY" | sudo tee -a /etc/fstab
else
  echo "fstab entry already exists."
fi

echo "Verifying mount..."
df -h | grep $DEVICE
