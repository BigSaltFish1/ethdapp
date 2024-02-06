#!/bin/bash

sol=$1
base_dir=${sol%/*}
sol_file=${sol##*/}
file_name=${sol_file%%.*}

abi_dir=abi/$base_dir
sol_dir=solidity/$base_dir
go_dir=pkg/$base_dir


abi_file=$abi_dir/${file_name}.abi
go_file=$go_dir/${file_name}.go
sol_file=$sol_dir/${file_name}.sol
go_package=$file_name

echo "sol file: " $sol_file


echo "gen abi file $abi_file"
mkdir -p $abi_dir
solc --abi -o $abi_dir $sol_file

echo "gen go sdk file $go_file"
mkdir -p $go_dir
abigen --abi=$abi_file --pkg=$go_package --out=$go_file