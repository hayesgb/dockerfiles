FROM yjbds/mlrun_dev-intel:latest

MAINTAINER yashab@iguazio.com

RUN conda install -y -c intel -c conda-forge \
    dask \
    distributed \
    dask-ml \
    lightgbm \
    xgboost \
    nose

RUN python -m pip install --no-cache-dir -U -q dask-kubernetes

RUN python -m pip install --no-cache-dir -q git+https://github.com/dask/dask-xgboost.git

RUN python -m pip install --no-cache-dir -q git+https://github.com/dask/dask-lightgbm.git

RUN python -m pip install --no-cache-dir -q git+https://github.com/yzhao062/pyod.git

# requires scikit learn >= 0.22, parameter enhancements to sklearn algos....
# RUN python -m pip install --no-cache-dir -q git+https://github.com/scikit-learn-contrib/imbalanced-learn.git
# last commit for sklearn >= 0.21
RUN python -m pip install --no-cache-dir -q git+https://github.com/scikit-learn-contrib/imbalanced-learn.git@$IMBLEARN

COPY prepare.sh /usr/bin/prepare.sh

ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]

