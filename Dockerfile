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

ENV PYARROW=$pyarrow_v
ENV PANDAS=$pandas_v
ENV TENSORFLOW=$tensorflow_v
ENV SKLEARN=$sklearn_v
ENV BLOSC=$blosc_v
ENV MSGPACK=$msgpack_v
ENV LZ4=$lz4_v


