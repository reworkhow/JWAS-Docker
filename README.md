# Docker images for JWAS and XSim on IJulia

These docker image files were created by Hailin Su, Rohan Fernando and Hao Cheng. 

Two version of docker files are available to build jwas-docker image. This docker file in `dockerfile-jwas-mini` built the image from ubuntu and the final size is ~990 Mb comparing to `dockerfile-jwas-large`.

## Install
To get the newest version, please pull the JWAS-Docker image
```bash
docker pull qtlrocks/jwas-docker
```

## Launch

The command below update local qtlrocks/jwas-docker to the latest version and run it.

```bash
docker run -it --rm -p 8888:8888 qtlrocks/jwas-docker
```

The `-v` option can mount your local working directory into the docker container, please see the [docker help page](https://docs.docker.com/engine/reference/commandline/run/#mount-volume--v---read-only) for more information. The working dir inside the image is `/home/ubuntu`, so after `cd` into your working directory (containing data files) on your local machine or a server,

```bash
docker run -it --rm -p 8888:8888 -v `pwd`:/home/ubuntu/work qtlrocks/jwas-docker
```

This launch command is also provided in the script file `dockerfile-jwas-mini/launch_docker_jwas_mini_jupyter_notebook.sh`.

## Visit
It is expected to prompt something look like this

```
[I 10:41:54.774 NotebookApp] Writing notebook server cookie secret to /home/ubuntu/.local/share/jupyter/runtime/notebook_cookie_secret
[I 10:41:54.920 NotebookApp] Serving notebooks from local directory: /home/ubuntu
[I 10:41:54.920 NotebookApp] 0 active kernels
[I 10:41:54.920 NotebookApp] The Jupyter Notebook is running at:
[I 10:41:54.920 NotebookApp] http://0.0.0.0:8888/?token=75ad671f75b4c47be70591f46bec604997d8a9bd9dd51f0d
[I 10:41:54.920 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 10:41:54.921 NotebookApp] 
    
    Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://0.0.0.0:8888/?token=75ad671f75b4c47be70591f46bec604997d8a9bd9dd51f0d
```

Then, open the url in an internet browser (IE, Firefox, Chrome, Safari, etc) if JWAS-docker is launched on your local machine.

If JWAS-docker is launched on a server and you're trying to use it in another machine, change the IP address from `0.0.0.0` to the domain name (or IP address) of the server.

#### Example:

If you're trying to copy/paste one of the following urls into your browser, remember to replace the domain name `www.example.com` or ip address `66.66.66.66` of the server, and the string after `token=`, according to your real instance.

- If launched from your local machine
  >http://0.0.0.0:8888/?token=75ad671f75b4c47be70591f46bec604997d8a9bd9dd51f0d

  or

  >http://127.0.0.1:8888/?token=75ad671f75b4c47be70591f46bec604997d8a9bd9dd51f0d

- if launched from a server with domain name `www.example.com`
    >http://www.example.com:8888/?token=75ad671f75b4c47be70591f46bec604997d8a9bd9dd51f0d

- if launched from a server with IP address `66.66.66.66`
    >http://66.66.66.66:8888/?token=75ad671f75b4c47be70591f46bec604997d8a9bd9dd51f0d

## Interactive launching and visiting
For those who may want to run scripts using linux commands in Bash,
```bash
docker run -it --rm -v `pwd`:/home/ubuntu/work qtlrocks/jwas-docker bash
```

This launch command is also provided in the script file `dockerfile-jwas-mini/launch_docker_jwas_mini_CLI.sh`.
