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
#creating arrays for valid inputs
validPos=("Y" "y" "Yes" "yes")
validNeg=("N" "n" "No" "no")
#creating check placeholder for input validatiion
userChoice=""
validInput=0
addUser=0
fixList=0

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

        #while loop for input validation
        while [ $validInput = 0 ]; do
                read -p "Would you like to add $argument2 to $argument1? " userChoice
                #checking if user's choice is valid
                for ((i = 0; i < 4; i++ )); do
                    if [[ $userChoice = ${validPos[$i]} ]]; then
                        (( validInput=1 ))
                        (( addUser=1 )) 
                    fi
                    if [[ $userChoice = ${validNeg[$i]} ]]; then
                        (( validInput=1 )) 
                    fi
                done
        done

        #
        if [[ $addUser = 1 ]]; then

            #getting user input and validating       
            (( validInput = 0 ))
            while [ $validInput = 0 ]; do
                    read -p "Would you like to alphabetize $argument1 after adding $argument2? " userChoice
                    #checking if user's choice is valid
                    for ((i = 0; i < 4; i++ )); do
                        if [[ $userChoice = ${validPos[$i]} ]]; then
                            (( validInput=1 ))
                            (( fixList=1 )) 
                        fi
                        if [[ $userChoice = ${validNeg[$i]} ]]; then
                            (( validInput=1 )) 
                        fi
                    done
            done
        fi

    fi
else
    echo "$1 is not a file, please try again."
fi
