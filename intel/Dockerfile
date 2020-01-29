FROM yjbds/mlrun-base:dev

MAINTAINER yashab@iguazio.com

RUN conda config --add channels intel \
 && conda install intelpython3_full python=3 \
 && conda install cloudpickle

RUN conda update --all -c intel -q -y

ENV USE_DAAL4PY_SKLEARN YES

RUN conda clean -tipsy \
    && find /opt/conda/ -type f,l -name '*.a' -delete \
    && find /opt/conda/ -type f,l -name '*.pyc' -delete \
    && find /opt/conda/ -type f,l -name '*.js.map' -delete \
    && rm -rf /opt/conda/pkgs
