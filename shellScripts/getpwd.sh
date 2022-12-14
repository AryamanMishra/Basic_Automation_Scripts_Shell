#!/bin/bash


### bash script to generate random password



# input required password length from user 
echo "Enter the length of password you want(between 4 and 32)"

read len


# alphabet, numbers and special characters array to get random characters
declare -a nums=("1" "2" "3" "4" "5" "6" "7" "8" "9" "0")

declare -a alpha=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z")
	
declare -a alphaCap=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")

declare -a spec=("!" "@" "#" "%" "*" "?" "-")


# checking input length
if (( $len < 4 || $len > 32));
then
	echo "Invalid password length"

else

	passwd=''
	
	# checking if password can contain special characters
	echo "Can the password have special characters (enter Y or N)"
	read speccheck
	
	if [[ "$speccheck" = "Y" ]];
	then

		for (( i=1;i<=$len;i++));
		do
			# generating random number from 1 to 3 to decide which array will give the current character
			arraynum=`shuf -i 1-3 -n 1`
			
			# take ch from nums array
			if (( $arraynum == 1 ));
			then
				arraylen=${#nums[@]}
				arraylen=$((arraylen - 1))
				rdidx=`shuf -i 0-$arraylen -n 1`
				passwd+=${nums[rdidx]}
			
			# take ch from alphabet array
			elif (( $arraynum == 2 ));
			then
				arraylen=${#alpha[@]}
				arraylen=$((arraylen - 1))
				rdidx=`shuf -i 0-$arraylen -n 1`
				passwd+=${alpha[rdidx]}
				
			# take ch from special characters array
			else
				arraylen=${#spec[@]}
				arraylen=$((arraylen - 1))
				rdidx=`shuf -i 0-$arraylen -n 1`
				passwd+=${spec[rdidx]}
			fi
		done

	elif [[ "$speccheck" = "N" ]];
	then
		
		for (( i=1;i<=$len;i++));
		do
			# generating random number from 1 to 3 to decide which array will give the current character
			arraynum=`shuf -i 1-3 -n 1`
			
			# take ch from nums array
			if (( $arraynum == 1 ));
			then
				arraylen=${#nums[@]}
				arraylen=$((arraylen - 1))
				rdidx=`shuf -i 0-$arraylen -n 1`
				passwd+=${nums[rdidx]}
				
			# take ch from alphabet array
			elif (( $arraynum == 2 ));
			then
				arraylen=${#alpha[@]}
				arraylen=$((arraylen - 1))
				rdidx=`shuf -i 0-$arraylen -n 1`
				passwd+=${alpha[rdidx]}
				
			# take ch from caps alphabet array
			else
				arraylen=${#alphaCap[@]}
				arraylen=$((arraylen - 1))
				rdidx=`shuf -i 0-$arraylen -n 1`
				passwd+=${alphaCap[rdidx]}
			fi
		done

	else 
		# if user entered response other than Y or N
		echo "Please enter a valid response"
	fi

	echo "Password: "
	echo $passwd
fi

