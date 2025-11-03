#!/bin/bash
# Day 4: Linux user and group management

USERNAME="devops_user"
GROUPNAME="devops_team"

echo "👤 Creating user: $USERNAME"
sudo useradd -m "$USERNAME"

echo "🔐 Setting password for $USERNAME"
echo "$USERNAME:DevOps@123" | sudo chpasswd

echo "👥 Creating group: $GROUPNAME"
sudo groupadd "$GROUPNAME"

echo "➕ Adding $USERNAME to $GROUPNAME"
sudo usermod -aG "$GROUPNAME" "$USERNAME"

echo "📁 Creating shared folder for group"
sudo mkdir -p /opt/devops_shared
sudo chown root:"$GROUPNAME" /opt/devops_shared
sudo chmod 770 /opt/devops_shared

echo "✅ Done. User and group setup complete."
