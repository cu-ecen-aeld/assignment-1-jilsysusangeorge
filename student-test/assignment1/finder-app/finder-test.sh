#!/bin/bash

numfiles=$1
writestr=$2


# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <numfiles> <search_string>. Hence choosing numfiles = 10 and writestr = AELD_IS_FUN" 	
	numfiles=10
	writestr=AELD_IS_FUN 
    exit 1
fi


# loop the file execution numfiles times
for ((i=1;i<=numfiles;i++)); 
do 
   
	cd /home/jilsy/Assignment_1/conf
	username=$(cat username.txt)
	
	# Create the directory
	mkdir -p /home/jilsy/Assignment_1/student-test/assignment1/finder-app/tmp/aeld-data
	cd /home/jilsy/Assignment_1/student-test/assignment1/finder-app/tmp/aeld-data
	touch ${username}${i}.txt
	
	cd /home/jilsy/Assignment_1/student-test/assignment1/finder-app
	./writer.sh "/home/jilsy/Assignment_1/student-test/assignment1/finder-app/tmp/aeld-data/${username}${i}.txt" "$writestr"
done

directory=/home/jilsy/Assignment_1/student-test/assignment1/finder-app/tmp/aeld-data
cd /home/jilsy/Assignment_1/student-test/assignment1/finder-app

./finder.sh "$directory" "$writestr"
