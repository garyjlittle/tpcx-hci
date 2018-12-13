#! /usr/bin/env bash 

for vm in NXT{1,2,3,4}G{1,2,3,4}VM{2,3}
do 
  ssh root@$vm "./restore.sh >> restore.log &"
  ssh root@$vm touch fff
done 
