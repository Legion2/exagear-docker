#!/bin/bash

BASEDIR=$(dirname $(readlink -f $0))
(
    cd $BASEDIR
    docker build -t exagear .
)
