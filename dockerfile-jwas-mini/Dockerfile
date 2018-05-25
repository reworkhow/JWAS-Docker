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
    apt-get install --no-install-recommends -y \
    libc-dev libxt6 unzip wget make gcc jupyter-client jupyter-notebook < inp &&\
    rm -rf /var/lib/apt/lists/* inp

ENV JULIA_PKGDIR=/opt/julia
ENV JULIA_VERSION=0.6.2

# download and unpack julia standalone version, and make system-wide link
RUN mkdir /opt/julia-${JULIA_VERSION} && \
    cd /tmp && \
    wget -q https://julialang-s3.julialang.org/bin/linux/x64/`echo ${JULIA_VERSION} | cut -d. -f 1,2`/julia-${JULIA_VERSION}-linux-x86_64.tar.gz && \
    echo "dc6ec0b13551ce78083a5849268b20684421d46a7ec46b17ec1fab88a5078580 *julia-${JULIA_VERSION}-linux-x86_64.tar.gz" | sha256sum -c - && \
    tar xzf julia-${JULIA_VERSION}-linux-x86_64.tar.gz -C /opt/julia-${JULIA_VERSION} --strip-components=1 && \
    rm /tmp/julia-${JULIA_VERSION}-linux-x86_64.tar.gz
RUN ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia

# less-prev user
RUN useradd -m ubuntu
# Create JULIA_PKGDIR
RUN mkdir $JULIA_PKGDIR && chown -R ubuntu $JULIA_PKGDIR

# init julia packages for less-prev user
USER ubuntu

WORKDIR /home/ubuntu

RUN echo 'Pkg.init();Pkg.update(); Pkg.add("IJulia"); \
    Pkg.add("JWAS"); Pkg.add("XSim"); Pkg.checkout("JWAS"); Pkg.checkout("XSim"); \
    Pkg.add("GR");Pkg.add("UnicodePlots");Pkg.add("Plots");\
    println("==== initializing julia packages IJulia, JWAS, and XSim (this will take a while without output)");\
    using IJulia;using JWAS;using XSim;using Plots;println(" + [OK] finalizing...")' > install.jl &&\
    julia install.jl && rm install.jl

ADD --chown=ubuntu:users notebooks /home/ubuntu/notebooks

EXPOSE 8888/tcp
EXPOSE 8888/udp

CMD jupyter notebook --no-browser --ip 0.0.0.0 --port 8888

RUN echo '\n\ndocker run -it --rm -p 8888:8888 qtlrocks/jwas-docker\n\n'
