#!/bin/bash

set -e -o pipefail

beast_version="2.5.0"

wget --quiet https://github.com/CompEvol/beast2/releases/download/v${beast_version}/BEAST.v${beast_version}.Linux.tgz
tar -xzpf BEAST.v${beast_version}.Linux.tgz
rm BEAST.v${beast_version}.Linux.tgz

mv beast/bin/* /usr/local/bin
mv beast/lib/* /usr/local/lib

beast -beagle_info
packagemanager -add BADTRIP
packagemanager -add PoMo