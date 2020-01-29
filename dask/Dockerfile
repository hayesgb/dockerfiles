FROM yjbds/mlrun-base:latest

MAINTAINER yashab@iguazio.com

RUN conda install --yes \
    -c intel \
    bokeh \
    cytoolz \
    dask \
    distributed \
    nomkl \
    numpy \
    pandas \
    matplotlib \
    scipy \
    scikit-learn \
    pyarrow \
    cloudpickle \
    joblib \
    dill \
    lxml \
    h5py \
    dask-ml \
    nltk \
    tensorflow \
    seaborn \
    lightgbm \
    xgboost \
    nose \
    tini==0.18.0 

RUN conda update --all -c intel -q -y

ENV USE_DAAL4PY_SKLEARN YES

RUN conda update --no-deps -q -y scikit-learn

RUN conda clean -tipsy \
    && find /opt/conda/ -type f,l -name '*.a' -delete \
    && find /opt/conda/ -type f,l -name '*.pyc' -delete \
    && find /opt/conda/ -type f,l -name '*.js.map' -delete \
    && find /opt/conda/lib/python*/site-packages/bokeh/server/static -type f,l -name '*.js' -not -name '*.min.js' -delete \
    && rm -rf /opt/conda/pkgs

RUN apt update && apt -y upgrade && apt -y install build-essential

RUN python -m pip install --no-cache-dir -U -q blosc lz4==$LZ4 msgpack==$MSGPACK

RUN python -m pip install --no-cache-dir -U -q kfp

RUN python -m pip install --no-cache-dir -q git+https://github.com/mlrun/mlrun.git@development

RUN python -m pip install --no-cache-dir -U -q dask-kubernetes

RUN python -m pip install --no-cache-dir -q git+https://github.com/dask/dask-xgboost.git

RUN python -m pip install --no-cache-dir -q git+https://github.com/dask/dask-lightgbm.git

RUN python -m pip install --no-cache-dir -q git+https://github.com/yzhao062/pyod.git

RUN python -m pip install --no-cache-dir -q git+https://github.com/scikit-learn-contrib/imbalanced-learn.git

# min requirement to sync yjbds/mlrun-files and yjbds/mlrun-ds
RUN python -m pip install --no-cache-dir pyarrow==$PYARROW pandas==$PANDAS

RUN conda clean -tipsy \
    && find /opt/conda/ -type f,l -name '*.a' -delete \
    && find /opt/conda/ -type f,l -name '*.pyc' -delete \
    && find /opt/conda/ -type f,l -name '*.js.map' -delete \
    && find /opt/conda/lib/python*/site-packages/bokeh/server/static -type f,l -name '*.js' -not -name '*.min.js' -delete \
    && rm -rf /opt/conda/pkgs

COPY prepare.sh /usr/bin/prepare.sh

RUN mkdir /opt/app

ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]
