FROM yjbds/mlrun-base:dev

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

RUN pip install --no-cache-dir -U -q kfserving

RUN pip install --no-cache-dir pyarrow==$PYARROW pandas==$PANDAS scikit-learn==$SKLEARN

RUN python -m pip install --no-cache-dir urllib3==1.24.3

COPY prepare.sh /usr/bin/prepare.sh

RUN mkdir /opt/app

ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]

