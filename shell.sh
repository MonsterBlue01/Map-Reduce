#!/bin/bash

echo "What is your name?"
read PERSON                 # Let user give the input
echo "Hello, $PERSON"       # Using the variable
date                        # Get the real date

chmod +x shell.sh
./shell.sh

NAME = "Dongjing Wang"
readonly NAME               # Set this variable to read-only
echo $NAME
DATE = 112233
unset DATE                  # This is the way to delete a variable. (Cannot be executed on readonly variables)

echo "File Name: $0"
echo "First Parameter : $1"
echo "Second Parameter : $2"
echo "Quoted Values: $@"
echo "Quoted Values: $*"
echo "Total Number of Parameters : $#"

./shell.sh Dongjing Wang
$0: shell.sh
$1: Dongjing
$2: Wang
$@: Dongjing Wang
$*: Dongjing Wang

echo $$                     # The process number of the current shell. For shell scripts, this is the process ID under which they are executing.
echo $?                     # The exit status of the last command executed.
                            # End: 0, Not end: 1

https://www.tutorialspoint.com/unix/unix-using-arrays.htm
Learn from here.