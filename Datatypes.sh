#!/bin/bash

Number1=$1
Number2=$2

Sum=(($Number1+$Number2))
#Outer braces for taking the avlue in runtime and assigning it it Sum
#Inner Braces for adding function (+)

echo "$Sum"