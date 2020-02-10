FROM continuumio/miniconda3:4.7.12

MAINTAINER yashab@iguazio.com

RUN apt update -qqq \
 && apt -y upgrade \
 && apt -y install build-essential \
 && apt -y install ca-certificates \
 && update-ca-certificates --fresh \
 && apt autoremove

ENV SSL_CERT_DIR /etc/ssl/certs

RUN conda update conda && \
    conda config --add channels intel && \
    conda config --add channels conda-forge && \
    conda init bash && \
    conda install -n base intelpython3_core python=3 h5py joblib \
	dill cloudpickle pyarrow python-blosc lz4 msgpack-python fsspec

# ml/ai pipelines
RUN conda install -n base kfp

SHELL ["conda", "run", "-n", "base", "/bin/bash", "-c"]

RUN python -m pip install git+https://github.com/mlrun/mlrun.git@development

# Add Tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]
