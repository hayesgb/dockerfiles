FROM continuumio/miniconda3:4.7.12

ARG pyarrow_v=0.15.1
ARG pandas_v=0.25.3
ARG numpy_v=1.18.1
ARG sklearn_v=0.22.1

ENV PYARROW=$pyarrow_v
ENV PANDAS=$pandas_v
ENV NUMPY=$numpy_v
ENV SKLEARN=$sklearn_v

RUN conda install --yes \
    python-blosc \
    cytoolz \
    lz4 \
    pillow \
    cloudpickle \
    joblib \
    dill \
    lxml \
    h5py \
    tini==0.18.0 \
    && conda clean -tipsy \
    && find /opt/conda/ -type f,l -name '*.a' -delete \
    && find /opt/conda/ -type f,l -name '*.pyc' -delete \
    && find /opt/conda/ -type f,l -name '*.js.map' -delete \
    && rm -rf /opt/conda/pkgs

RUN pip install --no-cache-dir -U -q mlrun kfp 

RUN pip install --no-cache-dir -U -q kfserving

RUN pip install --no-cache-dir pyarrow==$PYARROW pandas==$PANDAS scikit-learn==$SKLEARN

RUN python -m pip install --no-cache-dir https://github.com/urllib3/urllib3/archive/1.24.3.tar.gz

COPY prepare.sh /usr/bin/prepare.sh

RUN mkdir /opt/app

ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]

