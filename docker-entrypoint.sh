#!/bin/bash
set -e

# Configuration
REPO_URL="${GIT_REPO_URL:-git@github.com:obaven/gitops.git}"
GIT_EMAIL="${GIT_EMAIL:-plasmidr-bot@obaven.com}"
GIT_NAME="${GIT_NAME:-Plasmidr Bot}"

echo "Starting Plasmidr Bot..."

# 1. Setup SSH
mkdir -p ~/.ssh
if [ -f "/etc/secret-volume/ssh-privatekey" ]; then
    cp /etc/secret-volume/ssh-privatekey ~/.ssh/id_rsa
    chmod 600 ~/.ssh/id_rsa
    ssh-keyscan github.com >> ~/.ssh/known_hosts
else
    echo "WARNING: No SSH key found at /etc/secret-volume/ssh-privatekey"
fi

# 2. Configure Git
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"

# 3. Clone Repo
echo "Cloning repository..."
git clone "$REPO_URL" /app/repo
cd /app/repo

# 4. Run Plasmidr
echo "Running rotation..."
plasmid rotate --scan

echo "Done."
