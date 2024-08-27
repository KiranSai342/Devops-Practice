#!/bin/bash

Userid=$(sudo id -u)

if [ $Userid -ne 0 ]
then
    echo "please run the script with root previllages"
    exit 1
fi
sudo dnf install mysql-server -y

