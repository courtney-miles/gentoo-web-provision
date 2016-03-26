#!/bin/bash
#
# Mounts the second virtual disk for storing the MySQL database.
#

DISK_DEV=/dev/sdb
DEVICE=${DISK_DEV}1
MNT_NAME=mysql
FS_TYPE=ext4
MNT_POINT=/var/lib/mysql

# fdisk the disk if it's not a block device already:
[ -b $DEVICE ] || echo ,,8e | sfdisk $DISK_DEV
echo "fdisk returned:  $?"

# Create the filesytem if it doesn't already exist
[[ `blkid | grep $DEVICE | grep $FS_TYPE` ]] || mkfs.$FS_TYPE $DEVICE
echo "$FS_TYPE creation return:  $?"
# Create mountpoint #{mnt_point}
[ -d $MNT_POINT ] || mkdir -p $MNT_POINT
# Update fstab with new mountpoint name
[[ `grep -i $DEVICE /etc/fstab` ]] || echo $DEVICE $MNT_POINT $FS_TYPE noatime 0 2 >> /etc/fstab
echo "fstab update returned:  $?"
# Finally, mount the partition
[[ `mount | grep $MNT_POINT` ]] || mount $DEVICE $MNT_POINT
echo "$MNT_POINT mounting returned:  $?"
exit $?
