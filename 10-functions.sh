#!/bin/bash

USER_Id=$(id -u)

if [ $USER_Id -ne 0 ]; then
echo "please run this script with root access"
exit 1
fi

VALIDATE() {
if [ $1 -ne 0 ]; then
echo "$2..FAILURE"
exit 1
else 
echo "$2..SUCCESS"
fi

}

echo "installing nginx"
dnf install nginx -y
VALIDATE $? ,"installing Nginx"


echo "installing mysql"
dnf install mysql -y
VALIDATE $? ,"installing Nginx"


echo "installing node"
dnf install node -y
VALIDATE $? ,"installing Nginx"

