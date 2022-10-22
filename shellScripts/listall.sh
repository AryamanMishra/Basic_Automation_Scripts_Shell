#!/bin/bash


# command to list all commands/scripts provided in this repo
echo "This command assumes you have set shellScripts folder in your PATH as stated in readme"


# string to be searched in the path
SUB="/shellScripts/"


# length of the above string
lenSub=${#SUB}


# if PATH string contains substring SUB
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
		# check if the character is a colon if so keep saving its index in 1 index
		if [[ "${PATH:$i:1}" = ':' ]];
		then
			colon=$i
			colon=$((colon + 1))
		fi

		# if the substring is equal to SUB save its starting index in end and then increase end bu lenSub
		if [[ "${PATH:$i:$lenSub}" == "$SUB" ]]; 
		then
			end=$i
			end=$((end + $lenSub))
			break
		fi
	done
	
	# increasing colon by when as we need later string to cd to finalpath
	colon=$((colon + 1))

	echo ""

	# saving finalpath to be cd'ed to	
	finalpath=`cut -c $colon-$end <<< "$PATH"`

	cd $finalpath
	

	# saving ls cmd output in list array
	declare -a list=(`ls`)
	for (( i=0;i<${#list};i++ ));
	do	

		# saving all filenames ending with .sh in list array
		if [[ ${list[$i]} == *.sh ]];
		then

			# display the filename
			echo ${list[$i]}
		fi
	done
	
else

	# no path found output
	echo "Nothing to display as path not set"

fi	
