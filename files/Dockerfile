FROM yjbds/mlrun-base:dev

RUN pip install -U -q --no-cache-dir h5py joblib dill

COPY prepare.sh /usr/bin/prepare.sh

RUN mkdir /opt/app

ENTRYPOINT ["tini", "-g", "--", "/usr/bin/prepare.sh"]
