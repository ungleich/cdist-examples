#!/bin/bash
fchosts=''
lip='-i'
for i in $(ls /sys/class/fc_host/); do
    fchosts="${fchosts},${i#host}"
done
fchosts=${fchosts#,}
lunc=0
lunc=$( ( for i in $(ls -d /sys/bus/scsi/devices/[0-9]:*); do 
echo ${i##*:}
done ) | sort -n | tail -n 1 )
lune=$(( lunc + 8 ))
/usr/bin/rescan-scsi-bus.sh --hosts="$fchosts" $lip -L $lune -r
sleep 0.5
