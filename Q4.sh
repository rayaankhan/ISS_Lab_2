#!/bin/bash
read string

if [[ "$string" == *","* ]]
then
IFS=','
read -ra arr <<< "$string"
else
IFS=' '
read -ra arr <<< "$string"
fi

len=${#arr[*]}

for(( i=0; i<len-1; i++ ))
do
    for(( j=0 ; j<len-i-1; j++ ))
    do
        if(( arr[j] > arr[j+1] ))
        then
        temp=${arr[j]}
        arr[j]=${arr[j+1]}
        arr[j+1]=$temp
        fi
    done
done
echo "${arr[*]}"