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

INSTALL_PACKAGE() {
   PACKAGE_NAME=$1
  echo "Installing $PACKAGE_NAME"
  dnf install $PACKAGE_NAME -y
  VALIDATE $? "Installing $PACKAGE_NAME"
}

INSTALL_PACKAGE nginx
INSTALL_PACKAGE mysql
INSTALL_PACKAGE nodejs
