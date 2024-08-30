#!/bin/bash


Userid=$(id -u)

Validate(){
    if [ $1 -eq 0 ]
    then
        echo "$2 is success"
    else
        echo "$2 is not success"
        exit $1
    fi
}
Check_root(){
   if [ $Userid -ne 0 ]
then
    echo "please run the script with root previllages"
    exit 1
fi 
}
Check_root

#sh 15.loops.sh git mysql-server postfix nginx
for package in $@   #$@ refers to all arguments passed to it.
do 
    dnf list installed $package

    if [ $? -ne 0 ]
    then
        echo "$package is not installed. Going to install it."
        dnf install $package -y
        echo "Exit status: $?"
        Validate $? "$package installation" 
    else
        echo "$package already installed. Nothing to do."
        
    fi
done




##for the user not having root access
#Userid=$(sudo id -u)

#if [ $Userid -ne 0 ]
#then
    #echo "you are not having root user access please contact your system administrator."
    #exit 1
#fi
#sudo dnf install mysql-server -y



