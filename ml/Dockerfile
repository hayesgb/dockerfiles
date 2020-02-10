FROM yjbds/mlrun-base:dev

MAINTAINER yashab@iguazio.com

RUN conda install -n base intelpython3_full python=3

RUN conda install -n base daal4py

RUN conda install -n base lightgbm xgboost

RUN conda update --all -q -y

RUN pip install pandas==0.25.3

ENV USE_DAAL4PY_SKLEARN YES

RUN conda clean -tipsy \
    && find /opt/conda/ -type f,l -name '*.a' -delete \
    && find /opt/conda/ -type f,l -name '*.pyc' -delete \
    && find /opt/conda/ -type f,l -name '*.js.map' -delete \
    && rm -rf /opt/conda/pkgs
