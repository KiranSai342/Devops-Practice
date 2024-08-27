#!/bin/bash

Number=$1

If [ $Number -gt 20 ] #gt = Greatet then, lt = Less then, eq = equals, -ne = not equals.
then
    echo "The given Number: $Number id Greater then : 20"
else
    echo "The given Number: $Number id Less then : 20"
fi

