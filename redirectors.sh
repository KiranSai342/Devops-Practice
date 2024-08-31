#!/bin/bash
Userid=$(id -u)
Logs_folder="/var/log/shell-script"
Script_name=$(echo $0 | cut -d "." -f1) #$0 --refers current script name
Time_stamp=$(date +%Y-%m-%d-%-H-%M-%S)
Log_file="$Logs_folder/$Script_name-$Time_stamp.log"

mkdir -p /var/log/shell-script  # -P refers to know the folder is already created or not



Validate(){
    if [ $1 -eq 0 ]
    then
        echo "$2 is success" &>>$Log_file
    else
        echo "$2 is not success" &>>$Log_file
        exit $1
    fi
}
Check_root(){
    if [ $Userid -ne 0 ]
    then
        echo "please run the script with root previllages" | tee -a $Log_file
        exit 1
    fi 
}

Usage(){
    echo "Usage:: sudo sh <file-name> package1 package2..." | tee -a $Log_file
    exit 1
}
Check_root &>>$Log_file

if [ $# -eq 0 ]
then
    Usage
fi

#sh 15.loops.sh git mysql-server postfix nginx
for package in $@   #$@ refers to all arguments passed to it.
do 
    dnf list installed $package &>>$Log_file

    if [ $? -ne 0 ]
    then
        echo "$package is not installed. Going to install it." &>>$Log_file
        dnf install $package -y &>>$Log_file
        echo "Exit status: $?" &>>$Log_file
        Validate $? "$package installation" &>>$Log_file 
    else
        echo "$package already installed. Nothing to do." &>>$Log_file
        
    fi
done



