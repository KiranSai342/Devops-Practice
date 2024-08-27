#!/bin/bash

Number=$1

if [ $Number -gt 20 ] #-gt = Greatet then, -lt = Less then, -eq = equals, -ne = not equals, -ge = Greater then equal to, -le = less then equal to. .
then
    echo "The given Number: $Number is Greater then : 20"
elif [ $Number -eq 20 ]
    echo "The given Number: $Number is equals to : 20"
else
    echo "The given Number: $Number is Less then : 20"
fi

