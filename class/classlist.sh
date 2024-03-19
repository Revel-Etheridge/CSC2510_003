#!/bin/bash

#checking number of arguments sent
if [ "$#" -ne 2 ]
then
    echo ""
    echo "Incorrect number of arguments sent."
else
    echo ""
    echo "Correct number of arguments received."
fi

#saving arguments
argument1=$1
argument2=$2
#creating placeholder for username check
userFound=0

#checking first argument is a file
if [[ -f $argument1 ]]; then
    echo "$1 is a file"
    #opening the file and searching for given username
    #requires new line after last username
    while IFS= read -r username
        do
            if [[ $argument2 = $username ]]; then
                echo "Username found! Found on line: "  
                grep -n "$argument2" classlist.txt
                (( userFound = 1 ))
            fi
    done < classlist.txt

    #branching in case of failed search
    if [[ $userFound = 0 ]]; then
        echo "Username $argument2 was not found."
    fi
else
    echo "$1 is not a file, please try again."
fi
