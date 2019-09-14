#!/bin/bash
rm flat_contracts/*.sol
mkdir flat_contracts/

for filename in contracts/*.sol; do
    [ -e "$filename" ] || continue
    npx truffle-flattener "$filename" > flat_"$filename"
done
