FROM yjbds/mlrun-base:dev

MAINTAINER yashab@iguazio.com

RUN conda install -n base intelpython3_full python=3

RUN conda install -n base daal4py

ARG GPU=0
ARG MPI=0

# xgboost
RUN mkdir /repos && \
    cd repos && \
    git clone --recursive https://github.com/dmlc/xgboost && \
    cd xgboost && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j$(nproc) && \
    make install && \
    cd ../python-package && \
    python -m pip install -e .

RUN cd /repos && \
    git clone --recursive https://github.com/microsoft/LightGBM && \
    cd LightGBM && \
    mkdir build && cd build && \
    cmake .. && \
# write condition GPU/MPI, each has own requirements
#   cmake -DUSE_MPI=ON ..
#   cmake -DUSE_GPU=1 .. # or -DOpenCL_LIBRARY=/usr/local/cuda/lib64/libOpenCL.so -DOpenCL_INCLUDE_DIR=/usr/local/cuda/include/ ..
    make -j$(nproc) && \
    make install && \
    cd ../python-package && \
    python -m pip install -e .

RUN conda update --all -q -y

RUN pip install pandas==0.25.3

ENV USE_DAAL4PY_SKLEARN YES

RUN conda clean -tipsy \
    && find /opt/conda/ -type f,l -name '*.a' -delete \
    && find /opt/conda/ -type f,l -name '*.pyc' -delete \
    && find /opt/conda/ -type f,l -name '*.js.map' -delete \
    && rm -rf /opt/conda/pkgs
