# original modified "smallest Docker image with Python 3.7" at
# https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/blob/master/Dockerfile
# 27-1-2020: added pandas numpy pyarrow fastparquet

FROM python:3.7.6-alpine3.11

# This hack is widely applied to avoid python printing issues in docker containers.
# See: https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/pull/13
ENV PYTHONUNBUFFERED=1

RUN echo "**** install Python ****" && \
    apk add --no-cache alpine-sdk && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    \
    echo "**** install pip ****" && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi

RUN apk update && \
    apk add --virtual build-dependencies build-base gcc wget git llvm-dev alpine-sdk

RUN pip install llvmlite 

RUN pip install numba

RUN pip install numpy pandas==0.25.3 pyarrow==0.15.1 fastparquet==0.3.2

ENTRYPOINT ["/bin/bash"]
