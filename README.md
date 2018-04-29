# JWAS-Docker

# create a docker image for julia and jupyter notebook
Docker build -f jupyerjulia.txt -t jupyter-julia .

# create a docker image for JWAS based on jupyter-julia
Docker build -f jwas.txt -t jwas-docker .

#run the docker
docker run -it --rm -p 8888:8888 -v /Users/qtlcheng:/home/jovyan/qtlcheng jwas-docker

#make an alias
alias jwasdocker="docker run -it --rm -p 8888:8888 -v /Users/qtlcheng:/home/jovyan/qtlcheng jwas-docker"

#make zip file for a specofoc docker image
docker image save image-id > filename.tar

