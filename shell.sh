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
        b = `expr $b - 1`                                           # An example of while loop
    done
    echo
    a = `expr $a + 1`
done

a = 10

until [ $a -lt 10 ]
do                                                                  # An example of infinite loop with until
    echo $a
    a=`expr $a + 1`
done

a = 0

while [ $a -lt 10 ]
do
    echo $a
    if [ $a -eq 5 ]
    then                                                            # An example of finite loop with break
        break
    fi
    a = `expr $a + 1`
done

NUMS = "1 2 3 4 5 6 7"

for NUM in $NUMS
do
    Q = `expr $NUM % 2`
    if [ $Q -eq 0 ]
    then                                                            # An example of loop with continue
        echo "Number is an even number!!"
        continue
    fi
    echo "Found odd number"
done

a = 10
echo -e "Value of a is $a \n"                                       # with -e: "Value of a is 10 {newline}"
                                                                    # without -e: "Value of a is 10 \n"

echo ${var:-"Variable is not set"}
echo "1 - Value of var is ${var}"

echo ${var:="Variable is not set"}
echo "2 - Value of var is ${var}"

unset var
echo ${var:+"This is default value"}                                # Several ways to set variables
echo "3 - Value of var is $var"

var = "Prefix"
echo ${var:+"This is default value"}
echo "4 - Value of var is $var"

echo ${var:?"Print this message"}
echo "5 - Value of var is ${var}"

echo Hello\; Word                                                   # The way to print some symbols legally
echo "I have \$1200"                                                # The way to print '$' but not as a variable

echo '<-$1500.**>; (update?) [y|n]'                                 # We can use single quote to avoid use '\' to express symbols
                                                                    # When we use double quote, it's not considered as "Quote"

DATE=`date`                                                         # Use this quote can execute commands
echo "Current Date: $DATE"                                          # Result: Current Date: Thu Jul 2 05:28:45 MST 2009

who > users
cat users                                                           # Output: oko tty01 Sep 12 07:30
                                                                            # ai tty15 Sep 12 13:32
                                                                            # ruth tty21 Sep 12 10:10
                                                                            # pat tty24 Sep 12 13:07
                                                                            # steve tty25 Sep 12 13:03

echo line 1 > users
cat users                                                           # Output: line 1

echo line 2 >> users
cat users                                                           # Output: line 1
                                                                            # line 2

wc -l users                                                         # Output: 2 users (2 lines)

wc -l < users                                                       # Output: 2 (2 lines)

command > /dev/null                                                 # It's the way to discard the output

command > /dev/null 2>&1                                            # Lead STDERR to STDOUT

echo message 1>&2                                                   # Lead STDOUT to STDERR and print it

n >& m                                                              # Merges output from stream n with stream m

n <& m                                                              # Merges input from stream n with stream m

Hello () {
    echo "Hello World $1 $2"
    return 10
}

Hello Zara Ali                                                      # Output: Hello World Zara Ali
ret = $?

echo "Return value is $ret"                                         # Output: (Get the output of the last command) 10

number_one () {
   echo "This is the first function speaking..."
   number_two
}

number_two () {
   echo "This is now the second function speaking..."
}

number_one                                                          # This is an example of nested function

test.sh                                                             # Put everything in a Shell file (Like the definition of functions)
number_one
                                                                    # This is the first function speaking...
                                                                    # This is now the second function speaking...

unset -f function_name                                              # Remove the definition of functions

man command                                                         # The way to open the manuel page and get help

https://www.tutorialspoint.com/unix/unix-regular-expressions.htm
Learn from here.