#!/bin/bash

echo "Copying dev_mount.sh to usr/local/bin/dev_mount.sh"
cp dev_mount.sh /usr/local/bin/dev_mount.sh
chmod +x /usr/local/bin/dev_mount.sh

echo "Copying dev_mount_run.sh to usr/local/bin/dev_mount_run.sh"
cp dev_mount_run.sh /usr/local/bin/dev_mount_run.sh
chmod +x /usr/local/bin/dev_mount_run.sh

echo "Copying mount-dev.service to usr/local/bin/mount-dev.service"
cp mount-dev.service /etc/systemd/system/mount-dev.service
chmod +x /etc/systemd/system/mount-dev.service

echo "Reloading systemd"
systemctl daemon-reload

echo "Enabling mount-dev"
systemctl enable mount-dev

echo "Done."