#!/bin/bash

USER_Id=$(id -u)
LOGS_FOLDER="/var/log/Shell-script"
LOGS_FILE="/var/log/Shell-script/$0.log"

if [ $USER_Id -ne 0 ]; then
echo "please run this script with root access" |tee -a $LOGS_FILE
exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE() {
if [ $1 -ne 0 ]; then
echo "$2..FAILURE" |tee -a $LOGS_FILE
exit 1
else 
echo "$2..SUCCESS" |tee -a $LOGS_FILE
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
  echo "$package already installed ,skipping now"
  fi
done
