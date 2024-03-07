#!/bin/bash
echo $#
if [ "$#" -ne 2 ]
then
    echo "Incorrect number of arguments sent."
else
    echo "Correct number of arguments received."
fi