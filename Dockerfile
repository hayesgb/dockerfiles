FROM continuumio/miniconda3:4.7.12

MAINTAINER yashab@iguazio.com

# problematic packages / versions
ARG pyarrow_v=0.15.1
ARG pandas_v=0.25.3
ARG tensorflow_v=2.1.0
ARG sklearn_v=0.22.1
ARG blosc_v=1.8.3
ARG lz4_v=3.0.2
ARG msgpack_v=0.6.2
ARG urllib3_v=1.24.3
ARG tini_v=0.18.0
ARG imblearn_v=bea191528b78266f8d173fdccc522b51b8738ea4

ENV PYARROW=$pyarrow_v
ENV PANDAS=$pandas_v
ENV TENSORFLOW=$tensorflow_v
ENV SKLEARN=$sklearn_v
ENV BLOSC=$blosc_v
ENV MSGPACK=$msgpack_v
ENV LZ4=$lz4_v
ENV URLLIB3=$urllib3_v
ENV TINI=$tini_v
ENV IMBLEARN=$imblearn_v

RUN apt update \
 && apt -y upgrade \
 && apt -y install build-essential \
 && apt -y install ca-certificates \
 && update-ca-certificates --fresh

ENV SSL_CERT_DIR /etc/ssl/certs

# min requirement to sync yjbds/mlrun-files and yjbds/mlrun-intel, yjbds/mlrun-dask-boost
RUN python -m pip install --no-cache-dir pyarrow==$PYARROW

# package complaints
RUN python -m pip install -q urllib3==$URLLIB3

# need these for serialization, distributed computing
RUN python -m pip install --no-cache-dir -U -q blosc lz4==$LZ4 msgpack==$MSGPACK

# ml/ai pipelines
RUN python -m pip install --no-cache-dir -U -q kfp
RUN python -m pip install --no-cache-dir -q git+https://github.com/mlrun/mlrun.git@development

