# JWAS-Docker

# General Users

The command below will `docker pull` the image `qtlrocks/jwas-docker` at first, then run it. 
```
docker run -it --rm -p 8888:8888 -v /Users/qtlcheng:/home/jovyan/qtlcheng qtlrocks/jwas-docker
```

# Create Images

1. create a docker image for julia and jupyter notebook
```bash
docker build -f jupyerjulia.txt -t jupyter-julia .
```

2. create a docker image for JWAS based on jupyter-julia
```bash
docker build -f jwas.txt -t jwas-docker .
```
3. tag and push images to dockerhub
```bash
docker tag jwas-docker qtlrocks/jwas-docker:v0.1
docker push qtlrocks/jwas-docker:v0.1
```
4. OR save th image to tar, copy and paste, then load it 
```bash
docker save jwas-docker > jwas-docker.tar
docker load --input jwas-dockers.tar
```
# Miscs

* download docker image
```
docker pull qtlrocks/jwas-docker:v0.1
```

* run the docker (when jwas-docker is local (pulled))
```bash
docker run -it --rm -p 8888:8888 -v /Users/qtlcheng:/home/jovyan/qtlcheng jwas-docker
```

* make an alias
```bash
alias jwasdocker="docker run -it --rm -p 8888:8888 -v /Users/qtlcheng:/home/jovyan/qtlcheng jwas-docker"
```

* https://ropenscilabs.github.io/r-docker-tutorial/04-Dockerhub.html
