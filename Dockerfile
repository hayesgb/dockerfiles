FROM python:3.7-alpine3.8

RUN apk update \
    && apk upgrade \
    && apk add --no-cache build-base \
            cmake \
            bash \
            boost-dev \
            autoconf \
            zlib-dev \
            libressl-dev \
            flex \
            bison \
    && pip install six pytest numpy cython pandas 

ARG ARROW_BUILD_TYPE=release

ENV ARROW_HOME=/usr/local \
    PARQUET_HOME=/usr/local 

RUN mkdir -p /arrow \
    && apk add --no-cache curl \
    && curl -o /tmp/apache-arrow.zip -SL https://codeload.github.com/apache/arrow/zip/master \
    && unzip /tmp/apache-arrow.zip \
    && mv arrow-master/* /arrow/ \
    && mkdir -p /arrow/cpp/build \
    && cd /arrow/cpp/build \
    && cmake -DCMAKE_BUILD_TYPE=$ARROW_BUILD_TYPE \
          -DOPENSSL_ROOT_DIR=/usr/local/ssl \
          -DCMAKE_INSTALL_LIBDIR=lib \
          -DCMAKE_INSTALL_PREFIX=$ARROW_HOME \
          -DARROW_WITH_BZ2=ON \
          -DARROW_WITH_ZLIB=ON \
          -DARROW_WITH_ZSTD=ON \
          -DARROW_WITH_LZ4=ON \
          -DARROW_WITH_SNAPPY=ON \
          -DARROW_PARQUET=ON \
          -DARROW_PYTHON=ON \
          -DARROW_PLASMA=ON \
          -DARROW_BUILD_TESTS=OFF \
          .. \
    && make -j$(nproc) \
    && make install \
    && cd /arrow/python \
    && python setup.py build_ext --build-type=$ARROW_BUILD_TYPE --with-parquet \
    && python setup.py install \
    && rm -rf /arrow /tmp/apache-arrow.tar.gz
