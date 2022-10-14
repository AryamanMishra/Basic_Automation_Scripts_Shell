#!/bin/bash

echo "Enter file name"

read fileName

declare -a path=($(find /home -type f -name $fileName))

if [ -z $path ]; 
then
	echo "File by this name does not exists"
else

	echo ""
	len=${#path[@]}
	if (( $len == 1 )); 
	then
		echo "The file exists at: "
	       	echo ${path[0]}
		p=${path[0]}
		
		lastslash=0

		for (( i=0;i<${#p};i++ ));
		do
			if [ "${path:$i:1}" = '/' ]; then
				lastslash=$i
			fi
		done
		
		echo $lastslash
		echo ""
		cd_path=`cut -c 1-$lastslash <<<$p`
		echo "Its permissions are: "
		cd $cd_path

		lsperm=`ls -la $fileName`
		perm=`cut -c 2-10 <<< $lsperm`
		echo $perm

		echo "Owner : `cut -c 1-3 <<< $perm`"
		echo "Group users : `cut -c 4-6 <<< $perm`"
		echo "Other users : `cut -c 7-9 <<< $perm`"
		
	else
	
		echo "The file exists at the following locations: "

		for (( i=0;i<$len;i++ ));
		do
			echo " $i : ${path[$i]}"
		done
		
		echo ""
		echo "Enter the file you want to get permissions of (enter index like 0,1) "
		read index
	
		echo ""
		p=""
		for (( i=0;i<$len;i++ ));
		do
			if (( $i == $index )); 
			then
				p=${path[$i]}
			fi
		done

		echo "The entered index is : $index"
		echo ""
		echo "The file exists at: "
		echo $p
		
		lastslash=0

		for (( i=0;i<${#p};i++ ));
		do
			if [ "${p:$i:1}" = '/' ]; 
			then
				lastslash=$i
			fi
		done
		
		echo ""
		
		cd_path=`cut -c 1-$lastslash <<<$p`
		echo "Its permissions are: "
		cd $cd_path

		lsperm=`ls -la $fileName`
		perm=`cut -c 2-10 <<< $lsperm`
		echo $perm

		echo "Owner : `cut -c 1-3 <<< $perm`"
		echo "Group users : `cut -c 4-6 <<< $perm`"
		echo "Other users : `cut -c 7-9 <<< $perm`"
	fi

fi



