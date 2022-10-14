#!/bin/bash


# A bash script to find and view permissions(fvp) of any file in your file system 
# without actually moving in the root where the file is (i.e) view permissions globally
# If multiple files by the same name exists the program will prompt you to choose one 


echo "Enter file name"
# prompt to enter file name
read fileName

# storing path/paths of the file found using find command in an array variable
declare -a path=($(find /home -type f -name $fileName))


# condition to check if the path variable is empty
if [ -z $path ]; 
then
	# empty "path" variable means file not found
	echo "File by this name does not exists"
else

	echo ""
	
	# getting the length of path array
	len=${#path[@]}
	
	# only one file by this name exists in the system
	if (( $len == 1 )); 
	then
		echo "The file exists at: "
	       	echo ${path[0]}
	       	
	       	# storing the path of the file
		p=${path[0]}
		
		lastslash=0

		# utility to crop the path upto the last slash so that we can cd to it 
		for (( i=0;i<${#p};i++ ));
		do
			if [ "${path:$i:1}" = '/' ]; then
				lastslash=$i
			fi
		done
		
		echo ""
		
		# cropping path p uptil last slash using cut command
		cd_path=`cut -c 1-$lastslash <<<$p`
		
		echo "Its permissions are: "
		
		
		# moving to the root of the file
		# this cd does not change our location in our shell  
		# as this bash script is running in a different process then the shell we are working on
		cd $cd_path


		# running ls -la to get all details of the file along side permissions
		lsperm=`ls -la $fileName`
		
		# cutting the output to store only permissions
		perm=`cut -c 2-10 <<< $lsperm`
		echo $perm

		# displaying user wise permissions
		echo "Owner : `cut -c 1-3 <<< $perm`"
		echo "Group users : `cut -c 4-6 <<< $perm`"
		echo "Other users : `cut -c 7-9 <<< $perm`"
		
	
	# multiple files by this file name exists
	else
	
		echo "The file exists at the following locations: "
		
		# displaying all file locations
		for (( i=0;i<$len;i++ ));
		do
			echo " $i : ${path[$i]}"
		done
		
		
		# prompting the user to enter the location index out of all locations
		echo ""
		echo "Enter the file you want to get permissions of (enter index like 0,1) "
		read index
	
		echo ""
		p=""
		
		# storing the file location the user wanted to see permissions of
		for (( i=0;i<$len;i++ ));
		do
			if (( $i == $index )); 
			then
				p=${path[$i]}
			fi
		done

		# displaying location
		echo "The entered index is : $index"
		echo ""
		echo "The file exists at: "
		echo $p
		
		
		# same utility as of single existence
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


## end of the script

