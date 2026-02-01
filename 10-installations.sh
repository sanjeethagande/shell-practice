#!/bin/bash

USER_Id=$(id -u)

if [ $USER_Id -ne 0 ]; then
echo "please run this script with root access"
exit 1
fi

echo "installing nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then
echo "installing Nginx..FAILURE"
exit 1
else 
echo "installing Nginx..SUCCESS"
fi