#!/bin/bash

set -ex;

org='kubernetes-sigs'
proj='kind'

version=$1

docker_build() {
    if [[ -z ${version} ]]; then
        version=$(./versions.sh 1)
    fi
    declare -l builder
    builder="${org}-${proj}-builder"
    local version=${version#v}
    docker build -t ${builder} .
    docker run --rm -v$(pwd):/workspace -e KIND_VERSION=${version} ${builder}
    docker rmi ${builder}
}

docker_build
