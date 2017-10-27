#!/bin/bash

set x

declutter(){
	rm breach.json
	rm semibreach.json
	rm breach.txt
	rm pasteacc.json
	rm semipaste.json
	rm pasteacc.txt
}

header(){
	
echo "  ___                     _   ___  ";
echo " | _ \__ __ ___ _  ___ __| | |__ \ ";
echo " |  _/\ V  V / ' \/ -_) _\` |   /_/ ";
echo " |_|   \_/\_/|_||_\___\__,_|  (_)  ";
echo "                                  ";
 
}

main(){
	clear
header
echo "Enter your Email Address (For eg xyz@mail.com)"
read account
clear
header
echo ""
echo "Checking if you have been Pwned"
curl -s -o breach.json "https://haveibeenpwned.com/api/v2/breachedaccount/$account"
curl -s -o pasteacc.json "https://haveibeenpwned.com/api/v2/pasteaccount/$account"
#curl -s -o pwnedpassword.json "https://haveibeenpwned.com/api/v2/pwnedpassword/"$account""

clear
jq ".[]" breach.json > semibreach.json 
jq .Title semibreach.json > breach.txt
jq ".[]" pasteacc.json > semipaste.json 
jq .Title semipaste.json > pasteacc.txt
#jq ".[]" pwnedpassword.json > semipwnedpassword.json 
#jq .Title semipwnedpassword.json > pwnedpassword.txt
header
echo ""
echo ""
echo  -e "\e[1;97;44mYou Have Been Pwned at :\e[1;92;49m"
sed 's/\"//g' breach.txt
echo -e "\e[1;97;44mYou have been featured in these Pastes :\e[1;92;49m"
sed 's/\"//g' pasteacc.txt
#echo "Your Pwned Passwords are at :"
#sed 's/\"//g' pwnedpassword.txt

declutter
}

clear
main
