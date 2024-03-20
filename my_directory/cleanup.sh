#!/bin/bash

#Variable declarations
totalFilesMoved=0
totalBytesMoved=0
avgFileSize=0
tempA=0
tempB=0
#Array declarations
#Indexes refer to images, documents, pdfs, executables, data, and unknown respectively
catFilesMoved=(0 0 0 0 0 0)
catBytesMoved=(0 0 0 0 0 0)
catNames=("Images" "Documents" "Pdfs" "Executables" "Data" "Unknown")


#opening correct directory
#cd my_directory

#creating directories
#creating/checking documents directory
if test -d images    #check if 'images' already exists
then
    echo "Directory documents already exists. Skipping creation."
else 
    echo "Creating images directory."
    mkdir images
fi
#creating/checking documents directory
if test -d documents    #check if 'documents' already exists
then
    echo "Directory documents already exists. Skipping creation."
else 
    echo "Creating documents directory."
    mkdir documents
fi
#creating/checking pdfs directory
if test -d pdfs    #check if 'pdfs' already exists
then
    echo "Directory pdfs already exists. Skipping creation."
else 
    echo "Creating pdfs directory"
    mkdir pdfs
fi
#creating/checking executables directory
if test -d executables    #check if 'executables' already exists
then
    echo "Directory executables already exists. Skipping creation."
else 
    echo "Creating executable directory"
    mkdir executables
fi
#creating/checking data directory
if test -d data    #check if 'data' already exists
then
    echo "Directory data already exists. Skipping creation."
else 
    echo "Creating data directory"
    mkdir data
fi
#creating/checking unknown directory
if test -d unknown    #check if 'unknown' already exists
then
    echo "Directory unknown already exists. Skipping creation."
else 
    echo "Creating unknown directory"
    mkdir unknown
fi

#searching for any files containing whitespace
for file in *\ * ;do
    set -e mv "$file" "${file// /}" 
done
#moving files to appropriate directories based on extension
#for loop to iterate through each file in the directory
#searching for images
for file in *.jpg; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[0]+=filesize))
        (( catFilesMoved[0]++ ))
        mv $file images
    fi
done
for file in *.jpeg; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[0]+=filesize))
        (( catFilesMoved[0]++ ))
        mv $file images
    fi
done
for file in *.png; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[0]+=filesize))
        (( catFilesMoved[0]++ ))
        mv $file images
    fi
done
for file in *.gif; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[0]+=filesize))
        (( catFilesMoved[0]++ ))
        mv $file images
    fi
done
#searching for documents
for file in *.txt; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[1]+=filesize))
        (( catFilesMoved[1]++ ))
        mv $file documents
    fi
done
for file in *.docx; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[1]+=filesize))
        (( catFilesMoved[1]++ ))
        mv $file documents
    fi
done
for file in *.doc; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[1]+=filesize))
        (( catFilesMoved[1]++ ))
        mv $file documents
    fi
done
for file in *.pages; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[1]+=filesize))
        (( catFilesMoved[1]++ ))
        mv $file documents
    fi
done
for file in *.key; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[1]+=filesize))
        (( catFilesMoved[1]++ ))
        mv $file documents
    fi
done
for file in *.pptx; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[1]+=filesize))
        (( catFilesMoved[1]++ ))
        mv $file documents
    fi
done
for file in *.ppt; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[1]+=filesize))
        (( catFilesMoved[1]++ ))
        mv $file documents
    fi
done
for file in *.odt; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[1]+=filesize))
        (( catFilesMoved[1]++ ))
        mv $file documents
    fi
done
for file in *.md; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[1]+=filesize))
        (( catFilesMoved[1]++ ))
        mv $file documents
    fi
done
#searching for pdfs
for file in *.pdf; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[2]+=filesize))
        (( catFilesMoved[2]++ ))
        mv $file pdfs
    fi
done

#searching for executables
for file in *; do
	if [[ -x $file ]]; then
        if [[ -f $file ]]; then
            filesize="$(stat -f %z $file)"
            (( catBytesMoved[3]+=filesize))
            (( catFilesMoved[3]++ ))  
            mv $file executables  
        fi 
	fi	
done
for file in *.sh; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[3]+=filesize))
        (( catFilesMoved[3]++ ))
        mv $file executables  
    fi
done
for file in *.exe; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[3]+=filesize))
        (( catFilesMoved[3]++ ))
        mv $file executables  
    fi
done
#searching for data
for file in *.csv; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[4]+=filesize))
        (( catFilesMoved[4]++ ))
        mv $file data  
    fi
done
for file in *.xlsx; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[4]+=filesize))
        (( catFilesMoved[4]++ ))
        mv $file data 
    fi
done
for file in *.json; do
    if test -f "$file"; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[4]+=filesize))
        (( catFilesMoved[4]++ ))
        mv $file data 
    fi
done
#searching for unknown
for file in *; do
    if [[ -f $file ]]; then
        filesize="$(stat -f %z $file)"
        (( catBytesMoved[5]+=filesize))
        (( catFilesMoved[5]++ ))
        mv $file unknown        
    fi
done

#Calculations
for((i = 0; i < 6; i++));do
    (( totalFilesMoved+=${catFilesMoved[i]} ))
    (( totalBytesMoved+=${catBytesMoved[i]} ))
done
(( avgFileSize=totalBytesMoved/totalFilesMoved ))

#Results
echo "File move complete. Total files moved: $totalFilesMoved"
echo "Total size if files moved: $totalBytesMoved"
echo "Average file size: $avgFileSize"
echo "*** Breakdown per file type ***"
for((i = 0; i < 6; i++));do
    (( tempA=${catBytesMoved[i]}))
    (( tempB=${catFilesMoved[i]}))
    echo "*** ${catNames[i]} ***"
    echo "Total moved: ${catFilesMoved[i]}, total size: ${catBytesMoved[i]} B"
    if [[ $tempB == 0 ]]; then
        echo "Average file size could not be found, no files moved."
    else
        (( avgFileSize=tempA/tempB))
        echo "Average file size: $avgFileSize"
    fi
done
