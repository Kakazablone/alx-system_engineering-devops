alias ls= "rm *" : Create a script that creates an alias.
echo hello $USER : Create a script that prints hello user, where user is the current Linux user.
export PATH=$PATH:/action :Add /action to the PATH. /action should be the last directory the shell looks into when looking for a program.
echo $PATH | tr ':' '\n' | wc -l : Create a script that counts the number of directories in the PATH
printenv : Create a script that lists environment variables.
set : Create a script that lists all local variables and environment variables, and functions.
BEST=School : Create a script that creates a new local variable.
export BEST=School : Create a script that creates a new global variable.
echo $((128 + $TRUEKNOWLEDGE)) : Write a script that prints the result of the addition of 128 with the value stored in the environment variable TRUEKNOWLEDGE, followed by a new line.
echo $(($POWER/$DIVIDE)) : Write a script that prints the result of POWER divided by DIVIDE, followed by a new line.
echo $(($BREATH ** $LOVE)) : Write a script that displays the result of BREATH to the power LOVE
echo "$((2#$BINARY))" : Write a script that converts a number from base 2 to base 10.
printf "%s\n" {a..z}{a..z} | grep -v "oo" : Create a script that prints all possible combinations of two letters, except oo.
