#!/bin/bash
# Day 4: User & Group Setup + Access Audit with Logging

GROUP="devops_team"
USER="devops_user"
PASSWORD="DevOps@123"
FOLDER="/opt/devops_shared"
LOG_DIR="/var/log/devops_audit"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
LOG_FILE="$LOG_DIR/access_report_$TIMESTAMP.log"

# Create log directory if it doesn't exist
sudo mkdir -p "$LOG_DIR"
sudo chown "$USER":"$GROUP" "$LOG_DIR"
sudo chmod 770 "$LOG_DIR"

log() {
    echo "$1" | tee -a "$LOG_FILE"
}

log "🚀 Starting Day 4 setup and audit at $TIMESTAMP"

# Create user
if id "$USER" &>/dev/null; then
    log "👤 User '$USER' already exists"
else
    sudo useradd -m "$USER"
    echo "$USER:$PASSWORD" | sudo chpasswd
    log "👤 Created user: $USER"
fi

# Create group
if getent group "$GROUP" &>/dev/null; then
    log "👥 Group '$GROUP' already exists"
else
    sudo groupadd "$GROUP"
    log "👥 Created group: $GROUP"
fi

# Add user to group
sudo usermod -aG "$GROUP" "$USER"
log "➕ Added $USER to $GROUP"

# Create shared folder
sudo mkdir -p "$FOLDER"
sudo chown root:"$GROUP" "$FOLDER"
sudo chmod 770 "$FOLDER"
log "📁 Shared folder created at $FOLDER with group access"

# Audit access
log "🔍 Auditing group access to $FOLDER"
GROUP_USERS=$(getent group "$GROUP" | awk -F: '{print $4}' | tr ',' '\n')

for u in $GROUP_USERS; do
    log "👤 Checking $u"
    sudo -u "$u" test -r "$FOLDER" && log "✅ $u has READ access" || log "❌ $u lacks READ access"
    sudo -u "$u" test -w "$FOLDER" && log "✅ $u has WRITE access" || log "❌ $u lacks WRITE access"
done

log "✅ Audit complete. Report saved to $LOG_FILE"
