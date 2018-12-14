# tpcx-hci
Scripts which support working with the TPCx-HCI benchmark.  The database hosts are named as

* NXT[Tile Number]G[Group Number][VM]VM-Number

* Tile-Number is the global tile number as defined in the TPCx-HCI benchmark.  For instance in a 4 Node cluster, with a single tile per Node. There will be 4 tiles - one per node.

* The Group-Number is the Group-Name within the tile.  E.g. There are 4 Groups (Applications) per tile.

* The VM Number is the name of the specific VM in the group.  e.g.  
  * VM1 is the Java client
  * VM2 is the Postgres DB which does the IO heavy work
  * VM3 is the Postgres DB which does the CPU intensive work.

- - - -

* pg-hosts : A Space separated hostfile containing the names of the VM2,VM3 (Postgres VMs)
* vacuum-remote.sh : Connects to all the hosts defined in pg-hosts and issues a "vacuum" command against the database named tpcv

- - - -

If we need to be able to access a PG database from any remote host (insecure) then we just put

> host    all             all             all                     trust

in the pg_hba.conf and bounce the database.
