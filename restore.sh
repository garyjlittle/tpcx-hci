#!/usr/bin/bash

systemctl stop postgresql-9.3.service; 
cd /dbstore; 
rm -rf tpcv-data/pg_xlog/* tpcv-data tpcv-index tpcv-temp; 
lbzip2 -d /dbstore/tpcv-backup.cpio.bz2 -c | cpio -idm
chown -R postgres:postgres /dbstore; 
systemctl start postgresql-9.3.service

