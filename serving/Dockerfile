FROM continuumio/miniconda3:4.7.12

ARG pyarrow_v=0.15.1
ARG pandas_v=0.25.3
ARG tensorflow_v=2.1.0

ENV PYARROW=$pyarrow_v
ENV PANDAS=$pandas_v
ENV TENSORFLOW=$tensorflow_v

RUN conda install --yes \
    python-blosc \
    cytoolz \
    lz4 \
    numpy \
    pillow \
    scikit-learn \
    cloudpickle \
    joblib \
    dill \
    lxml \
    h5py \
    && conda clean -tipsy \
    && find /opt/conda/ -type f,l -name '*.a' -delete \
    && find /opt/conda/ -type f,l -name '*.pyc' -delete \
    && find /opt/conda/ -type f,l -name '*.js.map' -delete \
    && rm -rf /opt/conda/pkgs

RUN pip install -U -q mlrun kfp 

RUN pip install -U -q kfserving

RUN pip install pyarrow==$PYARROW pandas==$PANDAS tensorflow==$TENSORFLOW

RUN conda update --no-deps -q -y scikit-learn
