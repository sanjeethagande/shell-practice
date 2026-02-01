#!/bin/bash
echo "Please enter marks"
read marks;

if [ $marks -ge 90 ];then
 echo "Grade A"
elif [ $marks -ge 60 ]; then
 echo "Grade B"
 else 
 echo "Grade C"
 fi 
