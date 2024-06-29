#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory> <search_string>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if the provided directory exists and is a directory
if [ ! -d "$filesdir" ]; then
    echo "The directory $filesdir does not exist or is not a directory."
    exit 1
fi

# Initialize counters
file_count=0
line_count=0

# Iterate through all files in the directory and subdirectories
while IFS= read -r -d '' file; do
    ((file_count++))
    # Count matching lines in the current file
    matches=$(grep -c "$searchstr" "$file")
    ((line_count+=matches))
done < <(find "$filesdir" -type f -print0)

# Print the result
echo "The number of files are $file_count and the number of matching lines are $line_count"

# Check if any matching lines were found
if [ "$line_count" -gt 0 ]; then
    echo "success"
else
    echo "failure"
fi

