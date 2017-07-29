#!/bin/bash

#set -x
account=$1
if [ "$1" == "-h" ];
then
echo Pwned Help
echo	Usage :
echo 	-e	"pwned -h \t		 /Shows Help"
echo	-e	"pwned title@email.com \t \t /Gives Information	"
exit
fi
clear
echo "Using Email $account"
echo "If it is not in the format test@mail.com"
echo "then press Ctrl+C and put it in the correct format"
echo "Press enter to continue"

read nothing
echo "Checking if you have been Pwned"
curl -s -o raw_data.json "https://haveibeenpwned.com/api/v2/breachedaccount/"$account""
clear
jq ".[]" raw_data.json > semi.json 
jq .Title semi.json > final.txt
echo "You Have Been Pwned at/in/by"
sed 's/\"//g' final.txt


