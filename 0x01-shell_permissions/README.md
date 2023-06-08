su betty :switches the current user to the user betty
whoami : Prints effective user ID
groups : prints all the groups the current user is part of
sudo chown betty hello :changes the owner of the file hello to the user betty
touch hello :Create an empty file called hello
chmod u+x hello : adds execute permission to the owner of the file hello.
chmod u+x,g+x,o+r hello :adds execute permission to the owner and the group owner, and read permission to other users, to the file hello
chmod ugo+x hello :  adds execution permission to the owner, the group owner and the other users, to the file hello
chmod 007 hello : Grants only the others permissions
chmod 753 hello : specific permissions
chmod -Rf hello olleh : assigns the same permissions in hello tp olleh
chmod -R a+x : adds execute permission to all subdirectories of the current directory for the owner, the group owner and all other users. Regular files should not be changed.
sudo mkdir -m 751 my_dir : Make directory and assign permissions at the same time
chgrp school hello :Change group owner
