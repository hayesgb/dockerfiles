FROM continuumio/miniconda3:4.7.12

MAINTAINER yashab@iguazio.com

RUN apt update -qqq \
 && apt -y upgrade \
 && apt install -yq --no-install-recommends build-essential graphviz cmake \
 && apt install -y ca-certificates \
 && update-ca-certificates --fresh \
 && apt clean \
 && apt autoremove \
 && rm -rf /var/lib/apt/lists/*

ENV SSL_CERT_DIR /etc/ssl/certs

RUN conda update conda && \
    conda config --add channels intel && \
    conda config --add channels conda-forge && \
    conda init bash && \
    conda install -n base intelpython3_core python=3 h5py joblib \
	dill cloudpickle pyarrow python-blosc lz4 msgpack-python fsspec \
        tini==0.18.0 cytoolz nomkl python-graphviz

# ml/ai pipelines
RUN conda install -n base kfp

SHELL ["conda", "run", "-n", "base", "/bin/bash", "-c"]

RUN python -m pip install git+https://github.com/mlrun/mlrun.git@development

COPY prepare.sh /usr/bin/prepare.sh

RUN mkdir /opt/app

ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]
