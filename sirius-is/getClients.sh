#!/bin/bash

if [ $# -ne 4 ];
then
    echo "Параметров должно быть 4 ...."
    echo "usage: ./read_clients.sh <host> <system_name> <profile_name> <file_name>"
    exit 0
fi

IFS=$'\n'
val1=1

echo "Working ...."

while [ $val1 -gt 0 ];
do
    tt=`date "+%d.%m.%Y %T"`
    echo "($tt)  =====================================================" >> $4_.log
    echo "($tt)  =====================================================" >> $4_count_.log
    
    rlt_itbl -host $1 -system $2 -profile $3 -name /$2/$3/admprm -table Clients >> $4_.log
    val2=0
    for var in $(rlt_itbl -host $1 -system $2 -profile $3 -name /$2/$3/admprm -table Clients)
    do
	let "val2=val2+1"
    done
    echo "($tt) Всего клиентов: $val2" >> $4_count_.log
    sleep 5
done
