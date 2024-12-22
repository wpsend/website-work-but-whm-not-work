#!/bin/bash

echo "Starting cPanel Fix Script..."

# Force update cPanel
echo "Updating cPanel..."
/usr/local/cpanel/scripts/upcp --force

# Open firewall ports
echo "Opening firewall ports..."
firewall-cmd --permanent --add-port=2082-2096/tcp
firewall-cmd --reload

# Update the system
echo "Updating system packages..."
yum update -y

# Reinstall glibc library
echo "Reinstalling glibc library..."
yum reinstall -y glibc

# Restart cPanel service
echo "Restarting cPanel service..."
/scripts/restartsrv_cpsrvd

echo "All tasks completed. Please check the status!"
