FROM continuumio/miniconda3:4.7.12

RUN conda install --yes \
    -c intel \
    python-blosc \
    cytoolz \
    dask \
    lz4 \
    nomkl \
    numpy \
    pandas \
    matplotlib \
    scipy \
    scikit-learn \
    pandas \
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

RUN pip install -U -q mlrun kfp

RUN conda update --all -c intel

COPY prepare.sh /usr/bin/prepare.sh

RUN mkdir /opt/app

ENTRYPOINT ["/bin/bash"]

#ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]
