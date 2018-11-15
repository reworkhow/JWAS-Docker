ARG BASE_CONTAINER=jupyter/datascience-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Hao Cheng <qtlcheng@ucdavis.edu>"

# Add JWAS, XSim and PyPlot packages.
RUN	julia -e 'using Pkg; Pkg.update()' && \
	julia -e 'using Pkg; Pkg.add("PyPlot")' && \
	julia -e 'using Pkg; Pkg.add("Plots")' && \
	julia -e 'using Pkg; Pkg.add("DataFrames")' && \
	julia -e 'using Pkg; Pkg.add("CSV")' && \
	julia -e 'using Pkg; Pkg.add("Distributions")' && \
	julia -e 'using Pkg; Pkg.add("JWAS")' && \
	julia -e 'using Pkg; Pkg.add("XSim")' && \
        # Precompile JWAS  \
  	julia -e 'using Pkg; using JWAS' && \
  	julia -e 'using Pkg; using XSim' && \
  	julia -e 'using Pkg; using Plots' && \
	julia -e 'using Pkg; using CSV' && \
	julia -e 'using Pkg; using DataFrames' && \
	fix-permissions $JULIA_PKGDIR $CONDA_DIR/share/jupyter

ADD --chown=jovyan:users ./notebooks /home/jovyan/notebooks
