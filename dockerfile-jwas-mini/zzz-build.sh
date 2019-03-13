#!/bin/bash

echo "copy example notebooks from JWAS"
touch JWAS.jl notebooks && rm -rf JWAS.jl notebooks
git clone https://github.com/reworkhow/JWAS.jl.git
cp -r JWAS.jl/docs/notebooks notebooks

echo "build the docker image for jwas mini"
docker build -t qtlrocks/jwas-docker:mini .

rm -rf JWAS.jl notebooks
