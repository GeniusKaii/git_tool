#!/bin/bash
SEPARATE_LINE="\033[35m--------------------------------\033[0m"
echo -e "\033[36m######################\033[0m"
echo -e "\033[36m#   HELM PWD UPDATE  #\033[0m"
echo -e "\033[36m#   author Kaii      #\033[0m"
echo -e "\033[36m#   version 1.0.0    #\033[0m"
echo -e "\033[36m######################\033[0m"
echo
echo -e "\033[36mAUTO UPDATE STARTING\033[0m"
echo -e $SEPARATE_LINE

echo -e "\033[35mReading credentials\033[0m"
pwd="" # custom to read your password here
username="" # custom to set your username here

echo -e $SEPARATE_LINE
helm repo list | awk 'NR > 1' | while read name link
do 
	echo -e "\033[35mhelm repo remove $name\033[0m"
	helm repo remove $name
	echo -e "\033[35mhelm repo add $name $link --username $username --password <pwd>\033[0m"
	helm repo add $name $link --username $username --password $pwd
done
echo -e $SEPARATE_LINE
echo -e "\033[35mhelm repo list\033[0m"
helm repo list
echo -e $SEPARATE_LINE
echo -e "\033[35mhelm repo update\033[0m"
helm repo update
echo -e $SEPARATE_LINE
echo -e "\033[36mAUTO UPDATE FINISHED\033[0m"
