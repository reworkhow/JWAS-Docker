#!/bin/bash

echo "copy example notebooks from JWAS"
rm -rf JWAS.jl notebooks
git clone https://github.com/reworkhow/JWAS.jl.git
cp -r JWAS.jl/docs/notebooks notebooks

docker build -t qtlrocks/jwas-docker .

rm -rf JWAS.jl notebooks
