#!/bin/bash
LOCKFILE=/tmp/arp-table.lock
already_locked() {
	echo "lock is already held, exiting"
	exit 1
}

while(true)
do
exec 200>$LOCKFILE
flock -n 200 || already_locked
arp -vn -i enp0s3 >> /demo/log.txt
date +"%H:%M:%S" >> /demo/log.txt
echo "---------------" >> /demo/log.txt
sleep 60
done

echo "releasing lock, done"
