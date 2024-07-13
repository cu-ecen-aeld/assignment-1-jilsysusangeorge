#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory> <search_string>"
    exit 1
fi


writefile=$1
writestr=$2


# Check if the provided directory exists and is a directory
if [ ! -d "$writefile" ]; then
    mkdir -p "$(dirname "$writefile")"
fi

# file username extraction
cd /home/jilsy/Assignment_1/conf
username=$(cat username.txt)

#find textfile	
directory=$(dirname "$writefile")
cd "$directory" 
filename=$(find . -type f -name "*${username}*") #find filename



# Iterate over each filename and insert the text
while IFS= read -r filename; do
    echo "$writestr" > "$writefile"
done <<< "$filenames"

#echo $writestr > "$filename"  #insert text to the file


