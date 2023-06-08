#DESCRIBES WHAT EACH SCRIPT IS DOING
*pwd - prints the absolute path name of the current working directory
*ls - Display the contents list of your current directory
cd - changes the working directory to the user’s home directory
ls -l - Display current directory contents in a long format
ls -la - Display current directory contents, including hidden files (starting with .)
ls -la --numeric-uid-gid -Display in long format  with user and group IDs displayed numerically
mkdir /tmp/my_first_directory - creates a directory named my_first_directory in the /tmp/ directory
mv /tmp/betty /tmp/my_first_directory -Move file from one directory to another
rm /tmp/my_first_directory/betty - To remove the file betty
rm -r /tmp/my_first_directory - Deleting a directory
cd - -move to the previous directory
ls -la . .. /boot - list files in that order
file /tmp/iamafile - prints out iamafile when vim -r README.md

cp -a *html ../ | uniq - Copies all html files from working to parent dir (working)
mv [[:upper:]]* /tmp/u - Move all files beginning with an uppercase to u
rm -f *~ - Remove all files that end in ~ inside the current dir.
mkdir -p welcome/to/school - creates the three directories welcome wlecome to and welcome to school
ls -xamp - lists all the files and directories of the current directory, separated by commas
