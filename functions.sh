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

if [ $Userid -ne 0 ]
then
    echo "please run the script with root previllages"
    exit 1
fi
dnf list installed mysql-server

if [ $? -ne 0 ]
then
    echo "Mysql is not installed. Going to install it."
    dnf install mysql-server -y
    echo "Exit status: $?"
    Validate $? "Mysql Installation"
    
    
    
else
    echo "Exit status: $?"
    echo "Mysql already installed. Nothing to do."
    
fi



##for the user not having root access
#Userid=$(sudo id -u)

#if [ $Userid -ne 0 ]
#then
    #echo "you are not having root user access please contact your system administrator."
    #exit 1
#fi
#sudo dnf install mysql-server -y


