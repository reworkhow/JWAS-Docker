# JWAS-Docker

# Guide for General Users

## Basics
The command below update `local qtl/jwas-docker` to the latest version and run it.
```
docker run -it --rm -p 8888:8888 qtlrocks/jwas-docker
```

## Advances

You can also use the commands below to add a local directory when you run the docker image or use a different version of the image.

* add local directories    
```dockerfile
docker run -it --rm -p 8888:8888 -v /Users/qtlcheng:/home/jovyan/qtlcheng qtlrocks/jwas-docker
```

* use a different version of `qtl/jwas-docker`, e.g., `v0.1-beta`, not `latest` 
```dockerfile
docker run -it --rm -p 8888:8888 qtlrocks/jwas-docker:v0.1-beta
```
    

# Guide for Authors

## Create Images

1. create a docker image for julia and jupyter notebook
```dockerfile
docker build -f jupyer-julia.txt -t jupyter-julia .
```

2. create a docker image for JWAS based on jupyter-julia
```dockerfile
docker build -f jwas.txt -t qtlrocks/jwas-docker .
```

3. tag and push images to dockerhub

    * for the latest version
    ```dockerfile
    docker push qtlrocks/jwas-docker
    ```
    * for a different version
    ```dockerfile
    docker tag jwas-docker qtlrocks/jwas-docker:v0.1-beta
    docker push qtlrocks/jwas-docker:v0.1-beta
    ```

4. OR save th image to tar, copy and paste, then load it 
```bash
docker save qtlrocks/jwas-docker > jwas-docker.tar
docker load --input jwas-dockers.tar
```

# Miscs

* list all local docker images 

```
docker images
```

* delete a local docker image

```
docker rmi qtlrocks/jwas-docker
```

or

```
docker rmi IMAGE ID 
```

* download docker image

    * for the latest version
    ```
    docker pull qtlrocks/jwas-docker
    ```

   * for a different version
   
    ```
    docker pull qtlrocks/jwas-docker:v0.1-beta
    ```

* make an alias
```bash
alias jwasdocker="docker run -it --rm -p 8888:8888 -v /Users/qtlcheng:/home/jovyan/qtlcheng qtlrocks/jwas-docker"
```

* https://ropenscilabs.github.io/r-docker-tutorial/04-Dockerhub.html
