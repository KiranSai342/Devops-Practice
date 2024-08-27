#!/bin/bash

Userid=$(id -u)

if [ $Userid -ne 0 ]
then
    echo "please run the script with root previllages"
    exit 1
fi
dnf install mysql-server -y



##for the user not having root access
#Userid=$(sudo id -u)

#if [ $Userid -ne 0 ]
#then
    #echo "you are not having root user access please contact your system administrator."
    #exit 1
#fi
#sudo dnf install mysql-server -y


