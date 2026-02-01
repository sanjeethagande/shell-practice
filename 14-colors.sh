#!/bin/bash

USER_Id=$(id -u)
LOGS_FOLDER="/var/log/Shell-script"
LOGS_FILE="/var/log/Shell-script/$0.log"
R="\e[31m" 
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

if [ $USER_Id -ne 0 ]; then
echo -e "$R please run this script with root access $N " |tee -a $LOGS_FILE
exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE() {
if [ $1 -ne 0 ]; then
echo -e "$2..$R FAILURE $N" |tee -a $LOGS_FILE
exit 1
else 
echo -e "$2..$G SUCCESS $N" |tee -a $LOGS_FILE
fi

}

for package in $@
do 
dnf list installed $package &>>LOGS_FILE
if [ $? -ne 0 ]; then 
echo "$package not installed ,installing now"
  dnf install $package -y &>> $LOGS_FILE
  VALIDATE $? "Installing $package"
  else 
  echo -e "$package $G already installed ,skipping now $N"
  fi
done
