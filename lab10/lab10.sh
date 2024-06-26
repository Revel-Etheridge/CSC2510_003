#!/bin/bash

#determining which file will be checked
if [ -z "$1" ]; then
    checkFile="phonebook.dat"
else 
    checkFile="$1"
fi

#Declarations for printing in color
HI='\033[0;32m'
NORMAL='\033[0m'

#Problem 1
echo -e "${HI}1. Starts or ends with Jose.$NORMAL"
grep -E -m10 '^Jose|Jose$' $checkFile


#Problem 2
echo -e "${HI}2. Contain a sequence of at least 27 upper or lower-case alphabetic characters.$NORMAL"
grep -E -i -m10 '[a-zA-Z]{27}' $checkFile


#Problem 3
echo -e "${HI}3. Consists of more than 18 characters. The characters can be anything, including alphabetic and numeric.$NORMAL"
grep -E  -i -m10 '.{18}' $checkFile


#Problem 4
echo -e "${HI}4. Contains exactly 10 characters.  The characters can be anything, including alphabetic and numeric.$NORMAL"
grep -E -i -m10 '^.{10}$' $checkFile


#Problem 5
echo -e "${HI}5. Contains a sequence between 6 and 8 upper- or lower-case alphabetic characters. The sequence must be separated from the rest of the line by a space or tab on each side.$NORMAL"
grep -E -m10 '(^|\s)[A-Za-z]{6,8}(\s|$)' $checkFile


#Problem 6
echo -e "${HI}6. Contains a local phone number. For example: 123-4567.$NORMAL"
grep -E -m10 '^([0-9]{3}-[0-9]{4}|[^-][0-9]{3}-[0-9]{4})' $checkFile



#Problem 7
echo -e "${HI}7. Contains a valid URL on a line by itself.$NORMAL"
grep -E  -i -m10 '^(http|HTTP)://[a-zA-Z]+\.[a-zA-Z]+\.(com|edu)$' $checkFile


