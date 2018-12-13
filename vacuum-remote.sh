#!/usr/bin/env bash -x

PATTERN=nxt
HOSTFILE=pg-hosts
let count=0
rm vacuum-count.out

echo PATTERN=$PATTERN
echo HOSTFILE=$HOSTFILE
# grep -i nxt pg-hosts |awk '{ print $2 }'
for i in `grep -i $PATTERN $HOSTFILE | awk '{ print $2 }'`  
do 
    ssh -n -f root@$i 'psql -U postgres tpcv -c vacuum & ' >> vacuum-count.out
    #ssh -n -f root@$i 'uname -a &' >> vacuum-count.out
    let count=$count+1
done
echo There were $count hosts
while true
do
    complete=`wc -l vacuum-count.out | awk '{ print $1 }'`
    echo complete=$complete
    if [[ $complete -eq $count ]] ; then
        exit 
    fi
    sleep 1
    echo $complete
done


