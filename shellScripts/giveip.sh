#!/bin/bash

# give direct ip in one line 

echo $(ifconfig | grep "broadcast") | awk '{print $2}'


