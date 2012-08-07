#!/bin/bash
#Checks if there are duplicate files,
#based on name, in a target directory
#and prints some information.
#In one line:
#for file in `find $SOURCE_DIR -not -type d -exec basename {} \;`; do find $TARGET_DIR -name $file -exec ls -la {} \; ; done

if [ ! -n "$1" ]; then
	echo "Specify a source directory!"
	exit 0
fi

if [ ! -n "$2" ]; then                                                         
	echo "Specify a target directory!"
	exit 0
fi
                               
SOURCE_DIR=$1
TARGET_DIR=$2

#Find the files that you want to check for duplication.
#Get only the basename, not with the directory.
FILES_IN_SOURCE=`find $SOURCE_DIR -not -type d -exec basename {} \;`

#For each file found check if there is a duplicate
#in the target directory and delete it.
for file in $FILES_IN_SOURCE
do
	echo -e "Seaching for \e[0;32m$file\e[0m..."
	find $TARGET_DIR -name $file -exec ls -al {} \;
done

