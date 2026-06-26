#!/usr/bin/bash

org='kubernetes-sigs'
proj='kind'
number=${1:-20}

versions(){
    curl -sL "https://api.github.com/repos/${org}/${proj}/releases" | jq -r ".[].tag_name" | \
        sort -rV | \
        head -n ${number} | \
        sed 's:v::g'
}

versions
