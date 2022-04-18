#!/bin/bash
#Q5 part a
read string
len=${#string}
for ((i=len-1; i>=0;i--))
do
rs=$rs"${string:i:1}"
done
echo $rs

#Q5 part b
for((i=0;i < len;i++))
do
y="${rs:i:1}"
y=$(echo "$y" | tr "0-9a-z" "1-9a-z_" | tr "0-9A-Z" "1-9A-Z_")
echo -n $y 
done
echo 

#Q5 part c
let "half=$len/2"
echo -n "${rs:$half:$half}"
echo -n "${string:$half:$half}"