FROM ubuntu

# mini version by Hailin Su
# modified from Hao Cheng's and RLF's original version

LABEL maintainer="Hailin Su <cbkmephisto@gmail.com>"

# Set when building on Travis so that certain long-running build steps can
# be skipped to shorten build time.
ARG TEST_ONLY_BUILD

USER root

# 12 and 4 are user input for answering questions asked by apt-get install
# 12 is for Country: U.S., 4 is for timezone: central
RUN echo "12" > inp &&\
    echo "4" >> inp &&\
    apt-get update &&\
    apt-get install --no-install-recommends -y python3-pip python3-setuptools python3-wheel \
    libc-dev libxt6 unzip wget make gcc jupyter-client jupyter-notebook < inp &&\
    rm -rf /var/lib/apt/lists/* inp

# install jupyterlab
RUN pip3 install jupyterlab
# When using a version of Jupyter Notebook earlier than 5.3, the following command must be run after installation to enable the JupyterLab server extension:
RUN jupyter serverextension enable --py jupyterlab --sys-prefix

# download and unpack julia standalone version, and make system-wide link
ENV JULIA_PKGDIR=/opt/julia
ENV JULIA_VERSION=1.0.0

RUN mkdir /opt/julia-${JULIA_VERSION} && \
    cd /tmp && \
    wget -q https://julialang-s3.julialang.org/bin/linux/x64/`echo ${JULIA_VERSION} | cut -d. -f 1,2`/julia-${JULIA_VERSION}-linux-x86_64.tar.gz && \
    echo "bea4570d7358016d8ed29d2c15787dbefaea3e746c570763e7ad6040f17831f3 *julia-${JULIA_VERSION}-linux-x86_64.tar.gz" | sha256sum -c - && \
    tar xzf julia-${JULIA_VERSION}-linux-x86_64.tar.gz -C /opt/julia-${JULIA_VERSION} --strip-components=1 && \
    rm /tmp/julia-${JULIA_VERSION}-linux-x86_64.tar.gz
RUN ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia

# less-prev user
RUN useradd -m jovyan
# Create JULIA_PKGDIR
RUN mkdir $JULIA_PKGDIR && chown -R jovyan $JULIA_PKGDIR

# init julia packages for less-prev user
USER jovyan

WORKDIR /home/jovyan

RUN echo 'using Pkg; Pkg.update(); \
    Pkg.add("IJulia"); \
    Pkg.add("JWAS"); \
    Pkg.add("XSim"); \
    Pkg.add("Gadfly");\
    Pkg.add("DataFrames"); Pkg.add("CSV");Pkg.add("DataFrames");Pkg.add("Distributions");\
    Pkg.add(PackageSpec(name="JWAS", rev="master"));\
    Pkg.add(PackageSpec(name="XSim", rev="master"));\ 
    println("==== initializing julia packages IJulia, JWAS (this will take a while without output)");\
    using IJulia; using JWAS; using Gadfly; using DataFrames; using CSV; using Distributions; println(" + [OK] finalizing...")' > install.jl &&\
    julia install.jl && rm install.jl

ADD --chown=jovyan:users ./notebooks /home/jovyan/notebooks

EXPOSE 8888/tcp
EXPOSE 8888/udp

CMD jupyter lab --no-browser --ip 0.0.0.0 --port 8888
