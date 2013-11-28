cat << eof
#!/bin/sh
#
# mounts crypted device interactively and starts depending services

while [ ! -e "/dev/mapper/$dmdevice" ]
do
  echo 'Unlocking luks device $device'
  cryptsetup luksOpen "$device" "$dmdevice"
done
fsck  "/dev/mapper/$dmdevice"
mount "/dev/mapper/$dmdevice" "$mountpoint"
eof

if [ -n "$start" ]; then
    echo "$start"
fi
