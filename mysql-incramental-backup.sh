#!/bin/bash
export MYSQL_HOME=/usr/local/Percona-Server-5.5.21-rel25.0-227.Linux.x86_64/
export PATH=$MYSQL_HOME/bin:$PATH

mysql_backup_dir=/data/mysql/
mysql_username="root"
mysql_password="ADMINouma@2022"

cd $mysql_backup_dir
lastincrementfolder=`ls -l|grep ^d| tail -n 1 | awk '{print $9}'`
timeStart=$(date '+%F-%H-%M-%S')
logfile=increment-$timeStart.log
innobackupex --incremental $mysql_backup_dir --incremental-basedir=$lastincrementfolder --user=$mysql_username --password=$mysql_password --stream=tar  2> "$logfile" |gzip > $mysql_backup_dir/$timeStart.sql.gz



#压缩数据

#innobackupex --incremental $mysql_backup_dir --incremental-basedir=$lastincrementfolder --user=$mysql_username --password=$mysql_password 2> "$logfile" |gzip >$mysql_backup_dir/`date +%F-%H:%M:%S`.sql.gz
