#!/bin/bash

utils=(
    tree
    zsh
)

apt update

for util in "${utils[@]}"
do
    apt install -y "${util}"
done
