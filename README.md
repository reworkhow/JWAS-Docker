# JWAS-Docker

# General Users

docker run -it --rm -p 8888:8888 -v /Users/qtlcheng:/home/jovyan/qtlcheng qtlrocks:jwas-docker

# Create Images

1. create a docker image for julia and jupyter notebook
Docker build -f jupyerjulia.txt -t jupyter-julia .

2. create a docker image for JWAS based on jupyter-julia
Docker build -f jwas.txt -t jwas-docker .

3. tag and push images to dockerhub
docker tag jwas-docker qtlrocks/jwas-dockers:v0.1
docker push qtlrocks/jwas-dockers:v0.1

4. OR save th image to tar, copy and paste, then load it 
docker save jwas-dockers > jwas-dockers.tar
docker load --input jwas-dockers.tar

# Miscs

* run the docker (when jwas-docker is local (pulled))
docker run -it --rm -p 8888:8888 -v /Users/qtlcheng:/home/jovyan/qtlcheng jwas-docker

* make an alias
alias jwasdocker="docker run -it --rm -p 8888:8888 -v /Users/qtlcheng:/home/jovyan/qtlcheng jwas-docker"

* https://ropenscilabs.github.io/r-docker-tutorial/04-Dockerhub.html