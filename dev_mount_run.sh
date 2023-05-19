#!/bin/bash

export DEV_ADDRESS=
export DEV_USER=
export DEV_PORT=
export DEV_DIRECTORY= #DIRECTORY TO BE MOUNTED
export DEV_MOUNT_POINT= #PATH TO MOUNT POINT

case $1 in

	"-m")
		/usr/local/bin/dev_mount.sh
	;;

	"-u")
		umount "$DEV_MOUNT_POINT"
	;;
esac
