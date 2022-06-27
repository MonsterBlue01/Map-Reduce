#!/bin/bash

echo "What is your name?"
read PERSON                                                         # Let user give the input
echo "Hello, $PERSON"                                               # Using the variable
date                                                                # Get the real date

chmod +x shell.sh
./shell.sh

NAME = "Dongjing Wang"
readonly NAME                                                       # Set this variable to read-only
echo $NAME
DATE = 112233
unset DATE                                                          # This is the way to delete a variable. (Cannot be executed on readonly variables)

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

echo $$                                                             # The process number of the current shell. For shell scripts, this is the process ID under which they are executing.
echo $?                                                             # The exit status of the last command executed.
                                                                    # End: 0, Not end: 1

${array_name[*]} ${array_name[@]}                                   # These are two ways to directly access the array in the shell.

DATE[0] = "Monday"
DATE[1] = "Tuesday"
DATE[2] = "Wednesday"
DATE[3] = "Thursday"
DATE[4] = "Friday"
echo "First Index: ${DATE[0]}"                                      # Will return 'Monday'
echo "Second Index: ${DATE[1]}"                                     # Will return 'Tuesday'
echo "First Method: ${NAME[*]}"                                     # Will return 'First Method: Monday Tuesday Wednesday Thursday Friday'
echo "Second Method: ${NAME[@]}"                                    # Will return 'Second Method: Monday Tuesday Wednesday Thursday Friday'

a = 10
b = 20

if [ $a == $b ]
then
    echo "a is equal to b"
elif [ $a -gt $b ]
then
    echo "a is greater than b"                                      # An example for if...elif...else...fi
elif [ $a -lt $b ]
then
    echo "a is less than b"
else
    echo "None of the condition met"
fi

FRUIT = "kiwi"

case "$FRUIT" in
    "apple") echo "Apple pie is quite tasty." 
    ;;
    "banana") echo "I like banana nut bread."                       # An example for case...esac
    ;;
    "kiwi") echo "New Zealand is famous for kiwi." 
    ;;
esac

a = 0
while [ "$a" -lt 10 ]                                               # this is loop1
do
    b = "$a"
    while [ "$b" -ge 0 ]                                            # this is loop2
    do
        echo -n "$b "
        b = `expr $b - 1`                                             # An example of while loop
    done
    echo
    a = `expr $a + 1`
done

https://www.tutorialspoint.com/unix/unix-loop-control.htm
Learn from here.