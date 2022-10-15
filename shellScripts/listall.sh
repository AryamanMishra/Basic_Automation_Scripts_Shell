#!/bin/bash

echo "This command assumes you have set shellScripts folder in your PATH as stated in readme"


SUB="/shellScripts/"

len=14
if [[ "$PATH" == *"$SUB"* ]]; 
then
	echo "To run them just type the command as it is, from anywhere in the file system (for example "doscp.sh") "
	echo ""
	echo "All shell commands in shellScripts folder :- "
	colon=1
	end=0
	len=${#PATH}
	for (( i=0;i<$len;i++ ));
	do
		if [[ "${PATH:$i:1}" = ':' ]];
		then
			colon=$i
			colon=$((colon + 1))
		fi
		if [[ "${PATH:$i:14}" == "$SUB" ]]; 
		then
			end=$i
			end=$((end + 14))
			break
		fi
	done
		
	colon=$((colon + 1))
	echo ""	
	finalpath=`cut -c $colon-$end <<< "$PATH"`

	cd $finalpath
	
	declare -a list=(`ls`)
	for (( i=0;i<${#list};i++ ));
	do
		if [[ ${list[$i]} == *.sh ]];
		then
			echo ${list[$i]}
		fi
	done
	
else
	echo "Nothing to display as path not set"
fi	
