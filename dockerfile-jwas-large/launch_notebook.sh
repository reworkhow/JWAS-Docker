#!/bin/bash

echo "launch the Jupyter Notebook interface for JWAS ..."
docker run -it --rm -p 8888:8888 -v `pwd`:/home/jovyan/work qtlrocks/jwas-docker
