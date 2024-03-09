#!/bin/bash

#checking number of arguments sent
if [ "$#" -ne 2 ]
then
    echo "Incorrect number of arguments sent."
else
    echo "Correct number of arguments received."
fi

#saving arguments
argument1=$1
argument2=$2

#checking first argument is a file
if [[ -f $argument1 ]]; then
    echo "$1 is a file"
    
    #opening the file and searching for given username
    #requires new line after last username
    while IFS= read -r username
        do
            if [[ $argument2 = $username ]]; then
                echo "Username found!"
            fi
        done < classlist.txt
else
    echo "$1 is not a file, please try again."
fi
