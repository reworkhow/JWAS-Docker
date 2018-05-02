# JWAS-Docker

# Guide for General Users

The command below update `local qtl/jwas-docker` to the latest version and run it.
```
docker run -it --rm -p 8888:8888 qtlrocks/jwas-docker
```


* add local directories    
    ```bash
    docker run -it --rm -p 8888:8888 -v /Users/qtlcheng:/home/jovyan/qtlcheng qtlrocks/jwas-docker
    ```
* use a different version of `qtl/jwas-docker`, e.g., `v0.1-beta`, not `latest` 
    ```bash
    docker run -it --rm -p 8888:8888 qtlrocks/jwas-docker:v0.1-beta
    ```
    

# Guide for Authors

## Create Images

1. create a docker image for julia and jupyter notebook
```bash
docker build -f jupyer-julia.txt -t jupyter-julia .
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

* make an alias
```bash
alias jwasdocker="docker run -it --rm -p 8888:8888 -v /Users/qtlcheng:/home/jovyan/qtlcheng jwas-docker"
```

* https://ropenscilabs.github.io/r-docker-tutorial/04-Dockerhub.html
