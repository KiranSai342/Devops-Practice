#!/bin/bash

Userid=$(id -u)

if [ $Userid -ne 0 ]
then
    echo "please run the script with root previllages"
    #exit 1
fi
dnf list installed mysql-server 

if [ $? -ne 0 ]
then
    echo "Mysql is not installed. Going to install it."
    dnf install mysql-server -y
    if [ $? -ne 0 ]
    then    
        echo "Installation not successed"
        exit 1
    else
        echo "Installation success"
    fi
else
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


