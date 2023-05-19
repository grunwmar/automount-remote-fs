#!/bin/bash

if    [ -z $DEV_ADDRESS ] |
      [ -z $DEV_USER ] |
      [ -z $DEV_PORT ] |
      [ -z $DEV_DIRECTORY ] |
      [ -z $DEV_MOUNT_POINT ];

then
	echo "Invalid input variables"
	exit 1

fi

# set waiting intervals in case connection loss
SSHOPT='ssh -o ServerAliveInterval=5 -o ServerAliveCountMax=3'

# mount command
SSH_MOUNT="sshfs -p $DEV_PORT -o ssh_command=$SSHOPT -o allow_other $DEV_USER@$DEV_ADDRESS:$DEV_DIRECTORY $DEV_MOUNT_POINT"


# infinite while loop to check when the device appears on the addess
while true; do
	if [ -z "$(ls -A $DEV_MOUNT_POINT)" ]; then

		ssh -p $DEV_PORT $DEV_USER@$DEV_ADDRESS
		SSH_STATUS=$?
		echo "return code: "$SSH_STATUS
		whoami

		if [[ $SSH_STATUS == 0 ]]; then
			if $SSH_MOUNT; then
				echo "Device on $DEV_ADDRESS has been mounted."

			else
				echo "Failed (sshfs $?). Device on $DEV_ADDRESS has not been mounted. (mount failed mount $DEV_USER@$DEV_ADDRESS:$DEV_DIRECTORY -> $DEV_MOUNT_POINT)"
			
			fi
			  
		else
			echo "Failed (ssh $?). Device on $DEV_ADDRESS has not been mounted. (connection failed $DEV_USER@$DEV_ADDRESS:$DEV_PORT)"

		fi
		sleep 1

	else
		sleep 1

	fi
done

