#!/bin/bash

logme() {
    echo "** $1";
}

register() {
    for d in ./*; do
        if [ -d "$d" ]; then
            logme "registering $d"
            mr register $d
        fi
    done
}

register
logme "Exit"

