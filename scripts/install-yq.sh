#!/bin/bash

VERSION="v4.14.2"
BINARY="yq_linux_amd64"

wget https://github.com/mikefarah/yq/releases/download/${VERSION}/${BINARY}.tar.gz -O - |\
    tar xz && mv ${BINARY} /usr/bin/yq

which yq
yq --version
