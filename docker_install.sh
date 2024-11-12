#!/bin/bash

# Update and install prerequisites
sudo yum update -y
sudo yum install -y curl wget git

# Install Docker
sudo amazon-linux-extras install docker -y
sudo systemctl start docker
sudo usermod -aG docker $USER

# Enable Docker to start on boot
sudo systemctl enable docker

# Install Docker Compose
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')
sudo curl -L "https://github.com/docker/compose/releases/download/v${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Create a symbolic link for Docker Compose in /usr/bin for easier access
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Verify Docker and Docker Compose installations
echo "Verifying Docker installation..."
docker --version

echo "Verifying Docker Compose installation..."
docker-compose --version

