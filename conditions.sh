#!/bin/bash

Number=$1

if [ $Number -gt 20 ] #-gt = Greatet then, -lt = Less then, -eq = equals, -ne = not equals, -ge = Greater then equal to, -le = less then equal to. .
then
    echo "The given Number: $Number id Greater then : 20"
else
    echo "The given Number: $Number id Less then : 20"
fi

