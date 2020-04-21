#!/bin/bash
TERRA_VERSION=0.12.24
TERRA_PLATFORM=darwin_amd64
DIST=terraform_${TERRA_VERSION}_${TERRA_PLATFORM}.zip
DIST_URL=https://releases.hashicorp.com/terraform/${TERRA_VERSION}/terraform_${TERRA_VERSION}_${TERRA_PLATFORM}.zip
TERRA_BIN=terraform

logme() {
    echo "** $1";
}

cleanup() {
    DRY_RUN=$1
    if [ "$DRY_RUN" = true ] ; then 
        logme "Going to clean up everything, dry run = ${DRY_RUN}";
        rm -f ${TERRA_BIN}
    fi
    rm -f ${DIST}
}

download_dist() {
    if [ -f ${DIST} ] ; then 
        logme "Terraform dist already downloaded";
        return 0
    fi
    logme "Going to download ${DIST}"
    wget ${DIST_URL}
}

unpack_dist() {
    if [[ ! -f ${DIST} || -f ${TERRA_BIN} ]] ; then 
        logme "Distibutive ${DIST} doesn't exist or already unpacked"
        return 0
    fi
    logme "Going to unzip ${DIST}"
    unzip ${DIST}
}

download_dist

unpack_dist

cleanup false

logme "Exit"

