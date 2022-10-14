#!/bin/bash

echo "This command assumes you have set shellScripts folder in your PATH as stated in readme"


SUB="/basic_automation_scripts_shell/shellScripts/"

if [[ "$PATH" == *"$SUB"* ]]; 
then
	echo $PATH
else
	echo "Nothing to display as path not set"
fi	
