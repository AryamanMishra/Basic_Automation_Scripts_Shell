#!/bin/bash

#scp -r mapreduce aryamanm09@ip:path

echo "Enter File or Folder name: "
read f_name

echo "Enter User name for connecting machine"
read user_name

echo "Enter IP of connecting machine"
read ip

echo "Enter Destination Path"
read dest_path

if [ -d "$f_name" ]; then
	scp -r $f_name $user_name@$ip:$dest_path
elif [ -f "$f_name" ]; then
	scp $f_name $user_name@ip:$dest_path
else
	echo "File/Folder does not exists"
fi


