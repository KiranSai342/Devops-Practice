#!/bin/bash

Userid=$(id -u)

if [ $Userid -ne 0 ]
then
    echo "please run the script with root previllages"
    exit 1
fi
dnf install mysql-server -y

