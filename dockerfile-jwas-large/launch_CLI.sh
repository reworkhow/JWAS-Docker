#!/bin/bash

echo "launch the Command Line interface for JWAS ..."
docker run -it --rm -v `pwd`:/home/jovyan/work qtlrocks/jwas-docker bash
