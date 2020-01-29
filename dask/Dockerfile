FROM continuumio/miniconda3:4.7.12

ARG pyarrow_v=0.15.1
ARG pandas_v=0.25.3
ARG tensorflow_v=2.1.0
ARG sklearn_v=0.22.1

ENV PYARROW=$pyarrow_v
ENV PANDAS=$pandas_v
ENV TENSORFLOW=$tensorflow_v
ENV SKLEARN=$sklearn_v

RUN conda install --yes \
    -c intel \
    python-blosc \
    cytoolz \
    dask \
    distributed \
    lz4 \
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
    tini==0.18.0 \
    && conda clean -tipsy \
    && find /opt/conda/ -type f,l -name '*.a' -delete \
    && find /opt/conda/ -type f,l -name '*.pyc' -delete \
    && find /opt/conda/ -type f,l -name '*.js.map' -delete \
    && find /opt/conda/lib/python*/site-packages/bokeh/server/static -type f,l -name '*.js' -not -name '*.min.js' -delete \
    && rm -rf /opt/conda/pkgs

RUN pip install --no-cache-dir -U -q kfp

RUN python -m pip install --no-cache-dir -q git+https://github.com/mlrun/mlrun.git@development

RUN conda update --all -c intel -q -y 

RUN conda update --no-deps -q -y scikit-learn

RUN python -m pip install --no-cache-dir -U -q dask-kubernetes

RUN python -m pip install --no-cache-dir -q git+https://github.com/dask/dask-xgboost.git

RUN python -m pip install --no-cache-dir -q git+https://github.com/dask/dask-lightgbm.git

RUN python -m pip install --no-cache-dir -q git+https://github.com/yzhao062/pyod.git

RUN python -m pip install --no-cache-dir -q git+https://github.com/scikit-learn-contrib/imbalanced-learn.git

# min requirement to sync yjbds/mlrun-files and yjbds/mlrun-ds
RUN python -m pip install --no-cache-dir pyarrow==$PYARROW pandas==$PANDAS

RUN python -m pip install --no-cache-dir https://github.com/urllib3/urllib3/archive/1.24.3.tar.gz

COPY prepare.sh /usr/bin/prepare.sh

RUN mkdir /opt/app

ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]
