FROM continuumio/miniconda3:4.7.12

ARG pyarrow_v=0.15.1
ARG pandas_v=0.25.3
ARG numpy_v=1.18.1

ENV PYARROW=$pyarrow_v
ENV PANDAS=$pandas_v
ENV NUMPY=$numpy_v

RUN conda install --yes -c intel \
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

RUN pip install --no-cache-dir -U -q mlrun kfp 

RUN pip install --no-cache-dir -U -q kfserving

RUN pip install --no-cache-dir pyarrow==$PYARROW pandas==$PANDAS

RUN conda update --no-deps -q -y scikit-learn

COPY prepare.sh /usr/bin/prepare.sh

RUN mkdir /opt/app

ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]

