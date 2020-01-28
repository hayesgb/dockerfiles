FROM continuumio/miniconda3:4.7.12

ARG pyarrow_v=0.15.1
ARG pandas_v=0.25.3

ENV PYARROW=$pyarrow_v
ENV PANDAS=$pandas_v

RUN conda install --yes tini==0.18.0 \
    && conda clean -tipsy \
    && find /opt/conda/ -type f,l -name '*.a' -delete \
    && find /opt/conda/ -type f,l -name '*.pyc' -delete \
    && find /opt/conda/ -type f,l -name '*.js.map' -delete \
    && rm -rf /opt/conda/pkgs

RUN pip install -U -q --no-cache-dir pyarrow==$PYARROW pandas==$PANDAS numpy h5py joblib cloudpickle dill

RUN pip install --no-cache-dir -q git+https://github.com/mlrun/mlrun.git@development

COPY prepare.sh /usr/bin/prepare.sh

RUN mkdir /opt/app

ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]
