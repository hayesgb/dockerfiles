FROM continuumio/miniconda3:4.7.12

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

RUN pip install --no-cache-dir -U -q mlrun kfp

RUN conda update --all -c intel -q -y 

RUN conda update --no-deps -q -y scikit-learn

# min requirement to sync yjbds/mlrun-files and yjbds/mlrun-ds
RUN pip install --no-cache-dir pyarrow==0.15.1 pandas==0.25.3

RUN mkdir /opt/app

ENTRYPOINT ["/bin/bash"]
