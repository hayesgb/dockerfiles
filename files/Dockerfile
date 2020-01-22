FROM continuumio/miniconda3:4.7.12

RUN conda clean -tipsy \
    && find /opt/conda/ -type f,l -name '*.a' -delete \
    && find /opt/conda/ -type f,l -name '*.pyc' -delete \
    && find /opt/conda/ -type f,l -name '*.js.map' -delete \
    && rm -rf /opt/conda/pkgs

RUN pip install -U -q --no-cache-dir pyarrow pandas numpy h5py joblib cloudpickle dill

RUN pip install -U -q --no-cache-dir mlrun kfp kfserving azure

RUN mkdir /opt/app

ENTRYPOINT ["/bin/bash"]
