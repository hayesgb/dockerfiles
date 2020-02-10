FROM yjbds/mlrun-ml:dev

MAINTAINER yashab@iguazio.com

RUN conda install -y \
    dask \
    distributed \
    dask-ml \
    dask-kubernetes \
    dask-xgboost \
    fsspec

RUN conda install -y -c bokeh bokeh


RUN python -m pip install --no-cache-dir -q git+https://github.com/dask/dask-lightgbm.git
